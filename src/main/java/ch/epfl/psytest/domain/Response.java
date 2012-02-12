package ch.epfl.psytest.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import ch.epfl.psytest.domain.Question;
import javax.persistence.ManyToOne;
import ch.epfl.psytest.domain.Slide;
import ch.epfl.psytest.domain.Experiment;
import ch.epfl.psytest.domain.Story;

@RooJavaBean
@RooToString
@RooEntity
public class Response {

    @ManyToOne
    private Question question;

    @ManyToOne
    private Slide answer;

    @ManyToOne
    private Experiment experiment;

    private int choiceIndexOfAnswer;

    @ManyToOne
    private Story story;
}
