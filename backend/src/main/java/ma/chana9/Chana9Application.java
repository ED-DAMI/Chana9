package ma.chana9;

import ma.chana9.modules.notification.OtpService;
import ma.chana9.modules.notification.WhatsAppService;
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
    @Bean
     CommandLineRunner start(OtpService service){
        return args -> service.createOtp("0653995347");
   }
}
