@param de.feuerwehr.cronenberg.webcms.model.StartseitenContent content
@param boolean success

@template.layout.layout(
title = "Startseite bearbeiten",
banner = null,
content = @`
    <section class="admin-panel">
        <h1 class="heading">Startseiten-Inhalt bearbeiten</h1>

        <form method="post" action="/admin/startseite" enctype="multipart/form-data" class="form-style">
            <label for="willkommenstext">Willkommenstext:</label>
            <textarea name="willkommenstext" id="willkommenstext" rows="8" required>${content.willkommenstext}</textarea>

            <label>Bild 1:</label>
            <div class="dropzone" id="dropzone1">
                <p>Bild 1 hierher ziehen oder klicken</p>
                <input type="file" name="image1" id="image1" accept="image/*" hidden />
                @if(content.image1 != null && !content.image1.isEmpty()) {
                    <img id="preview1" src="${content.image1}" alt="Bild 1 Vorschau" style="max-width: 200px;" />
                    } @else {
                    <img id="preview1" style="max-width: 200px; display: none;" />
                    }
                @endif
            </div>

            <label>Bild 2:</label>
            <div class="dropzone" id="dropzone2">
                <p>Bild 2 hierher ziehen oder klicken</p>
                <input type="file" name="image2" id="image2" accept="image/*" hidden />
                @if(content.image2 != null && !content.image2.isEmpty()) {
                    <img id="preview2" src="${content.image2}" alt="Bild 2 Vorschau" style="max-width: 200px;" />
                    } @else {
                    <img id="preview2" style="max-width: 200px; display: none;" />
                    }
                @endif
            </div>

            <button type="submit" class="btn">Speichern</button>
        </form>

        @if(success) {
            <p class="success-message">Änderungen wurden gespeichert.</p>
            }
        @endif
    </section>

    <script>
        function setupDropzone(dropzoneId, inputId, previewId) {
            const dropzone = document.getElementById(dropzoneId);
            const input = document.getElementById(inputId);
            const preview = document.getElementById(previewId);

            dropzone.addEventListener("click", () => input.click());

            dropzone.addEventListener("dragover", (e) => {
                e.preventDefault();
                dropzone.classList.add("dragover");
            });

            dropzone.addEventListener("dragleave", () => {
                dropzone.classList.remove("dragover");
            });

            dropzone.addEventListener("drop", (e) => {
                e.preventDefault();
                dropzone.classList.remove("dragover");

                const file = e.dataTransfer.files[0];
                if (file && file.type.startsWith("image/")) {
                    input.files = e.dataTransfer.files;

                    const reader = new FileReader();
                    reader.onload = (ev) => {
                        preview.src = ev.target.result;
                        preview.style.display = "block";
                    };
                    reader.readAsDataURL(file);
                }
            });

            input.addEventListener("change", () => {
                const file = input.files[0];
                if (file && file.type.startsWith("image/")) {
                    const reader = new FileReader();
                    reader.onload = (ev) => {
                        preview.src = ev.target.result;
                        preview.style.display = "block";
                    };
                    reader.readAsDataURL(file);
                }
            });
        }

        setupDropzone("dropzone1", "image1", "preview1");
        setupDropzone("dropzone2", "image2", "preview2");
    </script>

    <style>
        .dropzone {
            border: 2px dashed #ccc;
            padding: 1em;
            text-align: center;
            cursor: pointer;
            margin-bottom: 1em;
            border-radius: 10px;
            background-color: #fafafa;
            transition: background-color 0.3s;
        }
        .dropzone.dragover {
            background-color: #e0e0e0;
        }
    </style>
`
)
