package com.example.jadeapi.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/api/**") // Aplica a configuração para todos os endpoints sob /api/
                .allowedOrigins("http://localhost:3000") // Permite requisições desta origem (seu front-end Next.js)
                .allowedMethods("GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS") // Métodos HTTP permitidos
                .allowedHeaders("*") // Permite todos os cabeçalhos na requisição
                .allowCredentials(true) // Permite credenciais (cookies, authorization headers), se necessário
                .maxAge(3600); // Tempo que o resultado de uma requisição pre-flight OPTIONS pode ser cacheado (em segundos)
    }

    // Se você precisar de uma configuração mais granular ou beans específicos para CORS,
    // pode definir um CorsConfigurationSource aqui também, mas para a maioria dos casos
    // o addCorsMappings é suficiente.
}
