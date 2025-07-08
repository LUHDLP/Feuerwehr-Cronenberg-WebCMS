@import de.feuerwehr.cronenberg.webcms.model.News
@import java.util.List
@import java.time.format.DateTimeFormatter

@param de.feuerwehr.cronenberg.webcms.model.StartseitenContent content
@param List<News> newsList

@template.layout.layout(
title = "Startseite | Feuerwehr Cronenberg",
banner = null,
content = @`

    <div id="home-slider-wrap">
        <div class="mod_rocksolid_slider block rsts-main rsts-direction-x rsts-type-slide rsts-skin-default rsts-no-touch">
            <div class="rsts-view">
                <div class="rsts-crop">
                    <div class="rsts-slides">
                        <div class="rsts-slide rsts-slide-default rsts-active">
                            <div data-rsts-name="Mannschaftsfoto neu">
                                <div class="home-slide ce_rsce_aurelium_home_slide">
                                    <div class="image-wrap">
                                        <img src="${content.getImage1()}" alt="Mannschaftsfoto" width="816" height="577">
                                    </div>
                                    <div class="text-wrap">
                                        <section></section>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="rsts-slide rsts-slide-default rsts-inactive">
                            <div data-rsts-name="Willkommen">
                                <div class="home-slide ce_rsce_aurelium_home_slide">
                                    <div class="image-wrap">
                                        <img src="${content.getImage2()}" alt="Willkommen" width="816" height="577">
                                    </div>
                                    <div class="text-wrap">
                                        <section>
                                            <h1>Willkommen</h1>
                                            <p>${content.getWillkommenstext()}</p>
                                        </section>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <a href="#" class="rsts-prev"><span class="rsts-prev-label">Previous</span></a>
                    <a href="#" class="rsts-next"><span class="rsts-next-label">Next</span></a>
                </div>
            </div>

            <div class="rsts-nav rsts-nav-bullets">
                <ul>
                    <li class="rsts-nav-item"><a href="#" class="active">Mannschaftsfoto neu</a></li>
                    <li class="rsts-nav-item"><a href="#">Willkommen</a></li>
                    <li class="rsts-nav-item"><a href="#">Galerie ehemaliger Fahrzeuge</a></li>
                    <li class="rsts-nav-item"><a href="#">Chronik</a></li>
                    <li class="rsts-nav-item"><a href="#">Facebook</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div id="wrapper-home">
        <div class="mod_article first last block" id="startseite">

            <div class="mod_newslist teaser-boxes-news block">
                <h1>News &amp; Aktuelles</h1>

                @for (News news : newsList)
                    <a href="/news-detail/${news.getId()}" class="box">
                        <img src="${news.getBildPfad()}" width="283" height="400" alt="">
                        <i>${news.getDatum().format(DateTimeFormatter.ofPattern("dd. MMMM yyyy"))}</i>
                        <b><span>${news.getTitel()}</span></b>
                    </a>
                @endfor
            </div>

            <div class="ce_text teaser-text last block">
                <h2>Herzlich Willkommen</h2>
                <p>
                    ${content.getWillkommenstext()}
                </p>
            </div>

        </div>
    </div>
`
)
