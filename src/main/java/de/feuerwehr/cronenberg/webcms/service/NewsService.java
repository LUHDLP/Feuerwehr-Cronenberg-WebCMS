package de.feuerwehr.cronenberg.webcms.service;

import de.feuerwehr.cronenberg.webcms.model.News;
import de.feuerwehr.cronenberg.webcms.repositorys.NewsRepository;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class NewsService {

    private final NewsRepository repo;

    public NewsService(NewsRepository repo) {
        this.repo = repo;
    }

    public List<News> getLatestNews() {
        return repo.findTop8ByOrderByDatumDesc();
    }

    public List<News> getAllNews() {
        return repo.findAllByOrderByDatumDesc();
    }

    public Optional<News> getNewsById(Long id) {
        return repo.findById(id);
    }

    public News saveNews(News news) {
        return repo.save(news);
    }

    public void deleteNews(Long id) {
        repo.deleteById(id);
    }

    public void toggleVisibility(Long id) {
        repo.findById(id).ifPresent(news -> {
            news.setVisible(!news.isVisible());
            repo.save(news);
        });
    }

}

