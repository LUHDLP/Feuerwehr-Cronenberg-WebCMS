@import de.feuerwehr.cronenberg.webcms.model.HomeSlide
@import de.feuerwehr.cronenberg.webcms.model.News
@import java.util.List
@import java.time.format.DateTimeFormatter

@param de.feuerwehr.cronenberg.webcms.model.StartseitenContent content
@param List<News> newsList
@param List<de.feuerwehr.cronenberg.webcms.model.HomeSlide> slides


@template.layout.layout(
title = "Startseite | Feuerwehr Cronenberg",
banner = null,
content = @`

    @if(content.image1 != null && !content.image1.isEmpty())
        <div class="hero-background" style="background-image: url('${content.image1}');">
            <div class="hero-text">Willkommen</div>
        </div>
    @endif


    <section class="hero-slider">
        <div class="rsts-main rsts-direction-x rsts-type-slide rsts-skin-default rsts-no-touch">
            <div class="rsts-view">
                <div class="rsts-crop">
                    <div class="rsts-slides cube-wrapper" id="cube">
                        @for(HomeSlide slide : slides)
                            <div class="rsts-slide rsts-slide-default cube-face">
                                <div class="slide-inner">
                                    <div data-rsts-name="${slide.getTitel()}">
                                        <div class="home-slide ce_rsce_aurelium_home_slide">
                                            <div class="image-wrap">
                                                <img src="${slide.getImageUrl()}" alt="${slide.getTitel()}" loading="eager" />
                                            </div>
                                            <div class="text-wrap">
                                                <section>
                                                    <h1>${slide.getTitel()}</h1>
                                                    <p>${slide.getText()}</p>
                                                    @if(slide.getLinkUrl() != null && !slide.getLinkUrl().isEmpty()) {
                                                        <a href="${slide.getLinkUrl()}" class="btn">${slide.getLinkText()}</a>
                                                        }
                                                    @endif
                                                </section>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        @endfor
                    </div>

                    <div class="rsts-prev">←</div>
                    <div class="rsts-next">→</div>

                </div>
            </div>

            <div class="rsts-nav rsts-nav-bullets">
                <ul>
                    @for(HomeSlide slide : slides)
                        <li class="rsts-nav-item"><a href="#">${slide.getTitel()}</a></li>
                    @endfor
                </ul>
            </div>
        </div>
    </section>


    <section class="news-section">
        <h1 class="section-heading">News & Aktuelles</h1>
        <div class="news-grid">
            @for (News news : newsList)
                <div class="news-card">
                    <div class="news-image">
                        <img src="${news.getBildPfad()}" alt="${news.getTitel()}">
                    </div>
                    <div class="news-meta">
                        <span class="news-date">${news.getDatum().format(DateTimeFormatter.ofPattern("dd. MMMM yyyy"))}</span>
                        <h2 class="news-title">${news.getTitel()}</h2>
                        <a href="/news-detail/${news.getId()}" class="news-button">Mehr erfahren</a>
                    </div>
                </div>
            @endfor
        </div>
    </section>

    <section class="welcome-box">
        <h2 class="section-heading">Herzlich Willkommen</h2>
        <div class="welcome-text">
            <p style="white-space: pre-wrap;">${content.getWillkommenstext()}</p>
        </div>
    </section>


    @raw
    <script>
        document.addEventListener("DOMContentLoaded", () => {
            let currentSlide = 0;
            const cube = document.getElementById("cube");
            const totalSlides = cube.querySelectorAll('.cube-face').length;

            function rotateCube(index) {
                const angle = -90 * index;
                cube.style.transform = 'rotateY(' + angle + 'deg)';
            }

            const nextBtn = document.querySelector('.rsts-next');
            const prevBtn = document.querySelector('.rsts-prev');

            if (nextBtn && prevBtn) {
                nextBtn.addEventListener('click', () => {
                    currentSlide = (currentSlide + 1) % totalSlides;
                    rotateCube(currentSlide);
                });

                prevBtn.addEventListener('click', () => {
                    currentSlide = (currentSlide - 1 + totalSlides) % totalSlides;
                    rotateCube(currentSlide);
                });
            }
        });
    </script>
    @endraw
`
)
