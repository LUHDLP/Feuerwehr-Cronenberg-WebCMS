package de.feuerwehr.cronenberg.webcms.controller;

import org.springframework.ui.Model;
import de.feuerwehr.cronenberg.webcms.model.StartseitenContent;
import de.feuerwehr.cronenberg.webcms.service.StartseitenContentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class PageController {

    private final StartseitenContentService contentService;

    public PageController(StartseitenContentService contentService) {
        this.contentService = contentService;
    }

    @GetMapping("/")
    public String index(Model model) {
        StartseitenContent content = contentService.getContent();
        model.addAttribute("content", content);
        return "index";
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
