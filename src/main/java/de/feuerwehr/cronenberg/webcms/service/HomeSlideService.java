package de.feuerwehr.cronenberg.webcms.service;

import de.feuerwehr.cronenberg.webcms.model.HomeSlide;
import de.feuerwehr.cronenberg.webcms.repositorys.HomeSlideRepository;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import java.nio.file.*;
import java.util.List;
import java.util.Optional;


@Service
public class HomeSlideService {

    private final HomeSlideRepository repo;

    public HomeSlideService(HomeSlideRepository repo) {
        this.repo = repo;
    }

    public List<HomeSlide> findAll() {
        return repo.findAll(Sort.by("position").ascending());
    }

    public Optional<HomeSlide> findById(Long id) {
        return repo.findById(id);
    }

    public void save(HomeSlide slide) {
        repo.save(slide);
    }

    public void delete(Long id) {
        repo.deleteById(id);
    }
}

