package com.tharindu.jersey.config;

import com.tharindu.jersey.model.User;
import org.glassfish.hk2.utilities.binding.AbstractBinder;

public class DependencyBinder extends AbstractBinder {
    @Override
    protected void configure() {
        System.out.println("Configuring dependencies in DependencyBinder");
        bind(User.class).to(User.class);
    }
}
