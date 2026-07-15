package ma.chana9;

import ma.chana9.modules.user.User;
import ma.chana9.modules.user.UserRepository;
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

@SpringBootApplication
@ConfigurationPropertiesScan
@EnableAsync
@EnableScheduling
public class Chana9Application {

    public static void main(String[] args) {
        SpringApplication.run(Chana9Application.class, args);
    }
    CommandLineRunner start(UserRepository userRepo, PasswordEncoder encoder){
        return args ->{
            User admin=new User();
            admin.setFullName("mohamed ED-DAMI");
            admin.setRole(Role.ADMIN);
            admin.setPhone("0653995947");
            admin.setKycVerified(true);
            admin.setCreatedAt(LocalDateTime.now());
            admin.setPasswordHash(encoder.encode("20032003"));
            userRepo.save(admin);
        };
    }
}
