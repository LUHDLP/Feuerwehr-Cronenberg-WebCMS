package de.feuerwehr.cronenberg.webcms.controller;

import de.feuerwehr.cronenberg.webcms.model.News;
import de.feuerwehr.cronenberg.webcms.service.NewsService;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.server.ResponseStatusException;

@Controller
public class NewsController {

    private final NewsService newsService;

    public NewsController(NewsService newsService) {
        this.newsService = newsService;
    }

    @GetMapping("/news")
    public String alleNews(Model model) {
        model.addAttribute("newsList", newsService.getAllNews());
        return "news/alle-artikel.jte";
    }

    @GetMapping("/news-detail/{id}")
    public String detail(@PathVariable Long id, Model model) {
        News news = newsService.getNewsById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
        model.addAttribute("news", news);
        return "news/detail.jte";
    }
}
