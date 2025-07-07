package de.feuerwehr.cronenberg.webcms.controller;

import de.feuerwehr.cronenberg.webcms.model.StartseitenContent;
import de.feuerwehr.cronenberg.webcms.service.FileUploadService;
import de.feuerwehr.cronenberg.webcms.service.StartseitenContentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

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
}
