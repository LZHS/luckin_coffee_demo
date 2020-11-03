package com.luckin_coffee;

import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
@Slf4j
public class FileHandleConfig implements WebMvcConfigurer {
    private String mImagesPath;
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        String imagesPath = FileHandleConfig.class.getClassLoader().getResource("").getPath();
        if(imagesPath.indexOf(".jar")>0){
            imagesPath = imagesPath.substring(0, imagesPath.indexOf(".jar"));
        }else if(imagesPath.indexOf("classes")>0){
            imagesPath = "file:"+imagesPath.substring(0, imagesPath.indexOf("target"));
        }
        imagesPath = imagesPath.substring(0, imagesPath.lastIndexOf("/"))+"/images/";
        mImagesPath = imagesPath;
        log.info("addResourceHandlers :"+mImagesPath);
        registry.addResourceHandler("/images/**")
                .addResourceLocations(mImagesPath);
    }
}
