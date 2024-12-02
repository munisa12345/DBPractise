<%@ page import="uz.pdp.dbpractise.lessonTasks.CountryRepo" %>
<%@ page import="uz.pdp.dbpractise.lessonTasks.ReportData" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 12/2/2024
  Time: 7:30 PM
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
        <%
            List<ReportData> report = CountryRepo.getReport();
        %>
    <table class="table">
      <thead>
      <tr>
        <th>Country</th>
        <th>Region count</th>
      </tr>
      </thead>
      <tbody>
      <%
          for (ReportData reportData : report) {
      %>
      <tr>
          <td><%=reportData.getCountry()%></td>
          <td><%=reportData.getRegionCount()%></td>
      </tr>
      <%
          }
      %>
      </tbody>
    </table>
</body>
</html>
