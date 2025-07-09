@import java.time.format.DateTimeFormatter
@param java.util.List<de.feuerwehr.cronenberg.webcms.model.News> newsList
@param boolean success

@template.layout.layout(
title = "News verwalten | Feuerwehr Cronenberg",
banner = null,
content = @`
    <section class="admin-panel">
        <h1 class="heading">News verwalten</h1>

        <a href="/admin/news/new" class="btn">+ Neuer Artikel</a>

        @if(success)
            <p class="success-message">Änderungen wurden erfolgreich übernommen.</p>

        @endif

        <div class="news-admin-table">
            @for (de.feuerwehr.cronenberg.webcms.model.News news : newsList)
                <div class="news-row">
                    <div class="news-info">
                        <strong>${news.getTitel()}</strong><br>
                        <small>
                            ${news.getDatum() != null
                                ? news.getDatum().format(DateTimeFormatter.ofPattern("dd.MM.yyyy, HH:mm"))
                                : "Kein Datum"}
                        </small>
                    </div>
                    <div class="news-actions">
                        <a href="/admin/news/edit/${news.getId()}" class="btn small">Bearbeiten</a>
                        <form method="post" action="/admin/news/delete/${news.getId()}" style="display:inline;" onsubmit="return confirm('Wirklich löschen?');">
                            <button type="submit" class="btn small danger">Löschen</button>
                        </form>
                        <form method="post" action="/admin/news/toggleVisibility/${news.getId()}" style="display:inline;">
                            <button type="submit" class="btn small">
                                ${news.isVisible() ? "Verstecken" : "Sichtbar machen"}
                            </button>
                        </form>
                    </div>
                </div>
            @endfor
        </div>
    </section>

    <style>
        .news-admin-table {
            margin-top: 2em;
            display: flex;
            flex-direction: column;
            gap: 1em;
        }
        .news-row {
            padding: 1em;
            border: 1px solid #ddd;
            border-radius: 8px;
            background: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .news-info {
            flex: 1;
        }
        .news-actions {
            display: flex;
            gap: 0.5em;
        }
        .btn.small {
            padding: 0.3em 0.6em;
            font-size: 0.85em;
        }
        .btn.danger {
            background: #c00;
            color: white;
        }
    </style>
`
)
