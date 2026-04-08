package com.example.springWithJspAndStruts.config;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import jakarta.servlet.Filter;

@Configuration
public class StrutsConfig {

    @Bean
    FilterRegistrationBean<Filter> strutsFilter() {
        FilterRegistrationBean<Filter> bean = new FilterRegistrationBean<>();
        bean.setFilter(new org.apache.struts2.dispatcher.filter.StrutsPrepareAndExecuteFilter());
        
        //bean.addUrlPatterns("/*");
        //or ดักเฉพาะ .do เท่านั้น
        bean.addUrlPatterns("*.do");
        //bean.addUrlPatterns("*.do", "*.action"); //กรณีหลายอัน
        
        bean.setOrder(1);
        return bean;
    }
}