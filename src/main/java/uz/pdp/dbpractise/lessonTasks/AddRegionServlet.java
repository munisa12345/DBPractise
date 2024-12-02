package uz.pdp.dbpractise.lessonTasks;

import jakarta.persistence.EntityManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static uz.pdp.dbpractise.MyListener.EMF;

@WebServlet("/region/add")
public class AddRegionServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (
                EntityManager entityManager = EMF.createEntityManager()
        ){
            String name = req.getParameter("name");
            int countryId = Integer.parseInt(req.getParameter("countryId"));
            Country country = entityManager.find(Country.class, countryId);
            entityManager.getTransaction().begin();
            Region region = new Region(null, name, country);
            entityManager.persist(region);
            entityManager.getTransaction().commit();

            resp.sendRedirect("/Region.jsp");

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
