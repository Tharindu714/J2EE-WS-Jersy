package com.tharindu.jersey;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;

@Path("/test") //Execute this endpoint by accessing http://localhost:8080/JERSEY-WEB/jersey-api/test --> Expect 404 error
public class TestController {
    @GET
    public String test() {
        return "This is a test endpoint!";
    }
}
