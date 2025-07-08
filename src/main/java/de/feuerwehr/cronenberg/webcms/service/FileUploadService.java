package de.feuerwehr.cronenberg.webcms.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.*;
import java.util.UUID;

@Service
public class FileUploadService {

    // Zielverzeichnis (relativ zum Projekt-Root)
    private static final Path UPLOAD_DIR = Paths.get("uploads").toAbsolutePath();

    public String save(MultipartFile file) throws IOException {
        if (file == null || file.isEmpty()) {
            throw new IllegalArgumentException("Leere Datei kann nicht gespeichert werden.");
        }

        // Upload-Verzeichnis sicherstellen
        Files.createDirectories(UPLOAD_DIR);

        // Original-Dateiname sichern (nur Name, keine Pfade)
        String originalFilename = Paths.get(file.getOriginalFilename()).getFileName().toString();

        // Eindeutigen Dateinamen erzeugen
        String filename = UUID.randomUUID() + "_" + originalFilename;
        Path destination = UPLOAD_DIR.resolve(filename);

        // Datei speichern
        file.transferTo(destination.toFile());

        // Pfad für <img src="/uploads/xyz.jpg"> (Webzugriff)
        return "/uploads/" + filename;
    }
}

