# 🌐 J2EE Web Services with Jersey

> A comprehensive demonstration of JAX-RS endpoints using Jersey, including request/response filters, controllers, and JSP-based views under WEB-INF.

---

## 📑 Table of Contents

1. [✨ Project Overview](#-project-overview)
2. [📂 Project Structure](#-project-structure)
3. [⚙️ Technologies & Dependencies](#️-technologies--dependencies)
4. [🚀 Getting Started & Deployment](#-getting-started--deployment)
5. [🔧 Configuration (web.xml & ApplicationConfig)](#-configuration-webxml--applicationconfig)
6. [📚 Controllers & Resources](#-controllers--resources)
7. [🔍 Request & Response Filters](#-request--response-filters)
8. [🏞️ JSP Views](#-jsp-views)
9. [📄 Usage Examples](#-usage-examples)
10. [🛠️ Error Handling](#-error-handling)
11. [🤝 Contributing](#-contributing)
12. [📜 License](#-license)

---

## ✨ Project Overview

This project illustrates building RESTful web services with **Jersey** (JAX-RS reference implementation) on a Java EE platform. Key concepts include:

* **Resource controllers** for handling HTTP verbs
* **ContainerRequestFilter** and **ContainerResponseFilter** to intercept and process requests/responses
* **JSP views** for dynamic HTML under `WEB-INF/views`
* **Error pages** for handling 404 and exceptions

---

## 📂 Project Structure

```
src/main/java/com/tharindu/jersey/
├── annotation/
│   └── UserBind.java       #Userbinding annotation (optional)
├── config/
│   └── AppConfig.java      # Registers Jersey via @ApplicationPath
├── controller/
│   └── HomeController.java         # Sample @Path endpoints
├── middleware/
│   ├── RequestFilter.java          # Implements ContainerRequestFilter
│   └── ResponseFilter.java         # Implements ContainerResponseFilter
├── model/
│   └── User.java                   #UserBean Serializable class
└── TestController.java/

src/main/webapp
├── uploads/                            # Uploaded Documents
├── WEB-INF/
     ├── web.xml                         # Servlet & filter mappings
     └── views/
          └── index.jsp                  # Home page
```

---

## ⚙️ Technologies & Dependencies

* **Java EE / Jakarta EE** with Servlets and JSP
* **JAX-RS (Jersey)** for REST API
* **Maven** for build management
* **Servlet Container**: Tomcat, WildFly, or similar
* **JSP/EL** for view rendering

---

## 🚀 Getting Started & Deployment

1. **Clone the repo**:

   ```bash
   git clone https://github.com/Tharindu714/J2EE-WS-Jersy.git
   cd J2EE-WS-Jersy
   ```
2. **Build WAR**:

   ```bash
   mvn clean package
   ```
3. **Deploy** to your server’s `webapps/` (Tomcat) or `deployments/` (WildFly) folder.
4. **Access**:

   * REST base: `http://localhost:8080/JERSEY-WEB/jersy-api/test`
   * JSP home: `http://localhost:8080/JERSEY-WEB/`

---

## 🔧 Configuration (web.xml & ApplicationConfig)

**`web.xml`** sets up the Jersey servlet:

```xml
<servlet>
  <servlet-name>jersey-servlet</servlet-name>
  <servlet-class>org.glassfish.jersey.servlet.ServletContainer</servlet-class>
  <init-param>
    <param-name>jersey.config.server.provider.packages</param-name>
    <param-value>com.tharindu.jersey.controller,com.tharindu.jersey.filter</param-value>
  </init-param>
  <load-on-startup>1</load-on-startup>
</servlet>
<servlet-mapping>
  <servlet-name>jersey-servlet</servlet-name>
  <url-pattern>/jersy-api/*</url-pattern>
</servlet-mapping>
```

Or, if using **`ApplicationConfig.java`**:

```java
@ApplicationPath("/api")
public class ApplicationConfig extends ResourceConfig {
  public ApplicationConfig() {
    packages("com.tharindu.jersey.controller", "com.tharindu.jersey.filter");
  }
}
```

---

## 📚 Controllers & Resources

### HomeController.java

```java
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
```

* `@Path` maps URL segments
* `@Produces` selects response media type

---

## 🔍 Request & Response Filters

### RequestFilter.java

```java
@Provider
public class RequestFilter implements ContainerRequestFilter {
    @Override
    public void filter(ContainerRequestContext containerRequestContext) throws IOException {
        System.out.println("Request Filter: Processing request for " + containerRequestContext.getUriInfo().getRequestUri());
    }
}
```

* Runs **before** resource matching
* Ideal for logging, CORS pre-flight, auth token checks

### ResponseFilter.java

```java
@Provider
public class ResponseFilter implements ContainerResponseFilter {
    @Override
    public void filter(ContainerRequestContext containerRequestContext, ContainerResponseContext containerResponseContext) throws IOException {
        System.out.println("Response Filter: Processing response for " + containerRequestContext.getUriInfo().getRequestUri());
    }
}
```

* Runs **after** resource method execution
* Use to add common headers, logging response status

---

## 🏞️ JSP Views

Under `WEB-INF/views`, JSP pages render dynamic content:

* **index.jsp**: Home landing page with links to `http://localhost:8080/JERSEY-WEB/`
* User also can Upload files using Upload button and Perform MVC Uploading functions `fetch(http://localhost:8080/JERSEY-WEB/upload)`

![image](https://github.com/user-attachments/assets/8dbfcc6b-3343-4160-94da-fff94507a893) 

> *Place your view screenshots below:*

![MVC-WEB Tutorial-Dark](https://github.com/user-attachments/assets/421dcad8-3a75-4f59-8da4-3cb39ee06938)

![MVC-WEB Tutorial-Light](https://github.com/user-attachments/assets/315d53c0-504f-4a0d-bc4d-e9b5d7dfa91d)

---

## 📄 Usage Examples

**cURL Plain Text**:

```bash
curl -X GET http://localhost:8080/JERSEY-WEB/
```

**cURL JSON**:

```bash
curl -X GET http://localhost:8080/JERSEY-WEB/
```

---

## 🛠️ Error Handling

* **404 Not Found**: Unmapped path shows `error.jsp`.
* **ExceptionMapper**: Implement `ExceptionMapper<Throwable>` to map exceptions to JSON or JSP error pages.

---

## 🤝 Contributing

1. Fork → branch → PR against `main`.
2. Follow code style and include tests for filters or controllers.

---

## 📜 License

MIT © 2025 Tharindu714

---

> Powered by ☕️ and Jersey expertise


