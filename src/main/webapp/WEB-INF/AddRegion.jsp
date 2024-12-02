<%@ page import="uz.pdp.dbpractise.lessonTasks.CountryRepo" %>
<%@ page import="uz.pdp.dbpractise.lessonTasks.Country" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.dbpractise.lessonTasks.Region" %>
<%@ page import="uz.pdp.dbpractise.lessonTasks.RegionRepo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Add Region</title>
</head>
<body>

<%
    List<Country> countries = CountryRepo.getCountries();
    String id = request.getParameter("id");
    Region region = null;

    try {
        if (id != null && !id.isEmpty()) { // Null yoki bo'sh qiymatni tekshirish
            region = RegionRepo.getById(Integer.parseInt(id));
        }
    } catch (Exception e) {
        // Xatolik yuzaga kelsa, uni logga yozish
        e.printStackTrace();
    }
%>

<div class="row">
    <div class="col-6 offset-3">
        <div class="card">
            <div class="card-header">
                <%= region == null ? "Add region" : "Update region" %>
            </div>
            <div class="card-body">
                <form action="<%= region == null ? "/region/add" : "/region/update" %>" method="post">

                    <% if (region != null) { %>
                    <input type="hidden" name="id" value="<%= region.getId() %>">
                    <% } %>
                    <input value="<%= region == null ? "" : region.getName() %>"
                           class="form-control" type="text" placeholder="Name" name="name">
                    <select class="form-control" name="countryId">
                        <option selected disabled value="">Select country</option>
                        <% for (Country country : countries) {
                            boolean isSelected = region != null && region.getCountry().getId().equals(country.getId());
                        %>
                        <option value="<%= country.getId() %>" <%= isSelected ? "selected" : "" %>>
                            <%= country.getName() %>
                        </option>
                        <% } %>
                    </select>
                    <button class="btn btn-success">Save</button>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
