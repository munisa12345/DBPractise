<%@ page import="uz.pdp.dbpractise.lessonTasks.RegionRepo" %>
<%@ page import="uz.pdp.dbpractise.lessonTasks.Region" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 12/2/2024
  Time: 3:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Region</title>
</head>
<body>

        <%
            List<Region> regions = RegionRepo.getRegions();
        %>
<a href="AddRegion.jsp" >
    <button class="btn btn-dark">Add region</button>
</a>

<hr>
        <table class="table">
            <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Country</th>
                <th>Action</th>
            </tr>
            </thead>

            <tbody>
            <%
                for (Region region : regions) {
            %>
            <tr>
                <td><%= region.getId() %></td>
                <td><%= region.getName() %></td>
                <td><%= region.getCountry().getName() %></td>
                <td>
                    <div class="btn-group">
                    <form action="/WEB-INF/AddRegion.jspgion.jsp">
                        <input type="hidden" value="<%=region.getId()%>" name="id">
                        <button class="btn btn-dark">update</button>
                    </form>
                        <form action="">
                    <button class="btn btn-dark">delete</button>
                        </form>
                    </div>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>

        </table>


</body>
</html>
