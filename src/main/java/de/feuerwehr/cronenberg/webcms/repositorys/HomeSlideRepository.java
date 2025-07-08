package de.feuerwehr.cronenberg.webcms.repositorys;

import de.feuerwehr.cronenberg.webcms.model.HomeSlide;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface HomeSlideRepository extends JpaRepository<HomeSlide, Long> {
}

