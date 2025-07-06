@param de.feuerwehr.cronenberg.webcms.model.StartseitenContent content
@param boolean success

@template.layout.layout(
title = "Inhalte bearbeiten",
banner = null,
content = @`
<section class="admin-panel">
    <h1 class="heading">Startseiten-Inhalte bearbeiten</h1>

    <form method="post" action="/admin/inhalte" class="form-style">
        <label for="willkommenstext">Willkommenstext:</label>
        <textarea name="willkommenstext" id="willkommenstext" rows="8" required>${content.willkommenstext}</textarea>

        <label for="image1">Bild 1 (Pfad):</label>
        <input type="text" name="image1" id="image1" value="${content.image1}" required />

        <label for="image2">Bild 2 (Pfad):</label>
        <input type="text" name="image2" id="image2" value="${content.image2}" required />

        <button type="submit" class="btn">Speichern</button>
    </form>

    @if(success) {
    <p class="success-message">Änderungen wurden gespeichert.</p>
    }
    @endif
        </section>
        `
        )
