package ch.epfl.psytest.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.Set;
import ch.epfl.psytest.domain.Slide;
import java.util.HashSet;
import javax.persistence.ManyToMany;
import javax.persistence.CascadeType;
import ch.epfl.psytest.domain.Question;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooEntity
public class Story {

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Slide> slides = new HashSet<Slide>();

    @ManyToOne
    private Question question;
}
