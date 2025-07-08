package de.feuerwehr.cronenberg.webcms.controller;

import de.feuerwehr.cronenberg.webcms.model.HomeSlide;
import de.feuerwehr.cronenberg.webcms.service.FileUploadService;
import de.feuerwehr.cronenberg.webcms.service.HomeSlideService;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;
import java.io.IOException;

@Controller
@RequestMapping("/admin/slider")
public class AdminSliderController {

    private final HomeSlideService slideService;
    private final FileUploadService fileUploadService;

    public AdminSliderController(HomeSlideService slideService, FileUploadService fileUploadService) {
        this.slideService = slideService;
        this.fileUploadService = fileUploadService;
    }

    @GetMapping
    public String listSlides(Model model) {
        model.addAttribute("slides", slideService.findAll());
        return "admin/slider_list";
    }

    @GetMapping("/new")
    public String newSlide(Model model) {
        model.addAttribute("slide", new HomeSlide());
        return "admin/slider_form";
    }

    @GetMapping("/edit/{id}")
    public String editSlide(@PathVariable Long id, Model model) {
        HomeSlide slide = slideService.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
        model.addAttribute("slide", slide);
        return "admin/slider_form";
    }

    @PostMapping("/save")
    public String saveSlide(
            @RequestParam(value = "id", required = false) Long id,
            @RequestParam("titel") String titel,
            @RequestParam("text") String text,
            @RequestParam("linkText") String linkText,
            @RequestParam("linkUrl") String linkUrl,
            @RequestParam(value = "sichtbar", required = false) boolean sichtbar,
            @RequestParam(value = "imageFile", required = false) MultipartFile imageFile
    ) throws IOException {
        HomeSlide slide = (id != null) ? slideService.findById(id).orElse(new HomeSlide()) : new HomeSlide();

        slide.setTitel(titel);
        slide.setText(text);
        slide.setLinkText(linkText);
        slide.setLinkUrl(linkUrl);
        slide.setSichtbar(sichtbar);

        if (imageFile != null && !imageFile.isEmpty()) {
            String path = fileUploadService.save(imageFile);
            slide.setImageUrl(path);
        }

        slideService.save(slide);
        return "redirect:/admin/slider";
    }

    @PostMapping("/delete/{id}")
    public String deleteSlide(@PathVariable Long id) {
        slideService.delete(id);
        return "redirect:/admin/slider";
    }
}
