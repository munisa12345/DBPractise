package uz.pdp.dbpractise.lessonTasks;

import jakarta.persistence.EntityManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static uz.pdp.dbpractise.lessonTasks.MyListener.EMF;

@WebServlet("/region/update")
public class UpdateRegion extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (
                EntityManager entityManager = EMF.createEntityManager()
        ) {

            String idParam = req.getParameter("id");
            String name = req.getParameter("name");
            String countryIdParam = req.getParameter("countryId");


            if (idParam == null || countryIdParam == null) {
                throw new RuntimeException("Required parameters are missing");
            }

            int regionId = Integer.parseInt(idParam);
            int countryId = Integer.parseInt(countryIdParam);


            entityManager.getTransaction().begin();
            Region region = entityManager.find(Region.class, regionId);
            Country country = entityManager.find(Country.class, countryId);
            region.setName(name);
            region.setCountry(country);
            entityManager.getTransaction().commit();

            resp.sendRedirect("/Region.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}
