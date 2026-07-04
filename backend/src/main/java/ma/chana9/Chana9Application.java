package ma.chana9;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;

@SpringBootApplication
@ConfigurationPropertiesScan
public class Chana9Application {

    public static void main(String[] args) {
        SpringApplication.run(Chana9Application.class, args);
    }
}
