// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ch.epfl.psytest.web;

import ch.epfl.psytest.domain.Experiment;
import ch.epfl.psytest.domain.ExperimentSession;
import ch.epfl.psytest.domain.Question;
import ch.epfl.psytest.domain.Slide;
import ch.epfl.psytest.domain.Story;
import java.lang.String;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(new ExperimentConverter());
        registry.addConverter(new ExperimentSessionConverter());
        registry.addConverter(new QuestionConverter());
        registry.addConverter(new SlideConverter());
        registry.addConverter(new StoryConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
    static class ch.epfl.psytest.web.ApplicationConversionServiceFactoryBean.ExperimentConverter implements Converter<Experiment, String> {
        public String convert(Experiment experiment) {
            return new StringBuilder().append(experiment.getSubjectAge()).append(" ").append(experiment.getSubjectName()).toString();
        }
        
    }
    
    static class ch.epfl.psytest.web.ApplicationConversionServiceFactoryBean.ExperimentSessionConverter implements Converter<ExperimentSession, String> {
        public String convert(ExperimentSession experimentSession) {
            return new StringBuilder().append(experimentSession.getDescription()).append(" ").append(experimentSession.getVenue()).append(" ").append(experimentSession.getSessionDate()).toString();
        }
        
    }
    
    static class ch.epfl.psytest.web.ApplicationConversionServiceFactoryBean.QuestionConverter implements Converter<Question, String> {
        public String convert(Question question) {
            return new StringBuilder().append(question.getStatement()).toString();
        }
        
    }
    
    static class ch.epfl.psytest.web.ApplicationConversionServiceFactoryBean.SlideConverter implements Converter<Slide, String> {
        public String convert(Slide slide) {
            return new StringBuilder().append(slide.getFile()).append(" ").append(slide.getDescription()).append(" ").append(slide.getFileName()).append(" ").append(slide.getSize()).toString();
        }
        
    }
    
    static class ch.epfl.psytest.web.ApplicationConversionServiceFactoryBean.StoryConverter implements Converter<Story, String> {
        public String convert(Story story) {
            return new StringBuilder().append(story.getTitle()).toString();
        }
        
    }
    
}
