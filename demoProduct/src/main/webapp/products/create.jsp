<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Title</title>
  <link href="../style.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<h1>Create</h1>
<h3>${message}</h3>
<form method="post" enctype="multipart/form-data"
        <c:if test = "${product.id == null}"> action="/products?action=create" </c:if>
        <c:if test = "${product.id != null}"> action="/products?action=edit" </c:if>
>
  <%--        cần phải có thằng formBody thì xài được validation js--%>
  <div id="formBody" class="row">

  </div>
  <button class="btn btn-primary" type="submit">
    <c:if test = "${product.id != null}"> Edit Product </c:if>
    <c:if test = "${product.id == null}"> Create Product </c:if>
  </button>
  <a href="/products" class="btn btn-secondary" onclick="console.log(${product.toString()})">Back</a>
</form>
<script src="../base.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<script>
  <%--const product =<%= product%>;--%>
  //lấy được product ở đây mấy ae tra google để
  // lấy data product từ controller
  var product = ${productJSON};
  const categorys = ${categorysJSON};
  const inputs = [
    {
      label: "Name",
      name: "name",
      pattern: "^[A-Za-z ]{6,20}",
      message: "Name must have minimun is 6 charaters and maximun is 20 charaters",
      require: true,
      classDiv: 'col-6',
      value: product.name || ''
    },
    {
      name:'id',
      value: product.id,
      type: 'hidden',
      classDiv: 'd-none'
    },
    {
      label: "Price",
      name: "price",
      message: "Price must be greater than 0",
      require: true,
      value:  product.price || '',
      pattern: "^[0-9]{4}",
      classDiv: 'col-6'
    },
    {
      label: "Quantity",
      name: "quantity",
      message: "Quantity must be greater than 0",
      require: true,
      value:  product.quantity || '',
      pattern: "^[0-9]{4}",
      classDiv: 'col-6'
    },
    {
      label: "Description",
      name: "description",
      type: "description",
      message: "Description invalid",
      // disable: product.description,
      require: true,
      value:  product.description || '',
      classDiv: 'col-6'
    },
    // {
    //   label: "Create_at",
    //   name: "create_at",
    //   type: "date",
    //   require: true,
    //   value:  product.create_at || '',
    //   classDiv: 'col-6'
    // },
    {
      label: "Category",
      name: "category_id",
      type: "select",
      message: "Please choose category",
      options: categorys?.map(e=> {
        return {
          name: e.name,
          value: e.id
        }
      }),
      require: true,
      value: product.category?.id || '', // có nghĩa là  nếu product.category có giá trị thì sẽ lấy id của category còn không thì lấy ''
      classDiv: 'col-6'
    },
    {
      label: "Avatar",
      name: "avatar",
      type: "file",
      message: "Ask to select the image in the file to set as avatar",
      require: true,
      classDiv: 'col-6',
      value: product.avatar || ''
    }
  ];
  // phải có những dòng dưới này

  const formBody = document.getElementById('formBody'); // DOM formBody theo id

  // loop qua inputs
  inputs.forEach((props, index) => {
    // vẽ từng ô input
    formBody.innerHTML += formInput(props, index);
  })
</script>

</body>
</html>