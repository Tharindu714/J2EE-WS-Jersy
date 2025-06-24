package com.tharindu.jersey.controller;

import com.tharindu.jersey.model.User;
import jakarta.inject.Inject;
import jakarta.servlet.ServletContext;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import org.apache.commons.io.FilenameUtils;
import org.glassfish.jersey.media.multipart.ContentDisposition;
import org.glassfish.jersey.media.multipart.FormDataBodyPart;
import org.glassfish.jersey.media.multipart.FormDataParam;
import org.glassfish.jersey.server.mvc.Viewable;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

@Path("/")
public class HomeController {

    @Inject
    User user;

    @GET
    public Viewable index() {
        System.out.println(user);
        Map<String, Object> model = new HashMap<>();
        model.put("message", "Welcome to the Home Page!");

        return new Viewable("/index", model);
    }

    @POST
    @Path("/upload")
    @Consumes(MediaType.MULTIPART_FORM_DATA)
    public Response FileUpload(
            @FormDataParam("file") FormDataBodyPart body,
            @Context ServletContext servletContext) {

        InputStream content = body.getValueAs(InputStream.class);
        ContentDisposition cd = body.getContentDisposition();
        String fileName = cd.getFileName();
        String extension = FilenameUtils.getExtension(fileName);

        try {
            // 1) Read the directory from web.xml
            String realPath = servletContext.getInitParameter("upload.directory");
            if (realPath == null) {
                throw new IOException("upload.directory not configured in web.xml");
            }
            System.out.println("Uploading to: " + realPath);

            // 2) Ensure it exists
            File uploadDir = new File(realPath);
            if (!uploadDir.exists() && !uploadDir.mkdirs()) {
                throw new IOException("Could not create upload directory at " + realPath);
            }
            // 3) build a unique target file
            String baseName = FilenameUtils.getBaseName(fileName);
            String uniqueName = baseName
                    + "_" + System.currentTimeMillis()
                    + (extension.isEmpty() ? "" : "." + extension);
            File targetFile = new File(uploadDir, uniqueName);

            // 4) stream the bytes
            try (FileOutputStream out = new FileOutputStream(targetFile)) {
                byte[] buffer = new byte[1024];
                int read;
                while ((read = content.read(buffer)) != -1) {
                    out.write(buffer, 0, read);
                }
            }

        } catch (IOException ex) {
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
                    .entity("File upload failed: " + ex.getMessage())
                    .build();
        }

        return Response.ok("Uploaded as: " + fileName).build();
    }
}
