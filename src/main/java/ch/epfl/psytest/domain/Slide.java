package ch.epfl.psytest.domain;

import javax.persistence.Transient;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@RooJavaBean
@RooToString
@RooEntity
public class Slide {

    private String description;

    private static String pathToSave = "tempDir/";

    @Transient
    private CommonsMultipartFile file;

    private String fileName;

    private long size;

    public CommonsMultipartFile getFile() {
        return file;
    }

    public void setFile(CommonsMultipartFile file) {
    }
}
