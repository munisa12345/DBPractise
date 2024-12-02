package uz.pdp.dbpractise.lessonTasks;

import jakarta.persistence.EntityManager;

import java.util.List;

import static uz.pdp.dbpractise.lessonTasks.MyListener.EMF;

public class RegionRepo {

    public static List<Region> getRegions() {

        try (
                EntityManager entityManager = EMF.createEntityManager()
        ){
       return entityManager.createQuery("from Region r", Region.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static Region getById(int id) {

        try (
                EntityManager entityManager = EMF.createEntityManager()
        ){
          return entityManager.find(Region.class, id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
