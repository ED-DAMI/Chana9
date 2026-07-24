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
            User user1 = new User();
            user1.setFullName("Ahmed Benali");
            user1.setRole(Role.ELEVEUR);
            user1.setPhone("0611111111");
            user1.setKycVerified(true);
            user1.setCreatedAt(LocalDateTime.now());
            user1.setPasswordHash(encoder.encode("password123"));
            userRepo.save(user1);

            User user2 = new User();
            user2.setFullName("Sara El Amrani");
            user2.setRole(Role.ELEVEUR);
            user2.setPhone("0622222222");
            user2.setKycVerified(false);
            user2.setCreatedAt(LocalDateTime.now());
            user2.setPasswordHash(encoder.encode("password456"));
            userRepo.save(user2);

            User user3 = new User();
            user3.setFullName("Youssef Alaoui");
            user3.setRole(Role.ELEVEUR);
            user3.setPhone("0633333333");
            user3.setKycVerified(true);
            user3.setCreatedAt(LocalDateTime.now());
            user3.setPasswordHash(encoder.encode("password789"));
            userRepo.save(user3);

        };
   }
}
