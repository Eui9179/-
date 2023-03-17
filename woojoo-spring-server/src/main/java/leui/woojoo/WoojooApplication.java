package leui.woojoo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.web.bind.annotation.RequestMapping;

@EnableJpaAuditing
@SpringBootApplication
public class WoojooApplication {

    public static void main(String[] args) {
        SpringApplication.run(WoojooApplication.class, args);
    }

}
