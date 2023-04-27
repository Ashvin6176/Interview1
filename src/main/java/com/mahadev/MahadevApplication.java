package com.mahadev;

import java.io.IOException;
import java.util.TimeZone;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.autoconfigure.web.servlet.MultipartAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;


/**
 * @author BAGHEL MIT
 */
@SpringBootApplication
@EnableFeignClients
@ComponentScan("com.mahadev")
@EnableJpaRepositories("com.mahadev")
@EntityScan("com.mahadev.*")
public class MahadevApplication extends SpringBootServletInitializer {
	 
	private static final Logger LOGGER = LoggerFactory.getLogger(MahadevApplication.class);

	public static void main(String[] args) throws IOException {
		SpringApplication.run(MahadevApplication.class, args);
		TimeZone.setDefault(TimeZone.getTimeZone("UTC"));
		openHomePage();
	}

	private static void openHomePage() throws IOException {
		Runtime rt = Runtime.getRuntime();
		rt.exec("rundll32 url.dll,FileProtocolHandler " + "http://localhost:9098/MAHADEV/login/loginPage");
	}
	@Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(MahadevApplication.class);
    }    
	  
}
