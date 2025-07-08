package de.feuerwehr.cronenberg.webcms.model;

import jakarta.persistence.*;

@Entity
public class HomeSlide {

    @Id @GeneratedValue
    private Long id;

    private String titel;
    private String text;
    private String linkText;
    private String linkUrl;
    private String imageUrl;
    private int position;

    private boolean sichtbar = true;

    // --- Getter ---

    public Long getId() {
        return id;
    }

    public String getTitel() {
        return titel;
    }

    public String getText() {
        return text;
    }

    public String getLinkText() {
        return linkText;
    }

    public String getLinkUrl() {
        return linkUrl;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public int getPosition() {
        return position;
    }

    public boolean isSichtbar() {
        return sichtbar;
    }

    // --- Setter ---

    public void setId(Long id) {
        this.id = id;
    }

    public void setTitel(String titel) {
        this.titel = titel;
    }

    public void setText(String text) {
        this.text = text;
    }

    public void setLinkText(String linkText) {
        this.linkText = linkText;
    }

    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    public void setSichtbar(boolean sichtbar) {
        this.sichtbar = sichtbar;
    }
}
