<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Victory Admin</title>
    <link href="../style.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <jsp:include page="/WEB-INF/dashboard/layout/head_css.jsp"></jsp:include>
</head>

<body>
<div class="container-scroller">
    <!-- partial:../../partials/_navbar.html -->
    <jsp:include page="/WEB-INF/dashboard/layout/navbar.jsp"></jsp:include>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <div class="row row-offcanvas row-offcanvas-right">
            <!-- partial:../../partials/_settings-panel.html -->
            <div class="theme-setting-wrapper">
                <div id="settings-trigger"><i class="mdi mdi-settings"></i></div>
                <div id="theme-settings" class="settings-panel">
                    <i class="settings-close mdi mdi-close"></i>
                    <p class="settings-heading">SIDEBAR SKINS</p>
                    <div class="sidebar-bg-options selected" id="sidebar-light-theme"><div class="img-ss rounded-circle bg-light border mr-3"></div>Light</div>
                    <div class="sidebar-bg-options" id="sidebar-dark-theme"><div class="img-ss rounded-circle bg-dark border mr-3"></div>Dark</div>
                    <p class="settings-heading mt-2">HEADER SKINS</p>
                    <div class="color-tiles mx-0 px-4">
                        <div class="tiles primary"></div>
                        <div class="tiles success"></div>
                        <div class="tiles warning"></div>
                        <div class="tiles danger"></div>
                        <div class="tiles pink"></div>
                        <div class="tiles info"></div>
                        <div class="tiles dark"></div>
                        <div class="tiles default"></div>
                    </div>
                </div>
            </div>
            <div id="right-sidebar" class="settings-panel">
                <i class="settings-close mdi mdi-close"></i>
                <ul class="nav nav-tabs" id="setting-panel" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="todo-tab" data-toggle="tab" href="#todo-section" role="tab" aria-controls="todo-section" aria-expanded="true">TO DO LIST</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="chats-tab" data-toggle="tab" href="#chats-section" role="tab" aria-controls="chats-section">CHATS</a>
                    </li>
                </ul>
                <div class="tab-content" id="setting-content">
                    <div class="tab-pane fade show active scroll-wrapper" id="todo-section" role="tabpanel" aria-labelledby="todo-section">
                        <div class="add-items d-flex px-3 mb-0">
                            <form class="form w-100">
                                <div class="form-group d-flex">
                                    <input type="text" class="form-control todo-list-input" placeholder="Add To-do">
                                    <button type="submit" class="add btn btn-primary todo-list-add-btn" id="add-task">Add</button>
                                </div>
                            </form>
                        </div>
                        <div class="list-wrapper px-3">
                            <ul class="d-flex flex-column-reverse todo-list">
                                <li>
                                    <div class="form-check">
                                        <label class="form-check-label">
                                            <input class="checkbox" type="checkbox">
                                            Team review meeting at 3.00 PM
                                        </label>
                                    </div>
                                    <i class="remove mdi mdi-close-circle-outline"></i>
                                </li>
                                <li>
                                    <div class="form-check">
                                        <label class="form-check-label">
                                            <input class="checkbox" type="checkbox">
                                            Prepare for presentation
                                        </label>
                                    </div>
                                    <i class="remove mdi mdi-close-circle-outline"></i>
                                </li>
                                <li>
                                    <div class="form-check">
                                        <label class="form-check-label">
                                            <input class="checkbox" type="checkbox">
                                            Resolve all the low priority tickets due today
                                        </label>
                                    </div>
                                    <i class="remove mdi mdi-close-circle-outline"></i>
                                </li>
                                <li class="completed">
                                    <div class="form-check">
                                        <label class="form-check-label">
                                            <input class="checkbox" type="checkbox" checked="">
                                            Schedule meeting for next week
                                        </label>
                                    </div>
                                    <i class="remove mdi mdi-close-circle-outline"></i>
                                </li>
                                <li class="completed">
                                    <div class="form-check">
                                        <label class="form-check-label">
                                            <input class="checkbox" type="checkbox" checked="">
                                            Project review
                                        </label>
                                    </div>
                                    <i class="remove mdi mdi-close-circle-outline"></i>
                                </li>
                            </ul>
                        </div>
                        <div class="events py-4 border-bottom px-3">
                            <div class="wrapper d-flex mb-2">
                                <i class="mdi mdi-circle-outline text-primary mr-2"></i>
                                <span>Feb 11 2018</span>
                            </div>
                            <p class="mb-0 font-weight-thin text-gray">Creating component page</p>
                            <p class="text-gray mb-0">build a js based app</p>
                        </div>
                        <div class="events pt-4 px-3">
                            <div class="wrapper d-flex mb-2">
                                <i class="mdi mdi-circle-outline text-primary mr-2"></i>
                                <span>Feb 7 2018</span>
                            </div>
                            <p class="mb-0 font-weight-thin text-gray">Meeting with Alisa</p>
                            <p class="text-gray mb-0 ">Call Sarah Graves</p>
                        </div>
                    </div>
                    <!-- To do section tab ends -->
                    <div class="tab-pane fade" id="chats-section" role="tabpanel" aria-labelledby="chats-section">
                        <div class="d-flex align-items-center justify-content-between border-bottom">
                            <p class="settings-heading border-top-0 mb-3 pl-3 pt-0 border-bottom-0 pb-0">Friends</p>
                            <small class="settings-heading border-top-0 mb-3 pt-0 border-bottom-0 pb-0 pr-3 font-weight-normal">See All</small>
                        </div>
                        <ul class="chat-list">
                            <li class="list active">
                                <div class="profile"><img src="\dashboard\assets\images\faces\face1.jpg" alt="image"><span class="online"></span></div>
                                <div class="info">
                                    <p>Thomas Douglas</p>
                                    <p>Available</p>
                                </div>
                                <small class="text-muted my-auto">19 min</small>
                            </li>
                            <li class="list">
                                <div class="profile"><img src="\dashboard\assets\images\faces\face2.jpg" alt="image"><span class="offline"></span></div>
                                <div class="info">
                                    <div class="wrapper d-flex">
                                        <p>Catherine</p>
                                    </div>
                                    <p>Away</p>
                                </div>
                                <div class="badge badge-success badge-pill my-auto mx-2">4</div>
                                <small class="text-muted my-auto">23 min</small>
                            </li>
                            <li class="list">
                                <div class="profile"><img src="\dashboard\assets\images\faces\face3.jpg" alt="image"><span class="online"></span></div>
                                <div class="info">
                                    <p>Daniel Russell</p>
                                    <p>Available</p>
                                </div>
                                <small class="text-muted my-auto">14 min</small>
                            </li>
                            <li class="list">
                                <div class="profile"><img src="\dashboard\assets\images\faces\face4.jpg" alt="image"><span class="offline"></span></div>
                                <div class="info">
                                    <p>James Richardson</p>
                                    <p>Away</p>
                                </div>
                                <small class="text-muted my-auto">2 min</small>
                            </li>
                            <li class="list">
                                <div class="profile"><img src="\dashboard\assets\images\faces\face5.jpg" alt="image"><span class="online"></span></div>
                                <div class="info">
                                    <p>Madeline Kennedy</p>
                                    <p>Available</p>
                                </div>
                                <small class="text-muted my-auto">5 min</small>
                            </li>
                            <li class="list">
                                <div class="profile"><img src="\dashboard\assets\images\faces\face6.jpg" alt="image"><span class="online"></span></div>
                                <div class="info">
                                    <p>Sarah Graves</p>
                                    <p>Available</p>
                                </div>
                                <small class="text-muted my-auto">47 min</small>
                            </li>
                        </ul>
                    </div>
                    <!-- chat tab ends -->
                </div>
            </div>
            <!-- partial -->
            <!-- partial:../../partials/_sidebar.html -->
            <nav class="sidebar sidebar-offcanvas" id="sidebar">
                <ul class="nav">
                    <li class="nav-item nav-profile">
                        <div class="nav-link">
                            <div class="profile-image">
                                <img src="\dashboard\assets\images\faces\face10.jpg" alt="image">
                                <span class="online-status online"></span> <!--change class online to offline or busy as needed-->
                            </div>
                            <div class="profile-name">
                                <p class="name">
                                    Marina Michel
                                </p>
                                <p class="designation">
                                    Super Admin
                                </p>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/products">
                            <i class="icon-rocket menu-icon"></i>
                            <span class="menu-title">Dashboard</span>
                            <span class="badge badge-success">New</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="..\widgets.html">
                            <i class="icon-shield menu-icon"></i>
                            <span class="menu-title">Widgets</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#page-layouts" aria-expanded="false" aria-controls="page-layouts">
                            <i class="icon-check menu-icon"></i>
                            <span class="menu-title">Page Layouts</span>
                            <span class="badge badge-danger">3</span>
                        </a>
                        <div class="collapse" id="page-layouts">
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item d-none d-lg-block"> <a class="nav-link" href="..\layout\boxed-layout.html">Boxed</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\layout\rtl-layout.html">RTL</a></li>
                                <li class="nav-item d-none d-lg-block"> <a class="nav-link" href="..\layout\horizontal-menu.html">Horizontal Menu</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item d-none d-lg-block">
                        <a class="nav-link" data-toggle="collapse" href="#sidebar-layouts" aria-expanded="false" aria-controls="sidebar-layouts">
                            <i class="icon-layers menu-icon"></i>
                            <span class="menu-title">Sidebar Layouts</span>
                            <span class="badge badge-warning">5</span>
                        </a>
                        <div class="collapse" id="sidebar-layouts">
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item"> <a class="nav-link" href="..\layout\compact-menu.html">Compact menu</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\layout\sidebar-collapsed.html">Icon menu</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\layout\sidebar-hidden.html">Sidebar Hidden</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\layout\sidebar-hidden-overlay.html">Sidebar Overlay</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\layout\sidebar-fixed.html">Sidebar Fixed</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                            <i class="icon-target menu-icon"></i>
                            <span class="menu-title">Basic UI Elements</span>
                            <span class="badge badge-success">10</span>
                        </a>
                        <div class="collapse" id="ui-basic">
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item"> <a class="nav-link" href="..\ui-features\accordions.html">Accordions</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\ui-features\buttons.html">Buttons</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\ui-features\badges.html">Badges</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\ui-features\breadcrumbs.html">Breadcrumbs</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\ui-features\dropdowns.html">Dropdowns</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\ui-features\modals.html">Modals</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\ui-features\progress.html">Progress bar</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\ui-features\pagination.html">Pagination</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\ui-features\tabs.html">Tabs</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\ui-features\typography.html">Typography</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\ui-features\tooltips.html">Tooltips</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#ui-advanced" aria-expanded="false" aria-controls="ui-advanced">
                            <i class="icon-cup menu-icon"></i>
                            <span class="menu-title">Advanced Elements</span>
                            <span class="badge badge-primary">8</span>
                        </a>
                        <div class="collapse" id="ui-advanced">
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item"> <a class="nav-link" href="..\ui-features\dragula.html">Dragula</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\ui-features\clipboard.html">Clipboard</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\ui-features\context-menu.html">Context menu</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\ui-features\slider.html">Sliders</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\ui-features\carousel.html">Carousel</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\ui-features\colcade.html">Colcade</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\ui-features\loaders.html">Loaders</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\ui-features\tour.html">Tour</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
                            <i class="icon-flag menu-icon"></i>
                            <span class="menu-title">Form elements</span>
                            <span class="badge badge-danger">3</span>
                        </a>
                        <div class="collapse" id="form-elements">
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item"><a class="nav-link" href="..\forms\basic_elements.html">Basic Elements</a></li>
                                <li class="nav-item"><a class="nav-link" href="..\forms\advanced_elements.html">Advanced Elements</a></li>
                                <li class="nav-item"><a class="nav-link" href="..\forms\validation.html">Validation</a></li>
                                <li class="nav-item"><a class="nav-link" href="..\forms\wizard.html">Wizard</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#editors" aria-expanded="false" aria-controls="editors">
                            <i class="icon-anchor menu-icon"></i>
                            <span class="menu-title">Editors</span>
                            <span class="badge badge-info">3</span>
                        </a>
                        <div class="collapse" id="editors">
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item"><a class="nav-link" href="..\forms\text_editor.html">Text editors</a></li>
                                <li class="nav-item"><a class="nav-link" href="..\forms\code_editor.html">Code editors</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
                            <i class="icon-pie-chart menu-icon"></i>
                            <span class="menu-title">Charts</span>
                            <span class="badge badge-warning">8</span>
                        </a>
                        <div class="collapse" id="charts">
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item"> <a class="nav-link" href="..\charts\chartjs.html">ChartJs</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\charts\morris.html">Morris</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\charts\flot-chart.html">Flot</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\charts\google-charts.html">Google charts</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\charts\sparkline.html">Sparkline js</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\charts\c3.html">C3 charts</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\charts\chartist.html">Chartists</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\charts\justGage.html">JustGage</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
                            <i class="icon-grid menu-icon"></i>
                            <span class="menu-title">Tables</span>
                            <span class="badge badge-info">4</span>
                        </a>
                        <div class="collapse" id="tables">
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item"> <a class="nav-link" href="list.jsp">Basic table</a></li>
                                <li class="nav-item"> <a class="nav-link" href="data-table.html">Data table</a></li>
                                <li class="nav-item"> <a class="nav-link" href="js-grid.html">Js-grid</a></li>
                                <li class="nav-item"> <a class="nav-link" href="sortable-table.html">Sortable table</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="..\ui-features\popups.html">
                            <i class="icon-diamond menu-icon"></i>
                            <span class="menu-title">Popups</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="..\ui-features\notifications.html">
                            <i class="icon-bell menu-icon"></i>
                            <span class="menu-title">Notifications</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#icons" aria-expanded="false" aria-controls="icons">
                            <i class="icon-globe menu-icon"></i>
                            <span class="menu-title">Icons</span>
                            <span class="badge badge-info">4</span>
                        </a>
                        <div class="collapse" id="icons">
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item"> <a class="nav-link" href="..\icons\flag-icons.html">Flag icons</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\icons\font-awesome.html">Font Awesome</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\icons\simple-line-icon.html">Simple line icons</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\icons\themify.html">Themify icons</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#maps" aria-expanded="false" aria-controls="maps">
                            <i class="icon-location-pin menu-icon"></i>
                            <span class="menu-title">Maps</span>
                            <span class="badge badge-success">2</span>
                        </a>
                        <div class="collapse" id="maps">
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item"> <a class="nav-link" href="..\maps\mapeal.html">Mapeal</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\maps\vector-map.html">Vector Map</a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\maps\google-maps.html">Google Map</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
                            <i class="icon-bubbles menu-icon"></i>
                            <span class="menu-title">User Pages</span>
                            <span class="badge badge-danger">5</span>
                        </a>
                        <div class="collapse" id="auth">
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item"> <a class="nav-link" href="..\samples\login.html"> Login </a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\samples\login-2.html"> Login 2 </a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\samples\register.html"> Register </a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\samples\register-2.html"> Register 2 </a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\samples\lock-screen.html"> Lockscreen </a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#error" aria-expanded="false" aria-controls="error">
                            <i class="icon-support menu-icon"></i>
                            <span class="menu-title">Error pages</span>
                            <span class="badge badge-primary">2</span>
                        </a>
                        <div class="collapse" id="error">
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item"> <a class="nav-link" href="..\samples\error-404.html"> 404 </a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\samples\error-500.html"> 500 </a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#general-pages" aria-expanded="false" aria-controls="general-pages">
                            <i class="icon-user menu-icon"></i>
                            <span class="menu-title">General Pages</span>
                            <span class="badge badge-warning">6</span>
                        </a>
                        <div class="collapse" id="general-pages">
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item"> <a class="nav-link" href="..\samples\blank-page.html"> Blank Page </a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\samples\landing-page.html"> Landing Page </a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\samples\profile.html"> Profile </a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\samples\faq.html"> FAQ </a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\samples\faq-2.html"> FAQ 2 </a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\samples\news-grid.html"> News grid </a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\samples\timeline.html"> Timeline </a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\samples\search-results.html"> Search Results </a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\samples\portfolio.html"> Portfolio </a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="collapse" href="#e-commerce" aria-expanded="false" aria-controls="e-commerce">
                            <i class="icon-briefcase menu-icon"></i>
                            <span class="menu-title">E-commerce</span>
                            <span class="badge badge-info">3</span>
                        </a>
                        <div class="collapse" id="e-commerce">
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item"> <a class="nav-link" href="..\samples\invoice.html"> Invoice </a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\samples\pricing-table.html"> Pricing Table </a></li>
                                <li class="nav-item"> <a class="nav-link" href="..\samples\orders.html"> Orders </a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="..\apps\email.html">
                            <i class="icon-cursor menu-icon"></i>
                            <span class="menu-title">E-mail</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="..\apps\calendar.html">
                            <i class="icon-calendar menu-icon"></i>
                            <span class="menu-title">Calendar</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="..\apps\todo.html">
                            <i class="icon-clock menu-icon"></i>
                            <span class="menu-title">Todo List</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="..\apps\gallery.html">
                            <i class="icon-picture menu-icon"></i>
                            <span class="menu-title">Gallery</span>
                        </a>
                    </li>
                    <li class="nav-item nav-doc">
                        <a class="nav-link bg-primary" href="..\documentation.html">
                            <i class="icon-magnet menu-icon"></i>
                            <span class="menu-title">Documentation</span>
                        </a>
                    </li>
                    <li class="mt-4 nav-item nav-progress">
                        <h6 class="nav-progress-heading mt-4 font-weight-normal">
                            Today's Sales
                            <span class="nav-progress-sub-heading">
                  50 sold
                </span>
                        </h6>
                        <div class="progress progress-sm">
                            <div class="progress-bar bg-info" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <h6 class="nav-progress-heading mt-4 font-weight-normal">
                            Customer target
                            <span class="nav-progress-sub-heading">
                  500
                </span>
                        </h6>
                        <div class="progress progress-sm">
                            <div class="progress-bar bg-danger" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </li>
                </ul>
            </nav>
            <!-- partial -->
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-md-6 offset-3 d-flex align-items-stretch grid-margin">
                        <div class="row flex-grow">
                            <div class="col-12 grid-margin">
                                <div class="card">
                                    <div class="card-body">
                                        <h1>Create</h1>
                                        <p class="card-description">
                                            Basic form layout
                                        </p>
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

                                    </div>
                                </div>
                            </div>
                            <div class="col-12 stretch-card">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- partial:../../partials/_footer.html -->
                <jsp:include page="/WEB-INF/dashboard/layout/footer.jsp"></jsp:include>
                <!-- partial -->
            </div>
            <!-- content-wrapper ends -->
        </div>
        <!-- row-offcanvas ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
<jsp:include page="/WEB-INF/dashboard/layout/js_footer.jsp"></jsp:include>
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
