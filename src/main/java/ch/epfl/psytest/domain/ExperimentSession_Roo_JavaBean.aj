// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ch.epfl.psytest.domain;

import ch.epfl.psytest.domain.Story;
import java.lang.String;
import java.util.Date;
import java.util.Set;

privileged aspect ExperimentSession_Roo_JavaBean {
    
    public String ExperimentSession.getDescription() {
        return this.description;
    }
    
    public void ExperimentSession.setDescription(String description) {
        this.description = description;
    }
    
    public String ExperimentSession.getVenue() {
        return this.venue;
    }
    
    public void ExperimentSession.setVenue(String venue) {
        this.venue = venue;
    }
    
    public Date ExperimentSession.getSessionDate() {
        return this.sessionDate;
    }
    
    public void ExperimentSession.setSessionDate(Date sessionDate) {
        this.sessionDate = sessionDate;
    }
    
    public Set<Story> ExperimentSession.getStories() {
        return this.stories;
    }
    
    public void ExperimentSession.setStories(Set<Story> stories) {
        this.stories = stories;
    }
    
    public int ExperimentSession.getNumberOfExperiments() {
        return this.numberOfExperiments;
    }
    
    public void ExperimentSession.setNumberOfExperiments(int numberOfExperiments) {
        this.numberOfExperiments = numberOfExperiments;
    }
    
}
