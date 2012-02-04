package ch.epfl.psytest.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.Set;
import ch.epfl.psytest.domain.Experiment;
import java.util.HashSet;
import javax.persistence.ManyToMany;
import javax.persistence.CascadeType;
import ch.epfl.psytest.domain.Story;

@RooJavaBean
@RooToString
@RooEntity
public class ExperimentSession {

    private String description;

    private String venue;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date sessionDate;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Story> stories = new HashSet<Story>();
}
