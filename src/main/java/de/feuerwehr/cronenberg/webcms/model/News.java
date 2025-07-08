package de.feuerwehr.cronenberg.webcms.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
public class News {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String titel;
    private String teaserText;
    private String fullText;
    private String bildPfad;
    private LocalDateTime datum;

    // Getter und Setter
    public Long getId() {
        return id;
    }

    public String getTitel() {
        return titel;
    }

    public String getTeaserText() {
        return teaserText;
    }

    public String getFullText() {
        return fullText;
    }

    public String getBildPfad() {
        return bildPfad;
    }

    public LocalDateTime getDatum() {
        return datum;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setTitel(String titel) {
        this.titel = titel;
    }

    public void setTeaserText(String teaserText) {
        this.teaserText = teaserText;
    }

    public void setFullText(String fullText) {
        this.fullText = fullText;
    }

    public void setBildPfad(String bildPfad) {
        this.bildPfad = bildPfad;
    }

    public void setDatum(LocalDateTime datum) {
        this.datum = datum;
    }

    private boolean visible = true;

    public boolean isVisible() {
        return visible;
    }

    public void setVisible(boolean visible) {
        this.visible = visible;
    }

    private LocalDateTime datumBis;

    public LocalDateTime getDatumBis() {
        return datumBis;
    }

    public void setDatumBis(LocalDateTime datumBis) {
        this.datumBis = datumBis;
    }


}

