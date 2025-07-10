package de.feuerwehr.cronenberg.webcms.controller;

import de.feuerwehr.cronenberg.webcms.model.News;
import de.feuerwehr.cronenberg.webcms.model.StartseitenContent;
import de.feuerwehr.cronenberg.webcms.service.FileUploadService;
import de.feuerwehr.cronenberg.webcms.service.NewsService;
import de.feuerwehr.cronenberg.webcms.service.StartseitenContentService;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import java.io.IOException;
import java.time.LocalDateTime;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final StartseitenContentService contentService;
    private final FileUploadService fileUploadService;

    public AdminController(StartseitenContentService contentService, FileUploadService fileUploadService) {
        this.contentService = contentService;
        this.fileUploadService = fileUploadService;
    }

    @GetMapping
    public String adminHome() {
        return "admin/index";
    }

    @GetMapping("/startseite")
    public String editHomepageContent(
            Model model,
            @RequestParam(value = "success", required = false, defaultValue = "false") boolean success
    ) {
        StartseitenContent content = contentService.getContent();
        model.addAttribute("content", content);
        model.addAttribute("success", success);
        return "admin/startseite";
    }

    @PostMapping("/startseite")
    public String saveHomepageContent(
            @RequestParam("willkommenstext") String willkommenstext,
            @RequestParam(value = "image1", required = false) MultipartFile image1,
            @RequestParam(value = "image2", required = false) MultipartFile image2,
            Model model
    ) {
        StartseitenContent content = contentService.getContent();
        content.setWillkommenstext(willkommenstext);

        try {
            if (image1 != null && !image1.isEmpty()) {
                String image1Path = fileUploadService.save(image1);
                content.setImage1(image1Path);
            }

            if (image2 != null && !image2.isEmpty()) {
                String image2Path = fileUploadService.save(image2);
                content.setImage2(image2Path);
            }

            contentService.saveContent(content);
            return "redirect:/admin/startseite?success=true";

        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("success", false);
            model.addAttribute("content", content);
            return "admin/startseite";
        }
    }

    @Controller
    @RequestMapping("/admin/news")
    public class AdminNewsController {

        private final NewsService newsService;
        private final FileUploadService fileUploadService;

        public AdminNewsController(NewsService newsService, FileUploadService fileUploadService) {
            this.newsService = newsService;
            this.fileUploadService = fileUploadService;
        }

        @GetMapping
        public String listNews(Model model, @RequestParam(required = false) boolean success) {
            model.addAttribute("newsList", newsService.getAllNews());
            model.addAttribute("success", success);
            return "admin/news_list";
        }

        @GetMapping("/new")
        public String newNews(Model model) {
            model.addAttribute("news", new News());
            return "admin/news_form";
        }

        @GetMapping("/edit/{id}")
        public String editNews(@PathVariable Long id, Model model) {
            News news = newsService.getNewsById(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
            model.addAttribute("news", news);
            return "admin/news_form";
        }

        @PostMapping("/save")
        public String saveNews(
                @ModelAttribute News news,
                @RequestParam(value = "image", required = false) MultipartFile image,
                @RequestParam(value = "dokument", required = false) MultipartFile dokument,
                @RequestParam("datumVonDate") String datumVonDate,
                @RequestParam(value = "datumVonTime", required = false) String datumVonTime,
                @RequestParam(value = "datumBisDate", required = false) String datumBisDate,
                @RequestParam(value = "datumBisTime", required = false) String datumBisTime
        ) throws IOException {

            // Datum von (Pflichtfeld)
            if (datumVonDate != null && !datumVonDate.isBlank()) {
                String datetimeStr = datumVonDate + (datumVonTime != null && !datumVonTime.isBlank() ? "T" + datumVonTime : "T00:00");
                news.setDatum(LocalDateTime.parse(datetimeStr));
            }

            // Datum bis (Optional)
            if (datumBisDate != null && !datumBisDate.isBlank()) {
                String datetimeStr = datumBisDate + (datumBisTime != null && !datumBisTime.isBlank() ? "T" + datumBisTime : "T00:00");
                news.setDatumBis(LocalDateTime.parse(datetimeStr));
            } else {
                news.setDatumBis(null);
            }

            // Bild speichern oder Standardbild setzen
            if (image != null && !image.isEmpty()) {
                String path = fileUploadService.save(image);
                news.setBildPfad(path);
            } else if (news.getBildPfad() == null || news.getBildPfad().isBlank()) {
                news.setBildPfad("/images/ffc_logo_trans_150.png"); // <- Standardbild
            }

            // Dokument speichern
            if (dokument != null && !dokument.isEmpty()) {
                String path = fileUploadService.save(dokument);
                news.setDokumentPfad(path);
            }

            newsService.saveNews(news);
            return "redirect:/admin/news?success=true";
        }



        @PostMapping("/delete/{id}")
        public String deleteNews(@PathVariable Long id) {
            newsService.deleteNews(id);
            return "redirect:/admin/news?success=true";
        }

        @PostMapping("/toggleVisibility/{id}")
        public String toggleVisibility(@PathVariable Long id) {
            newsService.toggleVisibility(id);
            return "redirect:/admin/news?success=true";
        }
    }

}
