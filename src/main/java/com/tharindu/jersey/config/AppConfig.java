package com.tharindu.jersey.config;

//import jakarta.ws.rs.ApplicationPath;
import org.glassfish.jersey.server.ResourceConfig;
import org.glassfish.jersey.server.mvc.jsp.JspMvcFeature;

//@ApplicationPath("/jersey-api") // This sets the base URI for all JAX-RS resources in this application
public class AppConfig extends ResourceConfig {
   public AppConfig(){
       packages("com.tharindu.jersey.controller");
       packages("com.tharindu.jersey.middleware");

       register(JspMvcFeature.class);
       property(JspMvcFeature.TEMPLATE_BASE_PATH, "/WEB-INF/views/");
   }
}
