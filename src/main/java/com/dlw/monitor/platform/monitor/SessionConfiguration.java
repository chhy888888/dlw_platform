package com.dlw.monitor.platform.monitor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;


import lombok.AllArgsConstructor;

@Configuration
@AllArgsConstructor
public class SessionConfiguration extends WebMvcConfigurerAdapter {
	 private SessionInterceptor  sessionInterceptor;
	/*@Bean   
    public HandlerInterceptor getMyInterceptor(){
        return new SessionInterceptor();
    }*/
	@Override
	public void addInterceptors(InterceptorRegistry registry){
//		registry.addInterceptor(loginInterceptor).addPathPatterns("/manager/**").excludePathPatterns("/manager/login_toLogin", "/manager/login_login","/manager/sysmain/index");
        registry.addInterceptor(sessionInterceptor).addPathPatterns("/**");
        super.addInterceptors(registry);
	}
	
}
