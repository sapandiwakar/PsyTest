package ch.epfl.psytest.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.Set;
import ch.epfl.psytest.domain.Story;
import java.util.HashSet;
import javax.persistence.ManyToMany;
import javax.persistence.CascadeType;

@RooJavaBean
@RooToString
@RooEntity
public class Experiment {

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Story> stories = new HashSet<Story>();

    private Integer subjectAge;

    private String subjectName;
}
