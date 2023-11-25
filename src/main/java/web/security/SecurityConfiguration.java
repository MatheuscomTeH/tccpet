package web.security;

import java.io.IOException;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration {
	
	@Autowired
	private UserDetailsService userDetailsService;
	

	

	@Bean
	protected SecurityFilterChain configure(HttpSecurity http) throws Exception {
	    http
	        .authorizeRequests()
	            .antMatchers("/", "/cliente/novo","/login").permitAll()
	            .antMatchers(HttpMethod.POST, "/cliente/adiciona").permitAll()
	            .antMatchers("/resources/**").permitAll()
	            .anyRequest().authenticated()
	            .and()
	        .formLogin()
	            .loginPage("/login").failureUrl("/login?error=true")
	            .permitAll()
	            .successHandler((request, response, authentication) -> {
	                handleSuccess(request, response, authentication);
	            })
	            .and()
	        .logout()
	            .permitAll()
	            .and()
	        .csrf().disable();

	    return http.build();
	}

	private void handleSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException {
	    Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());

	    if (roles.contains("ADMIN")) {
	        response.sendRedirect("admin/dashboard");
	    } else if (roles.contains("FUNCIONARIO")) {
	        response.sendRedirect("funcionario/dashboard");
	    } else if (roles.contains("CLIENTE")) {
	        response.sendRedirect("cliente/dashboard");
	    } else {
	        response.sendRedirect("/projetoweb");
	    }
	}
	@Autowired
	protected void configureGlobal(AuthenticationManagerBuilder auth)throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder(12);
	}

}
