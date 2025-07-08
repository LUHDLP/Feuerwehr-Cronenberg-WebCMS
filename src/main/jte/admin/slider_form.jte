@import de.feuerwehr.cronenberg.webcms.model.HomeSlide
@param HomeSlide slide

@template.layout.layout(
title = "Slide bearbeiten",
banner = null,
content = @`
    <section class="admin-panel">
        <h1 class="heading">Slide bearbeiten</h1>

        <form method="post" action="/admin/slider/save" enctype="multipart/form-data" class="form-style">
            <input type="hidden" name="id" value="${slide.getId()}" />

            <label for="titel">Titel:</label>
            <input type="text" name="titel" id="titel" value="${slide.getTitel()}" required />

            <label for="text">Text:</label>
            <textarea name="text" id="text">${slide.getText()}</textarea>

            <label for="linkText">Link-Text:</label>
            <input type="text" name="linkText" id="linkText" value="${slide.getLinkText()}" />

            <label for="linkUrl">Link-URL:</label>
            <input type="url" name="linkUrl" id="linkUrl" value="${slide.getLinkUrl()}" />

            <label for="imageFile">Bild:</label>
            <input type="file" name="imageFile" id="imageFile" />
            @if(slide.getImageUrl() != null && !slide.getImageUrl().isEmpty()) {
                <img src="${slide.getImageUrl()}" style="max-height: 120px; margin-top: 10px;" />
                }
            @endif

            <label for="sichtbar">Sichtbar:</label>
            @if(slide.isSichtbar()) {
                <input type="checkbox" name="sichtbar" id="sichtbar" checked />
                } @else {
                <input type="checkbox" name="sichtbar" id="sichtbar" />
                }
            @endif

            <button type="submit" class="btn">Speichern</button>
        </form>
    </section>
`
)
