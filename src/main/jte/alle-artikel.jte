@import java.time.format.DateTimeFormatter
@param java.util.List<de.feuerwehr.cronenberg.webcms.model.News> newsList

@template.layout.layout(
title = "Alle Artikel | Feuerwehr Cronenberg",
banner = null,
content = @`

    <section role="main" id="content">
    <div class="mod_article first last block" id="news">
    <div class="mod_newslist block">
    <h1>News</h1>

    @for (de.feuerwehr.cronenberg.webcms.model.News news : newsList)
        <div class="layout_short arc_2 block @(newsList.indexOf(news) % 2 == 0 ? "even" : "odd")">
        <p class="info">
            <time datetime="${news.getDatum().toString()}">
                ${news.getDatum().format(DateTimeFormatter.ofPattern("dd.MM.yyyy, HH:mm"))}
            </time>
        </p>

        <h2>
            <a href="/news-detail/${news.getId()}" title="Den Artikel lesen: ${news.getTitel()}">
                ${news.getTitel()}
            </a>
        </h2>

        <div class="teaser">
        <p>
        @if (news.getBildPfad() != null) {
            <img src="${news.getBildPfad()}" alt="" width="424" height="600" />
            }
            @endif
            ${news.getTeaserText()}
            </p>
            </div>

            <p class="more">
                <a href="/news-detail/${news.getId()}" title="Den Artikel lesen: ${news.getTitel()}">
                    Weiterlesen …<span class="invisible"> ${news.getTitel()}</span>
                </a>
            </p>
            </div>
            @endfor

            </div>
            </div>
            </section>

            `
            )
