<%@ page import="uz.pdp.dbpractise.Homewrok.Repositories" %>
<%@ page import="uz.pdp.dbpractise.Homewrok.ReportData" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 12/3/2024
  Time: 11:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Report</title>
</head>
<body>

<h1>Report</h1>
            <%
                List<ReportData> report = Repositories.getReport();
            %>

        <table class="table">
            <thead>
            <tr>
                <th>Course name</th>
                <th>Student name</th>
                <th>Payments</th>
            </tr>
            </thead>

            <tbody>
            <%
                for (ReportData reportData : report) {
            %>
            <tr>
                <td><%=reportData.getCourseName()%></td>
                <td><%=reportData.getStudentCount()%></td>
                <td><%=reportData.getPaymentAmount()%></td>
            </tr>
            </tbody>
            <%
                }
            %>
        </table>

</body>
</html>
