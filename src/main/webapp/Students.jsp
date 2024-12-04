<%@ page import="uz.pdp.dbpractise.Homewrok.Repositories" %>
<%@ page import="uz.pdp.dbpractise.Homewrok.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.dbpractise.Homewrok.Payment" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 12/2/2024
  Time: 10:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <title>Students</title>
</head>
<body>

<%
  String id = request.getParameter("groupId");
  List<Student> students = Repositories.getStudents(Integer.parseInt(id));
%>

<table class="table">
  <thead>
  <tr>
    <th>Id</th>
    <th>First name</th>
    <th>Payment amount</th>
    <th>Payment button</th>
  </tr>
  </thead>

  <tbody>
  <%
    for (Student student : students) {
      Integer studentId = student.getId();
      List<Payment> payments = Repositories.getPaymentByStudentId(studentId);

      if (payments.isEmpty()) {
  %>
  <tr>
    <td><%= student.getId() %></td>
    <td><%= student.getFirstName() %></td>
    <td>No payments</td>
    <td>
      <form action="addPayment.jsp">
        <input type="hidden" value="<%= student.getId() %>" name="studentId">
        <button class="btn btn-dark">Add payment</button>
      </form>
    </td>
  </tr>
  <%
  } else {
    for (Payment payment : payments) {
  %>
  <tr>
    <td><%= student.getId() %></td>
    <td><%= student.getFirstName() %></td>
    <td><%= payment.getAmount() %></td>
    <td>
      <form action="addPayment.jsp">
        <input type="hidden" value="<%= student.getId() %>" name="studentId">
        <button class="btn btn-dark">Add payment</button>
      </form>
    </td>
  </tr>
  <%
        }
      }
    }
  %>
  </tbody>
</table>

</body>
</html>