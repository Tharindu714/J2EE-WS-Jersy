package com.tharindu.jersey.middleware;

import jakarta.ws.rs.container.ContainerRequestContext;
import jakarta.ws.rs.container.ContainerRequestFilter;
import jakarta.ws.rs.ext.Provider;

import java.io.IOException;
@Provider
public class RequestFilter implements ContainerRequestFilter {
    @Override
    public void filter(ContainerRequestContext containerRequestContext) throws IOException {
        System.out.println("Request Filter: Processing request for " + containerRequestContext.getUriInfo().getRequestUri());

        //OUTPUT: Request Filter: Processing request for http://localhost:8080/JERSEY-WEB/jersey-api/home
    }
}
