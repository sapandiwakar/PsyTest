package ch.epfl.psytest.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import java.util.Set;
import ch.epfl.psytest.domain.Slide;
import java.util.HashSet;
import javax.persistence.ManyToMany;
import javax.persistence.CascadeType;

@RooJavaBean
@RooToString
@RooEntity
public class Question {

    @NotNull
    private String statement;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Slide> choices = new HashSet<Slide>();
}
