package de.feuerwehr.cronenberg.webcms.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

@Service
public class FileUploadService {

    private static final String UPLOAD_DIR = "uploads"; // kein Slash am Ende

    public String save(MultipartFile file) throws IOException {
        // Zielverzeichnis sicherstellen
        Path uploadDirPath = Paths.get(UPLOAD_DIR);
        Files.createDirectories(uploadDirPath); // <- wichtig!

        // Dateiname generieren
        String filename = UUID.randomUUID() + "_" + file.getOriginalFilename();
        Path destination = uploadDirPath.resolve(filename);

        // Datei speichern
        file.transferTo(destination.toFile());

        // Pfad, der im <img src="..."> angezeigt wird
        return "/uploads/" + filename;
    }
}
