package web.security;

import java.io.IOException;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.core.GrantedAuthorityDefaults;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration {

    @Autowired
    private UserDetailsService userDetailsService;

    @Bean
    protected SecurityFilterChain configure(HttpSecurity http) throws Exception {
        http
            .authorizeRequests()
                .antMatchers("/", "/cliente/novo", "/login","/about").permitAll()
                .antMatchers(HttpMethod.POST, "/cliente/adiciona").permitAll()
                .antMatchers("/resources/**").permitAll()
                .antMatchers("/funcionario/**").hasRole("FUNCIONARIO")
                .antMatchers("/admin/**").hasRole("ADMIN")
                .antMatchers("/cliente/**").hasRole("CLIENTE")
                .anyRequest().authenticated()
                .and()
            .formLogin()
                .loginPage("/login").failureUrl("/login?error=true")
                .permitAll()
                .successHandler((request, response, authentication) -> {
                    handleSuccess(request, response, authentication);
                })
                .and()
            .logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout", "GET")).logoutSuccessUrl("/login")
                .permitAll().and()
                .exceptionHandling()
                .accessDeniedHandler((request, response, accessDeniedException) -> {
        
                    response.sendRedirect("/projetoweb/acesso-negado");
                })
                .and()
            .csrf().disable();
        return http.build();
    }

    private void handleSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException {
        Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());

        if (roles.contains("ADMIN")) {
            response.sendRedirect("admin/index");
        } else if (roles.contains("FUNCIONARIO")) {
            response.sendRedirect("funcionario/index");
        } else if (roles.contains("CLIENTE")) {
            response.sendRedirect("cliente/index");
        } else {
            response.sendRedirect("/projetoweb");
        }
    }
    
    @Bean
    public GrantedAuthorityDefaults grantedAuthorityDefaults() {
        return new GrantedAuthorityDefaults(""); 
    }

    @Autowired
    protected void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder(12);
    }
}
