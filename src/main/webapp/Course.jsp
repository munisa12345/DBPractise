<%@ page import="uz.pdp.dbpractise.Homewrok.Repositories" %>
<%@ page import="uz.pdp.dbpractise.Homewrok.Course" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 12/2/2024
  Time: 9:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Course</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<body>

<h1>Course</h1>
<%
    List<Course> courses = Repositories.getCourses();
%>
<a href="Report.jsp">
            <button class="btn btn-dark">
                Report
            </button>
</a>


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
                for (Course course : courses) {
            %>
            <tr>
                <td><%=course.getId()%></td>
                <td><%=course.getName()%></td>
                <td>
                    <form action="/Module.jsp">
                        <input type="hidden" value="<%=course.getId()%>" name="courseId">
                        <button class="btn btn-dark">Show module</button>
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
