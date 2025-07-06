package de.feuerwehr.cronenberg.webcms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SpringBootApplication
public class FeuerwehrCronenbergWebCmsApplication {

	private static final Logger log = LoggerFactory.getLogger(FeuerwehrCronenbergWebCmsApplication.class);

	public static void main(String[] args) {
		SpringApplication.run(FeuerwehrCronenbergWebCmsApplication.class, args);
		log.info("DB Username: {}", System.getenv("POSTGRES_USER"));
		log.info("DB Password: {}", System.getenv("POSTGRES_PASSWORD"));
	}
}
