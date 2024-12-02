<%@ page import="uz.pdp.dbpractise.Homewrok.Repositories" %>
<%@ page import="uz.pdp.dbpractise.Homewrok.Groups" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 12/2/2024
  Time: 10:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Groups</title>
</head>
<body>
<h1>Groups</h1>
      <%
        String id = request.getParameter("moduleId");
        List<Groups> groups = Repositories.getGroups(Integer.parseInt(id));
      %>

        <table class="table">
          <thead>
          <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Action</th>
          </tr>
          </thead>

          <tbody>
          <%
            for (Groups group : groups) {

          %>
          <tr>
            <td><%=group.getId()%></td>
            <td><%=group.getGroupName()%></td>
            <td>
              <form action="/Students.jsp">
                <input type="hidden" value="<%=group.getId()%>" name="groupId">
                <button class="btn btn-dark">Show Student</button>
              </form>
            </td>
          </tr>
          <%
            }
          %>
          </tbody>
        </table>

</body>
</html>
