// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ch.epfl.psytest.domain;

import ch.epfl.psytest.domain.ExperimentSession;
import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ExperimentSession_Roo_Entity {
    
    declare @type: ExperimentSession: @Entity;
    
    @PersistenceContext
    transient EntityManager ExperimentSession.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long ExperimentSession.id;
    
    @Version
    @Column(name = "version")
    private Integer ExperimentSession.version;
    
    public Long ExperimentSession.getId() {
        return this.id;
    }
    
    public void ExperimentSession.setId(Long id) {
        this.id = id;
    }
    
    public Integer ExperimentSession.getVersion() {
        return this.version;
    }
    
    public void ExperimentSession.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void ExperimentSession.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ExperimentSession.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ExperimentSession attached = ExperimentSession.findExperimentSession(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ExperimentSession.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ExperimentSession.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public ExperimentSession ExperimentSession.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ExperimentSession merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager ExperimentSession.entityManager() {
        EntityManager em = new ExperimentSession().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ExperimentSession.countExperimentSessions() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ExperimentSession o", Long.class).getSingleResult();
    }
    
    public static List<ExperimentSession> ExperimentSession.findAllExperimentSessions() {
        return entityManager().createQuery("SELECT o FROM ExperimentSession o", ExperimentSession.class).getResultList();
    }
    
    public static ExperimentSession ExperimentSession.findExperimentSession(Long id) {
        if (id == null) return null;
        return entityManager().find(ExperimentSession.class, id);
    }
    
    public static List<ExperimentSession> ExperimentSession.findExperimentSessionEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ExperimentSession o", ExperimentSession.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
