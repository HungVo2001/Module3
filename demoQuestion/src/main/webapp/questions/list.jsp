<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
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
    <form method="post" id="form">
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
    <h1>Question</h1>
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
            <form action="${pageContext.request.contextPath}/questions" class="row">
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
                No.
            </th>
            <th>
<%--                <a--%>
<%--                        <c:if test="${pageable.sortField == 'name' && pageable.sortType == 'DESC'}">--%>
<%--                            href="/users?search=${pageable.search}&sortType=ASC&sortField=name"--%>
<%--                        </c:if>--%>

<%--                        <c:if test="${!(pageable.sortField == 'name' && pageable.sortType == 'DESC')}">--%>
<%--                            href="/users?search=${pageable.search}&sortType=DESC&sortField=name"--%>
<%--                        </c:if>--%>
<%--                >--%>
<%--                    Name--%>
<%--                </a>--%>
                Name

            </th>
            <th>
                Create_at
            </th>
            <th>
                Lever
            </th>
            <th>
                CountTrue
            </th>
            <th>
                CountFalse
            </th>
            <th>
                Category
            </th>
            <th>
                Group
            </th>
            <th>
                Action
            </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${questions}" var="question" varStatus="loop">
            <tr>
                <td>
                        ${question.id}
                </td>
                <td>
                        ${question.name}
                </td>
                <td>
                        ${question.create_at}
                </td>
                <td>
                        ${question.lever}
                </td>
                <td>
                        ${question.countTrue}
                </td>
                <td>
                        ${question.countFalse}
                </td>
                <td>
                        ${question.category.name}
                </td>
                <td>
                        ${question.group.name}
                </td>
                <td>
                    <button onclick="onShowPopup(${question.id})" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"> Edit</button>
                    <a class="btn btn-danger" href="/questions?action=delete&id=${question.id}"
                       onclick="return confirm('Do you wanna delete this ${question.name}')">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>

    </table>

<%--    <div class="d-flex justify-content-end">--%>
<%--        <nav aria-label="...">--%>
<%--            <ul class="pagination">--%>
<%--                <li class="page-item--%>
<%--                    <c:if test="${pageable.page == 1}"> disabled </c:if> ">--%>
<%--                    <a class="page-link" <c:if test="${pageable.page > 1}">--%>
<%--                        href="/users?page=${pageable.page - 1}&search=${pageable.search}&sortType=${pageable.sortType}&sortField=${pageable.sortField}" </c:if>--%>
<%--                    >Previous</a>--%>
<%--                </li>--%>
<%--                &lt;%&ndash;                neu page > 3   > 0&ndash;%&gt;--%>
<%--                <c:forEach begin="1" end="${pageable.totalPage}" var="num">--%>
<%--                    <c:if test="${pageable.page == num}">--%>
<%--                        <li class="page-item active" aria-current="page">--%>
<%--                            <a class="page-link"--%>
<%--                               href="/users?page=${num}&search=${pageable.search}&sortType=${pageable.sortType}&sortField=${pageable.sortField}"--%>
<%--                            >${num}</a>--%>
<%--                        </li>--%>
<%--                    </c:if>--%>
<%--                    <c:if test="${pageable.page != num}">--%>
<%--                        <li class="page-item">--%>
<%--                            <a class="page-link"--%>
<%--                               href="/users?page=${num}&search=${pageable.search}&sortType=${pageable.sortType}&sortField=${pageable.sortField}"--%>
<%--                            >${num}</a>--%>
<%--                        </li>--%>
<%--                    </c:if>--%>
<%--                </c:forEach>--%>

<%--                <li class="page-item--%>
<%--                    <c:if test="${pageable.page == pageable.totalPage}"> disabled </c:if> "--%>
<%--                >--%>
<%--                    <a class="page-link" <c:if test="${pageable.page < pageable.totalPage}">--%>
<%--                        href="/users?page=${pageable.page + 1}&search=${pageable.search}&sortType=${pageable.sortType}&sortField=${pageable.sortField}" </c:if>--%>
<%--                    >Next</a>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </nav>--%>
<%--    </div>--%>
</div>


<script src="../base.js" ></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<script>
    const questions = ${questionsJSON};
    const levers = ${leverJSON};
    const categorys = ${categorysJSON};
    const groups = ${groupsJSON};
    let question = {};
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
        tileModal.innerHTML = title + " Question";
        form.setAttribute('action', '/questions?action='+ action);
        question = questions.find(question => question.id === id) || {}; //
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
                value: question.name || ''
            },
            {
                name:'id',
                value: question.id,
                type: 'hidden',
                classDiv: 'd-none'
            },
            // {
            //     label: "Create_at",
            //     name: "create_at",
            //     type: "date",
            //     require: true,
            //     value:  question.create_at || '',
            //     classDiv: 'col-6'
            // },
            {
                label: "Lever",
                name: "lever",
                type: "select",
                message: "Please choose lever",
                options: levers?.map(e=> {
                    return {
                        name: e,
                        value: e
                    }
                }),
                require: true,
                value: question.lever || '',
                classDiv: 'col-6'
            },
            {
                label: "CountTrue",
                name: "countTrue",
                message: "True or False",
                require: true,
                value:  question.countTrue || '',
                pattern: "^[A-Za-z]{0,4}",
                classDiv: 'col-6'
            },
            {
                label: "CountFalse",
                name: "countFalse",
                // type: "email",
                message: "True or False",
                // disable: user.email,
                require: true,
                value:  question.countFalse || '',
                pattern: "^[A-Za-z]{0,4}",
                classDiv: 'col-6'
            },
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
                value: question.category?.id || '', // có nghĩa là  nếu user.role có giá trị thì sẽ lấy id của role còn không thì lấy ''
                classDiv: 'col-6'
            },
            {
                label: "Group",
                name: "group_id",
                type: "select",
                message: "Please choose group",
                options: groups?.map(e=> {
                    return {
                        name: e.name,
                        value: e.id
                    }
                }),
                require: true,
                value: question.group?.id || '', // có nghĩa là  nếu user.role có giá trị thì sẽ lấy id của role còn không thì lấy ''
                classDiv: 'col-6'
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