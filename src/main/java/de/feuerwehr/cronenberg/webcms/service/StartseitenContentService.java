package de.feuerwehr.cronenberg.webcms.service;

import de.feuerwehr.cronenberg.webcms.model.StartseitenContent;
import de.feuerwehr.cronenberg.webcms.repositorys.StartseitenContentRepository;
import org.springframework.stereotype.Service;

@Service
public class StartseitenContentService {

    private final StartseitenContentRepository repo;

    public StartseitenContentService(StartseitenContentRepository repo) {
        this.repo = repo;
    }

    public StartseitenContent getContent() {
        return repo.findById(1L).orElseGet(() -> {
            StartseitenContent content = new StartseitenContent();
            content.setWillkommenstext("Herzlich willkommen!");
            content.setImage1("/images/slider/Netzfoto1.jpg");
            content.setImage2("/images/slider/willkommen.jpg");
            return repo.save(content);
        });
    }

    public void saveContent(StartseitenContent content) {
        content.setId(1L);
        repo.save(content);
    }
}
