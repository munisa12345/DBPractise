package uz.pdp.dbpractise.Homewrok;

import jakarta.persistence.EntityManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static uz.pdp.dbpractise.MyListener.EMF;

@WebServlet("/payment/add")
public class AddPaymentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (
                EntityManager entityManager = EMF.createEntityManager()
        ){
            int amount = Integer.parseInt(req.getParameter("amount"));
            int studentId = Integer.parseInt(req.getParameter("studentId"));


            Student student = entityManager.find(Student.class, studentId);
            entityManager.getTransaction().begin();
            Payment payment = new Payment(null, amount, student);
            entityManager.persist(payment);
            entityManager.getTransaction().commit();

            resp.sendRedirect("/Students.jsp?groupId=" + student.getGroups().getId());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
