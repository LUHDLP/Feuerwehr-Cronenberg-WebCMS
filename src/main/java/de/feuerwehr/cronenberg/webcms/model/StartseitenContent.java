package de.feuerwehr.cronenberg.webcms.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;

@Entity
@Table(name = "startseiten_content") // optional, aber sinnvoll zur Lesbarkeit in der DB
public class StartseitenContent {

    // Da es nur einen Eintrag gibt, fixieren wir die ID auf 1
    @Id
    public Long id = 1L;

    @Lob
    public String willkommenstext;

    public String image1;
    public String image2;

    // --- Getter ---

    public Long getId() {
        return id;
    }

    public String getWillkommenstext() {
        return willkommenstext;
    }

    public String getImage1() {
        return image1;
    }

    public String getImage2() {
        return image2;
    }

    // --- Setter ---

    public void setId(Long id) {
        this.id = id;
    }

    public void setWillkommenstext(String willkommenstext) {
        this.willkommenstext = willkommenstext;
    }

    public void setImage1(String image1) {
        this.image1 = image1;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }
}
