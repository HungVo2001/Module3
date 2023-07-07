<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/7/2023
  Time: 2:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.2/css/bootstrap.min.css"
        integrity="sha512-rt/SrQ4UNIaGfDyEXZtNcyWvQeOq0QLygHluFQcSjaGB04IxWhal71tKuzP6K8eYXYB6vJV4pHkXcmFGGQ1/0w=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
  <style>
    html,
    body {
      height: 100%;
    }

    img {
      width: 80px;
      height: 100px;
    }

    tbody>tr>td {
      line-height: 100px;
    }
  </style>

</head>

<body>
<h2>Hiển thị danh sách khách hàng</h2>
<table>
  <form action="/customer" method="get">
    <thead>
    <tr>
      <th>Name</th>
      <th>Dob</th>
      <th>Address</th>
      <th>IMG</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="customer" items="${customers}">
      <tr>
        <td>${customer.name}</td>
        <td>${customer.dob}</td>
        <td>${customer.address}</td>
        <td>
          <img  src="${customer.img}"></td>
      </tr>
    </c:forEach>
    </tbody>
  </form>
</table>
<script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.2/css/bootstrap.min.css"
        integrity="sha512-rt/SrQ4UNIaGfDyEXZtNcyWvQeOq0QLygHluFQcSjaGB04IxWhal71tKuzP6K8eYXYB6vJV4pHkXcmFGGQ1/0w=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
</script>
</body>
</html>
