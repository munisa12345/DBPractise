<%@ page import="uz.pdp.dbpractise.Homewrok.Repositories" %>
<%@ page import="uz.pdp.dbpractise.Homewrok.Module" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 12/2/2024
  Time: 9:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Module</title>
</head>
<body>

      <%
        String id = request.getParameter("courseId");
        List<Module> module = Repositories.getModule(Integer.parseInt(id));
      %>
<h1>Modules</h1>
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
          for (Module modules : module) {

        %>
        <tr>
          <td><%=modules.getId()%></td>
          <td><%=modules.getModuleName()%></td>
          <td>
            <form action="/Groups.jsp">
              <input type="hidden" value="<%=modules.getId()%>" name="moduleId">
              <button class="btn btn-dark">Show groups</button>
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
