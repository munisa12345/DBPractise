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


    public static List<Student> getStudents(int id) {
        try (
        EntityManager entityManager = EMF.createEntityManager()
        ) {
            return entityManager.createQuery("from Student s where s.groups.id = :groupId", Student.class)
                    .setParameter("groupId", id)
                    .getResultList();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


    public static List<Payment> getPaymentByStudentId(Integer studentId) {
        try (EntityManager entityManager = EMF.createEntityManager()) {
            return entityManager.createQuery(
                            "SELECT p FROM Payment p WHERE p.student.id = :studentId", Payment.class
                    )
                    .setParameter("studentId", studentId)
                    .getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Xatolik yuz berdi: " + e.getMessage(), e);
        }
    }



    public static Student getStudentById(int id) {

        try (
                EntityManager entityManager = EMF.createEntityManager();
            ){
            return entityManager.find(Student.class, id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static List<ReportData> getReport() {
        System.out.println("hoho");
        try (
                EntityManager entityManager = EMF.createEntityManager()
        ) {
            System.out.println("men tryni ichidan chiqdim");
            List<ReportData> resultList = entityManager.createQuery(
                    """
                            
                                 SELECT new uz.pdp.dbpractise.Homewrok.ReportData(
                                                         c.name,
                                                         COUNT(DISTINCT s.id),
                                                         SUM(CAST(p.amount AS integer))
                                                     )
                                 FROM Course c
                                          JOIN Module m ON m.id = c.id
                                          JOIN Groups g ON g.id = m.id
                                          JOIN Student s ON s.id = g.id
                                          JOIN Payment p ON p.id = s.id
                                 GROUP BY c.id
                    """, ReportData.class).getResultList();

            System.out.println("Ishlladi");
            for (ReportData reportData : resultList) {
                System.out.println(reportData.getCourseName() + " " + reportData.getStudentCount() + " " + reportData.getPaymentAmount());
            }
            return resultList;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
