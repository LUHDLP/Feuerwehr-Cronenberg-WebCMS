package de.feuerwehr.cronenberg.webcms.controller;

import de.feuerwehr.cronenberg.webcms.model.News;
import org.springframework.ui.Model;
import de.feuerwehr.cronenberg.webcms.model.StartseitenContent;
import de.feuerwehr.cronenberg.webcms.service.StartseitenContentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import de.feuerwehr.cronenberg.webcms.service.NewsService;
import java.util.List;


@Controller
public class PageController {

    private final StartseitenContentService contentService;
    private final NewsService newsService;

    public PageController(StartseitenContentService contentService, NewsService newsService) {
        this.contentService = contentService;
        this.newsService = newsService;
    }

    @GetMapping("/")
    public String index(Model model) {
        StartseitenContent content = contentService.getContent();
        List<News> newsList = newsService.getLatestNews();

        model.addAttribute("content", content);
        model.addAttribute("newsList", newsList);
        return "index";
    }

    @GetMapping("/alle-artikel")
    public String alleArtikel(Model model) {
        List<News> allNews = newsService.getAllNews();
        model.addAttribute("newsList", allNews);
        return "alle-artikel";
    }


    @GetMapping("/einsatzabteilung")
    public String einsatzabteilung() {
        return "einsatzabteilung";
    }

    @GetMapping("/technik")
    public String technik() {
        return "technik";
    }

    @GetMapping("/jugendfeuerwehr")
    public String jugendfeuerwehr() {
        return "jugendfeuerwehr";
    }

    @GetMapping("/presse")
    public String presse() {
        return "presse";
    }

    @GetMapping("/chronik")
    public String chronik() {
        return "chronik";
    }

    @GetMapping("/foerderverein")
    public String foerderverein() {
        return "foerderverein";
    }

    @GetMapping("/ehrenabteilung")
    public String ehrenabteilung() {
        return "ehrenabteilung";
    }

    @GetMapping("/infos-fuer-buerger")
    public String infosFuerBuerger() {
        return "infos-fuer-buerger";
    }

}
