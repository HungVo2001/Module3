<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="../style.css" rel="stylesheet" />
</head>
<body>
<div class="container card" style="height: 100vh">
    <div class="toast-body d-none"  id="message">
        ${message}
    </div>


    <!-- Modal -->
    <form method="post" id="form" enctype="multipart/form-data">
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <%--        cần phải có thằng formBody thì xài được validation js--%>
                        <div id="formBody" class="row">

                        </div>


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <h1>Product Category</h1>
    <div class="row">
        <div class="col-2">
            <button onclick="onShowPopup()" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                Create
            </button>
            <%--        <a class="btn btn-primary" href="${pageContext.request.contextPath}/users?action=create"> Create</a>--%>
        </div>
        <div class="col-4">

        </div>
        <div class="col-6">
            <form action="${pageContext.request.contextPath}/products" class="row">
                <div class="col-10">
                    <input type="search" name="search" value="${pageable.search}" class="form-control">
                </div>

                <div class="col-2">
                    <button class="btn btn-primary">
                        Search
                    </button>
                </div>
            </form>

        </div>
    </div>

    <table class="table table-striped table-hover">
        <thead>
        <tr>
            <th>
                <a
                        <c:if test="${pageable.sortField == 'name' && pageable.sortType == 'DESC'}">
                            href="/products?search=${pageable.search}&sortType=ASC&sortField=name"
                        </c:if>

                        <c:if test="${!(pageable.sortField == 'name' && pageable.sortType == 'DESC')}">
                            href="/products?search=${pageable.search}&sortType=DESC&sortField=name"
                        </c:if>
                >
                    No.
                    <i class="fa-solid fa-chevron-down"></i>
                </a>

            </th>
            <th>
                Name
            </th>
            <th>
                <a
                        <c:if test="${pageable.sortField == 'name' && pageable.sortType == 'DESC'}">
                            href="/products?search=${pageable.search}&sortType=ASC&sortField=name"
                        </c:if>

                        <c:if test="${!(pageable.sortField == 'name' && pageable.sortType == 'DESC')}">
                            href="/products?search=${pageable.search}&sortType=DESC&sortField=name"
                        </c:if>
                >
                    Price
                    <i class="fa-solid fa-chevron-down"></i>
                </a>

            </th>
            <th>
                Quantity
            </th>
            <th>
                Category
            </th>
            <th>
                Description
            </th>
            <th>
                Create_at
            </th>
            <th>
                Avatar
            </th>
            <th>
                Action
            </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${products}" var="product" varStatus="loop">
            <tr>
                <td>
                        ${product.id}
                </td>
                <td>
                        ${product.name}
                </td>
                <td>
                        ${product.price}
                </td>
                <td>
                        ${product.quantity}
                </td>
                <td>
                        ${product.category.name}
                </td>
                <td>
                        ${product.description}
                </td>
                <td>
                        ${product.create_at}
                </td>
                <td>
<%--                    ${product.avatar}--%>
                        <img src=${product.avatar}>
                </td>
                <td>
                    <button onclick="onShowPopup(${product.id})" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"> Edit</button>
                    <a class="btn btn-danger" href="/products?action=delete&id=${product.id}"
                       onclick="return confirm('Do you wanna delete this ${product.name}')">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>

    </table>
    <div class="d-flex justify-content-end">
        <nav aria-label="...">
            <ul class="pagination">
                <li class="page-item
                    <c:if test="${pageable.page == 1}"> disabled </c:if> ">
                    <a class="page-link" <c:if test="${pageable.page > 1}">
                        href="/products?page=${pageable.page - 1}&search=${pageable.search}&sortType=${pageable.sortType}&sortField=${pageable.sortField}" </c:if>
                    >Previous</a>
                </li>
                <%--                neu page > 3   > 0--%>
                <c:forEach begin="1" end="${pageable.totalPage}" var="num">
                    <c:if test="${pageable.page == num}">
                        <li class="page-item active" aria-current="page">
                            <a class="page-link"
                               href="/products?page=${num}&search=${pageable.search}&sortType=${pageable.sortType}&sortField=${pageable.sortField}"
                            >${num}</a>
                        </li>
                    </c:if>
                    <c:if test="${pageable.page != num}">
                        <li class="page-item">
                            <a class="page-link"
                               href="/products?page=${num}&search=${pageable.search}&sortType=${pageable.sortType}&sortField=${pageable.sortField}"
                            >${num}</a>
                        </li>
                    </c:if>
                </c:forEach>

                <li class="page-item
                    <c:if test="${pageable.page == pageable.totalPage}"> disabled </c:if> "
                >
                    <a class="page-link" <c:if test="${pageable.page < pageable.totalPage}">
                        href="/products?page=${pageable.page + 1}&search=${pageable.search}&sortType=${pageable.sortType}&sortField=${pageable.sortField}" </c:if>
                    >Next</a>
                </li>
            </ul>
        </nav>
    </div>
</div>


<script src="../base.js" ></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<script>
    const products = ${productsJSON};
    const categorys = ${categorysJSON};
    let product = {};
    let inputs = [];
    const message = document.getElementById('message');
    const btnToast = document.getElementById('liveToastBtn');
    const form = document.getElementById('form');
    const tileModal = document.getElementById("exampleModalLabel");
    window.onload = () => {
        if(message.innerHTML.trim() !== ''){
            toastr.success(message.innerHTML);
        }
    }
    function onShowPopup(id){
        let action = "create";
        let title = "Create";
        if(id){
            action = "edit";
            title = "Edit";
        }
        tileModal.innerHTML = title + " Product";
        form.setAttribute('action', '/products?action='+ action);
        product = products.find(product => product.id === id) || {}; //
        resetData();
    }
    function resetData(){
        inputs = [
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
            //     label: "Create_at",
            //     name: "create_at",
            //     type: "date",
            //     require: true,
            //     value:  product.create_at || '',
            //     classDiv: 'col-6'
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
        const formBody = document.getElementById('formBody'); // DOM formBody theo id
        formBody.innerHTML = '';
        // loop qua inputs
        inputs.forEach((props, index) => {
            // vẽ từng ô input
            formBody.innerHTML += formInput(props, index);
        })
    }
</script>
</body>
</html>
