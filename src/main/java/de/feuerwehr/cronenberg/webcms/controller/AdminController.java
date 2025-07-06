package de.feuerwehr.cronenberg.webcms.controller;

import de.feuerwehr.cronenberg.webcms.model.StartseitenContent;
import de.feuerwehr.cronenberg.webcms.service.StartseitenContentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final StartseitenContentService contentService;

    public AdminController(StartseitenContentService contentService) {
        this.contentService = contentService;
    }

    @GetMapping
    public String adminHome() {
        return "admin/index";
    }

    @GetMapping("/inhalte")
    public String editHomepageContent(
            Model model,
            @RequestParam(value = "success", required = false, defaultValue = "false") boolean success
    ) {
        StartseitenContent content = contentService.getContent();
        model.addAttribute("content", content);
        model.addAttribute("success", success);
        return "admin/inhalte";
    }

    @PostMapping("/inhalte")
    public String saveHomepageContent(@ModelAttribute StartseitenContent content) {
        contentService.saveContent(content);
        return "redirect:/admin/inhalte?success=true";
    }
}
