<%@ page import="uz.pdp.dbpractise.Homewrok.Repositories" %>
<%@ page import="uz.pdp.dbpractise.Homewrok.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Payment Page</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

        <%
          String id = request.getParameter("studentId");
          Student studentById = Repositories.getStudentById(Integer.parseInt(id));
        %>
<div class="container">
  <h2 class="my-4">Make a Payment</h2>

  <form action="/payment/add" method="post">
    <div class="mb-3">
      <input type="hidden" value="<%=studentById.getId()%>" name="studentId">
      <input type="text" class="form-control" id="name" name="name" placeholder="First name" value="<%=studentById.getFirstName()%>">
    </div>
    <div class="mb-3">
      <input type="number" class="form-control" id="amount" name="amount" placeholder="Amount" >
    </div>

    <button type="submit" class="btn btn-primary">Submit Payment</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
