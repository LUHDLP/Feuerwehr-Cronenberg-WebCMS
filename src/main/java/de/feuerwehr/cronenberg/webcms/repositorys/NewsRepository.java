package de.feuerwehr.cronenberg.webcms.repositorys;

import de.feuerwehr.cronenberg.webcms.model.News;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface NewsRepository extends JpaRepository<News, Long> {

    List<News> findTop8ByOrderByDatumDesc();

    List<News> findAllByOrderByDatumDesc();

    List<News> findTop8ByVisibleIsTrueOrderByDatumDesc();

}
