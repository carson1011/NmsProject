package com.example.demo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
public class MvcConfig implements WebMvcConfigurer {

    @Bean
    public ViewResolver internalResourceViewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");
        return resolver;
    }
    // 요청 - 뷰 연결
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/nms/home").setViewName("/nms/home");
        registry.addViewController("/login").setViewName("/member/login");
        registry.addViewController("/admin").setViewName("member/admin");
        registry.addViewController("/signup").setViewName("member/signup");
        registry.addViewController("/device/devmgmnt").setViewName("/device/devmngmt");
        registry.addViewController("/area/areamgmnt").setViewName("/area/areamngmt");
        /*registry.addViewController("/group/groupmgmnt").setViewName("/group/groupmngmt");*/
        //registry.addViewController("/").setViewName("homeOrigin");
    }
}