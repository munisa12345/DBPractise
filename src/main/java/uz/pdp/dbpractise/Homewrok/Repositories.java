package uz.pdp.dbpractise.Homewrok;

import jakarta.persistence.EntityManager;

import java.util.List;

import static uz.pdp.dbpractise.MyListener.EMF;

public class Repositories {

    public static List<Course> getCourses() {

        try (
                EntityManager entityManager = EMF.createEntityManager()
        ) {
            return entityManager.createQuery("from Course ", Course.class).getResultList();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


    public static List<Module> getModule(int id) {
        try (
                EntityManager entityManager = EMF.createEntityManager()
        ) {
            return entityManager.createQuery("from Module m where m.course.id = :courseId", Module.class)
                    .setParameter("courseId", id)
                    .getResultList();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static List<Groups> getGroups(int id) {
        try (
                EntityManager entityManager = EMF.createEntityManager()
        ) {
            return entityManager.createQuery("from Groups g where g.module.id = :moduleId", Groups.class)
                    .setParameter("moduleId", id)
                    .getResultList();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
