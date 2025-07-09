@import de.feuerwehr.cronenberg.webcms.model.HomeSlide
@import java.util.List
@param List<HomeSlide> slides

@template.layout.layout(
title = "Slider verwalten",
banner = null,
content = @`
    <section class="admin-panel">
        <h1 class="heading">Slider verwalten</h1>

        <a href="/admin/slider/new" class="btn">+ Neuer Slide</a>

        <div class="slider-grid">
            @for(HomeSlide slide : slides)
                <div class="slider-card">
                    <div class="slider-info">
                        <strong>${slide.getTitel()}</strong><br/>
                        @if(slide.isSichtbar())
                            <span class="badge green">Sichtbar</span>
                        @else
                            <span class="badge gray">Versteckt</span>
                        @endif
                    </div>
                    <div class="slider-preview">
                        @if(slide.getImageUrl() != null && !slide.getImageUrl().isEmpty())
                            <img src="${slide.getImageUrl()}" alt="Vorschau" />
                        @endif
                    </div>
                    <div class="slider-actions">
                        <a href="/admin/slider/edit/${slide.getId()}" class="btn small">Bearbeiten</a>
                        <form method="post" action="/admin/slider/delete/${slide.getId()}" style="display:inline;">
                            <button type="submit" class="btn small danger">Löschen</button>
                        </form>
                    </div>
                </div>
            @endfor
        </div>
    </section>

    <style>
        .slider-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 1.5em;
            margin-top: 2em;
        }

        .slider-card {
            background-color: var(--feuer-grau);
            padding: 1.2em;
            border-radius: 1em;
            box-shadow: 0 0 10px rgba(0,0,0,0.4);
            display: flex;
            flex-direction: column;
            gap: 1em;
        }

        .slider-info strong {
            color: var(--feuer-gelb);
            font-size: 1.1em;
        }

        .badge {
            display: inline-block;
            font-size: 0.85em;
            font-weight: bold;
            padding: 0.3em 0.6em;
            border-radius: 0.4em;
            margin-top: 0.3em;
        }
        .badge.green {
            background-color: #2e7d32;
            color: white;
        }
        .badge.gray {
            background-color: #777;
            color: white;
        }

        .slider-preview img {
            width: 100%;
            max-height: 150px;
            object-fit: cover;
            border-radius: 0.6em;
        }

        .slider-actions {
            display: flex;
            gap: 0.5em;
            flex-wrap: wrap;
        }

        .btn.small {
            padding: 0.4em 0.8em;
            font-size: 0.85em;
        }

        .btn.danger {
            background-color: #b00000;
        }
    </style>
`
)
