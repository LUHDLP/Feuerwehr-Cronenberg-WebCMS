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
                                        <img src="@content.image1" alt="Mannschaftsfoto" width="816" height="577">
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
                                        <img src="@content.image2" alt="Willkommen" width="816" height="577">
                                    </div>
                                    <div class="text-wrap">
                                        <section>
                                            <h1>Willkommen</h1>
                                            <p>Schön, dass Sie den Weg auf unsere Seite gefunden haben. Wir wünschen Ihnen viel Spaß beim Stöbern!</p>
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

                <!-- Aktuell noch fest – später auch aus DB -->
                <a href="/news-detail/feuerwehrfest-2025" class="box">
                    <img src="/images/news/feuerwehrfest2025.jpg" width="283" height="400" alt="">
                    <i>08. Mai 2025</i>
                    <b><span>Feuerwehrfest 2025</span></b>
                </a>
                <a href="/news-detail/infobrief" class="box">
                    <img src="/images/news/infobrief.png" width="400" height="400" alt="">
                    <i>17. Dezember 2024</i>
                    <b><span>Infobrief des Fördervereins</span></b>
                </a>
                <!-- Weitere News-Boxen folgen -->
            </div>

            <div class="ce_text teaser-text last block">
                <h2>Herzlich Willkommen</h2>
                <p>
                    @content.willkommenstext
                </p>
            </div>

        </div>
    </div>
`
)


