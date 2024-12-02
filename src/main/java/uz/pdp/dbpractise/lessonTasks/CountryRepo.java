package uz.pdp.dbpractise.lessonTasks;

import jakarta.persistence.EntityManager;

import java.util.List;

import static uz.pdp.dbpractise.lessonTasks.MyListener.EMF;

public class CountryRepo {

    public static List<Country> getCountries() {
        try (
                EntityManager entityManager = EMF.createEntityManager()
        ) {
           return entityManager.createQuery("from Country", Country.class).getResultList();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static List<ReportData> getReport() {
        try (
                EntityManager entityManager = EMF.createEntityManager()
        ){
           return entityManager.createQuery("""
                 select  new uz.pdp.dbpractise.ReportData(c.name, count(r.id))
                 from Country c 
                 join Region r on r.country.id = c.id
                 group by c.id
                    """, ReportData.class).getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
