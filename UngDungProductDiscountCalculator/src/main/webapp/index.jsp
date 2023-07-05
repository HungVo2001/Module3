<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<h2>Product Discount Calculator</h2>
<form action="/display-discount" method="post">
    <label>Product Description</label><br/>
    <input type="text" name="productdescription" placeholder="Product Description"/><br/>
    <label>List Price</label><br/>
    <input type="text" name="listprice" placeholder="List Price"><br/>
    <label>Discount Percent</label><br/>
    <input type="text" name="discountpercent" placeholder="Discount Percent"><br/>
    <input type="submit" id="submit" value="Calculate Discount"/>
</form>
</body>
</html>