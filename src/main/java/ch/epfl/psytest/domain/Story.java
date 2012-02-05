package ch.epfl.psytest.domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OrderColumn;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooEntity
public class Story {

    @ManyToMany(cascade = CascadeType.ALL)
    @OrderColumn
    private List<Slide> slides = new ArrayList<Slide>();

    @ManyToOne
    private Question question;

    private String title;

}
