package ch.epfl.psytest.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.Set;
import ch.epfl.psytest.domain.Story;
import java.util.HashSet;
import javax.persistence.ManyToMany;
import javax.persistence.CascadeType;
import ch.epfl.psytest.domain.ExperimentSession;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooEntity
public class Experiment {

    private Integer subjectAge;

    private String subjectName;

    @ManyToOne
    private ExperimentSession experimentSession;

    private String storyOrder;

    private String questionChoicesOrder;
}
