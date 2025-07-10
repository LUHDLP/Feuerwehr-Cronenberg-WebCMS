package de.feuerwehr.cronenberg.webcms.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.*;
import java.util.List;
import java.util.UUID;

@Service
public class FileUploadService {

    // Basisverzeichnis für Uploads (relativ zum Projekt-Root)
    private static final Path BASE_UPLOAD_DIR = Paths.get("uploads").toAbsolutePath(); // OHNE 'src/main/resources'

    public String save(MultipartFile file) throws IOException {
        if (file == null || file.isEmpty()) {
            throw new IllegalArgumentException("Leere Datei kann nicht gespeichert werden.");
        }

        // Dateiname sichern (ohne Pfad)
        String originalFilename = Paths.get(file.getOriginalFilename()).getFileName().toString();
        String extension = getFileExtension(originalFilename).toLowerCase();

        // Ziel-Unterordner bestimmen
        String subfolder;
        if (isImage(extension)) {
            subfolder = "bilder";
        } else if (extension.equals("pdf")) {
            subfolder = "docs";
        } else {
            throw new IOException("Nur Bilder und PDF-Dateien sind erlaubt.");
        }

        // Upload-Zielordner erstellen
        Path uploadDir = BASE_UPLOAD_DIR.resolve(subfolder);
        Files.createDirectories(uploadDir);

        // Eindeutiger Dateiname
        String filename = UUID.randomUUID() + "_" + originalFilename;
        Path destination = uploadDir.resolve(filename);

        // Datei speichern
        file.transferTo(destination.toFile());

        // Rückgabe als Web-Pfad
        return "/uploads/" + subfolder + "/" + filename;
    }

    private boolean isImage(String extension) {
        return List.of("jpg", "jpeg", "png", "webp", "gif").contains(extension);
    }

    private String getFileExtension(String filename) {
        int dotIndex = filename.lastIndexOf('.');
        return (dotIndex >= 0) ? filename.substring(dotIndex + 1) : "";
    }
}
