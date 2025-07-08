@import de.feuerwehr.cronenberg.webcms.model.News
@param News news

@template.layout.layout(
title = news.getId() == null ? "Neue News" : "News bearbeiten",
banner = null,
content = @`
    <section class="admin-panel">
        <h1 class="heading">
            @if(news.getId() == null) {
                Neue News erstellen
                } @else {
            News bearbeiten
            }
            @endif
        </h1>

        <form method="post" action="/admin/news/save" enctype="multipart/form-data" class="form-style" id="newsForm">
            @if(news.getId() != null) {
            <input type="hidden" name="id" value="${news.getId()}" />
            }
            @endif

            <label for="titel">Titel:</label>
            <input type="text" id="titel" name="titel" required
                   value="${news.getTitel() != null ? news.getTitel() : ""}" />

            <label for="teaserText">Teaser-Text:</label>
            <textarea id="teaserText" name="teaserText" rows="4">
                ${news.getTeaserText() != null ? news.getTeaserText() : ""}
        </textarea>

            <label for="fullText">Volltext:</label>
            <textarea id="fullText" name="fullText" rows="8">
                ${news.getFullText() != null ? news.getFullText() : ""}
        </textarea>

            <label>Datum (von):</label>
            <div class="datetime-group">
                <input type="date" name="datumVonDate" required
                       value="${news.getDatum() != null ? news.getDatum().toLocalDate().toString() : ""}" />
                <input type="time" name="datumVonTime"
                       value="${news.getDatum() != null ? news.getDatum().toLocalTime().toString() : ""}" />
            </div>

            <label>Datum (bis, optional):</label>
            <div class="datetime-group">
                <input type="date" name="datumBisDate"
                       value="${news.getDatumBis() != null ? news.getDatumBis().toLocalDate().toString() : ""}" />
                <input type="time" name="datumBisTime"
                       value="${news.getDatumBis() != null ? news.getDatumBis().toLocalTime().toString() : ""}" />
            </div>

            <label>Bild (optional):</label>
            <div id="drop-area" class="drop-area">
                <p>Bild hierher ziehen oder klicken zum Hochladen</p>
                <input type="file" name="image" id="fileElem" accept="image/*" />
            </div>

            @if(news.getBildPfad() != null) {
            <p>Aktuelles Bild:</p>
            <p><img src="${news.getBildPfad()}" alt="Aktuelles Bild" style="max-width: 200px;" /></p>
            }
            @endif

            <button type="submit" class="btn">Speichern</button>
        </form>
    </section>

    <script>
        const dropArea = document.getElementById("drop-area");
        const fileInput = document.getElementById("fileElem");

        dropArea.addEventListener("click", () => fileInput.click());

        ["dragenter", "dragover"].forEach(eventName => {
            dropArea.addEventListener(eventName, (e) => {
                e.preventDefault();
                e.stopPropagation();
                dropArea.classList.add("highlight");
            }, false);
        });

        ["dragleave", "drop"].forEach(eventName => {
            dropArea.addEventListener(eventName, (e) => {
                e.preventDefault();
                e.stopPropagation();
                dropArea.classList.remove("highlight");
            }, false);
        });

        dropArea.addEventListener("drop", (e) => {
            const files = e.dataTransfer.files;
            if (files.length > 0) {
                fileInput.files = files;
            }
        });
    </script>

    <style>
        .drop-area {
            border: 2px dashed #ccc;
            padding: 20px;
            text-align: center;
            cursor: pointer;
            transition: 0.3s;
            margin-bottom: 1rem;
        }

        .drop-area.highlight {
            background-color: #f0f0f0;
            border-color: #666;
        }

        .form-style label {
            display: block;
            margin-top: 1rem;
            font-weight: bold;
        }

        .form-style input[type="text"],
        .form-style input[type="date"],
        .form-style input[type="time"],
        .form-style textarea {
            width: 100%;
            max-width: 600px;
            padding: 0.5rem;
            margin-top: 0.3rem;
        }

        .datetime-group {
            display: flex;
            gap: 0.5rem;
            align-items: center;
            margin-bottom: 1rem;
        }

        .form-style button.btn {
            margin-top: 1rem;
            padding: 0.6rem 1.2rem;
        }
    </style>
    `
    )
