@import de.feuerwehr.cronenberg.webcms.model.HomeSlide
@import java.util.List
@param List<HomeSlide> slides

@template.layout.layout(
title = "Slider verwalten",
banner = null,
content = @`
    <section class="admin-panel">
        <h1 class="heading">Slider verwalten</h1>

        <a href="/admin/slider/new" class="btn">Neuen Slide hinzufügen</a>

        <table class="form-style">
            <thead>
            <tr>
                <th>Titel</th>
                <th>Bild</th>
                <th>Sichtbar</th>
                <th>Aktion</th>
            </tr>
            </thead>
            <tbody>
            @for(HomeSlide slide : slides) {
                <tr>
                    <td>${slide.getTitel()}</td>
                    <td>
                        @if(slide.getImageUrl() != null && !slide.getImageUrl().isEmpty()) {
                            <img src="${slide.getImageUrl()}" style="height: 60px;" />
                            }
                        @endif
                    </td>
                    <td>
                        @if(slide.isSichtbar()) {
                            Ja
                            } @else {
                            Nein
                            }
                        @endif
                    </td>
                    <td>
                        <a class="btn" href="/admin/slider/edit/${slide.getId()}">Bearbeiten</a>
                        <form method="post" action="/admin/slider/delete/${slide.getId()}" style="display:inline;">
                            <button type="submit" class="btn delete">Löschen</button>
                        </form>
                    </td>
                </tr>
                }
            @endfor
            </tbody>
        </table>
    </section>
`
)
