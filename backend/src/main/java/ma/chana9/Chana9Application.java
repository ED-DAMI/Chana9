package ma.chana9;

import ma.chana9.modules.annonce.entities.Annonce;
import ma.chana9.modules.annonce.repositories.AnnonceAlertRepository;
import ma.chana9.modules.annonce.repositories.AnnonceRepository;
import ma.chana9.modules.notification.OtpService;
import ma.chana9.modules.notification.WhatsAppService;
import ma.chana9.modules.user.User;
import ma.chana9.modules.user.UserRepository;
import ma.chana9.shared.enums.AnnonceStatus;
import ma.chana9.shared.enums.Role;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.time.LocalDateTime;
import java.util.List;

@SpringBootApplication
@ConfigurationPropertiesScan
@EnableAsync
@EnableScheduling
public class Chana9Application {

    public static void main(String[] args) {
        SpringApplication.run(Chana9Application.class, args);
    }
    @Bean
     CommandLineRunner start(AnnonceRepository repo, AnnonceAlertRepository annonceAlertRepository){
        return args -> {
            List<Annonce> annonces = repo.findAll();
            annonces.forEach(
                    e->{
                        e.setStatus(AnnonceStatus.ACTIVE);
                        e.setCreatedAt(LocalDateTime.now());
                        e.setExpiresAt(e.getCreatedAt().plusDays(30));
                        repo.save(e);
                    }
            );

        };
    }
}
