package org.example.proyecto.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;

@Configuration
public class SpringJdbcConfig {
    @Bean
    public JdbcTemplate jdbcTemplate(DataSource dataSource) { return new JdbcTemplate(dataSource); }

    /*@Bean
    public UsuarioRepositoryOld usuarioRepository(JdbcTemplate jdbcTemplate) {
        return new JsbcUsuarioRepository(jdbcTemplate);
    }*/
}
