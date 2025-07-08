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

    public void saveContent(StartseitenContent updated) {
        StartseitenContent existing = repo.findById(1L).orElseThrow();
        existing.setWillkommenstext(updated.getWillkommenstext());
        existing.setImage1(updated.getImage1());
        existing.setImage2(updated.getImage2());
        repo.save(existing);
    }

}
