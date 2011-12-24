// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ch.epfl.psytest.domain;

import ch.epfl.psytest.domain.ExperimentSession;
import java.lang.String;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect ExperimentSessionDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ExperimentSessionDataOnDemand: @Component;
    
    private Random ExperimentSessionDataOnDemand.rnd = new SecureRandom();
    
    private List<ExperimentSession> ExperimentSessionDataOnDemand.data;
    
    public ExperimentSession ExperimentSessionDataOnDemand.getNewTransientExperimentSession(int index) {
        ExperimentSession obj = new ExperimentSession();
        setDescription(obj, index);
        setSessionDate(obj, index);
        setVenue(obj, index);
        return obj;
    }
    
    public void ExperimentSessionDataOnDemand.setDescription(ExperimentSession obj, int index) {
        String description = "description_" + index;
        obj.setDescription(description);
    }
    
    public void ExperimentSessionDataOnDemand.setSessionDate(ExperimentSession obj, int index) {
        Date sessionDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setSessionDate(sessionDate);
    }
    
    public void ExperimentSessionDataOnDemand.setVenue(ExperimentSession obj, int index) {
        String venue = "venue_" + index;
        obj.setVenue(venue);
    }
    
    public ExperimentSession ExperimentSessionDataOnDemand.getSpecificExperimentSession(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        ExperimentSession obj = data.get(index);
        return ExperimentSession.findExperimentSession(obj.getId());
    }
    
    public ExperimentSession ExperimentSessionDataOnDemand.getRandomExperimentSession() {
        init();
        ExperimentSession obj = data.get(rnd.nextInt(data.size()));
        return ExperimentSession.findExperimentSession(obj.getId());
    }
    
    public boolean ExperimentSessionDataOnDemand.modifyExperimentSession(ExperimentSession obj) {
        return false;
    }
    
    public void ExperimentSessionDataOnDemand.init() {
        data = ExperimentSession.findExperimentSessionEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'ExperimentSession' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<ch.epfl.psytest.domain.ExperimentSession>();
        for (int i = 0; i < 10; i++) {
            ExperimentSession obj = getNewTransientExperimentSession(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> it = e.getConstraintViolations().iterator(); it.hasNext();) {
                    ConstraintViolation<?> cv = it.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
