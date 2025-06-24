package com.tharindu.jersey.controller;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import org.glassfish.jersey.server.mvc.Viewable;

import java.util.HashMap;
import java.util.Map;

@Path("/")
public class HomeController {

    @GET
    public Viewable index() {
        Map<String, Object> model = new HashMap<>();
        model.put("message", "Welcome to the Home Page!");

        return new Viewable("/index", model);
    }
}
