<%-- 
    Document   : updateaccount
    Created on : Jul 19, 2022, 6:17:27 AM
    Author     : NamND
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update account</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet"
              href="fonts\FontAwesome.Pro.6.0.0.alpha3\fontawesome6\pro\css\all.min.css">
        <link rel="stylesheet" href="css/swiper-bundle.min.css">
        <link rel="stylesheet" href="css/styleadmin.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
</head>
<body>
    <div class="position-relative bg-white d-flex p-0">
        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-light navbar-light">
                <div class="navbar-nav w-100">
                    <a href="dashboardadmin" class="nav-item nav-link"><i class="fa-solid fa-gauge-high"></i>Dashboard</a>
                    <a href="categoriesmanage" class="nav-item nav-link"><i class="fa-solid fa-sitemap"></i>Categories</a>
                    <a href="brandsmanage" class="nav-item nav-link"><i class="fa-solid fa-copyright"></i>Brands</a>
                    <a href="productsmanage" class="nav-item nav-link"><i class="fa-brands fa-product-hunt"></i>Products</a>
                    <a href="accountsmanage" class="nav-item nav-link active"><i class="fa-solid fa-address-card"></i>Accounts</a>
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->


        <!-- Content Start -->
        <div class="content profile-area">
            <c:set value="${account}" var="a"/>
            <div class="row container-fluid pt-4 px-4">
                <div class="col-md-4 mb-3">
                    <div class="card">
                        <div class="card-body">
                            <form action="editavataradmin" method="post" enctype="multipart/form-data">
                                <div class="d-flex flex-column align-items-center text-center">
                                    <input type="hidden" name="aid" value="${a.id}"/>
                                    <img src="images/avatar/${a.avatar}"
                                         class="rounded-circle" width="150">
                                    <input type="file" name="photo" id="avatar" onchange="this.form.submit()">
                                    <label for="avatar">
                                        <i class="fa-regular fa-brush"></i>
                                    </label>
                                    <h4>${a.fullname}</h4>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="card mb-3">
                        <div class="card-body">
                            <form action="updateaccount" method="post">
                                <input type="hidden" name="aid" value="${a.id}"/>
                                <div class="row">
                                    <div class="col-sm-3 d-flex align-items-center text-center">
                                        <h6>Full Name</h6>
                                    </div>
                                    <div class="col-sm-7">
                                        <input type="text" value="${a.fullname}" name="fullname">
                                    </div>
                                </div>
                                <hr>

                                <div class="row">
                                    <div class="col-sm-3 d-flex align-items-center text-center">
                                        <h6>Username</h6>
                                    </div>
                                    <div class="col-sm-7">
                                        <input type="text" name="username" value="${a.username}" required />
                                    </div>
                                </div>
                                <hr>

                                <div class="row">
                                    <div class="col-sm-3 d-flex align-items-center text-center">
                                        <h6>Password</h6>
                                    </div>
                                    <div class="col-sm-7">
                                        <input type="password" name="password" value="${a.password}" required />
                                    </div>
                                </div>
                                <hr>

                                <div class="row">
                                    <div class="col-sm-3 d-flex align-items-center text-center">
                                        <h6>Email address</h6>
                                    </div>
                                    <div class="col-sm-7">
                                        <input name="email" type="email" value="${a.email}" required />
                                    </div>
                                </div>
                                <hr>

                                <div class="row">
                                    <div class="col-sm-3 d-flex align-items-center text-center">
                                        <h6>Phone number</h6>
                                    </div>
                                    <div class="col-sm-7">
                                        <input name="phone" type="text" value="${a.phone}" pattern="[0-9]{10}" required />
                                    </div>
                                </div> 
                                <hr>

                                <div class="row">
                                    <div class="col-sm-3 d-flex align-items-center text-center">
                                        <h6>Date of birth</h6>
                                    </div>
                                    <div class="col-sm-4">
                                        <input name="dob" type="date" value="${a.dob}" required=""/>
                                    </div>
                                </div>
                                <hr>

                                <div class="row">
                                    <div class="col-sm-3 d-flex align-items-center text-center">
                                        <h6>Balance</h6>
                                    </div>
                                    <div class="col-sm-3">
                                        <input type="text" value="${a.getAmountVND()}">
                                    </div>
                                    <div class="col-sm-3 d-flex align-items-center text-center">
                                        <h6>Deposit/Withdraw</h6>
                                    </div>
                                    <div class="col-sm-3">
                                        <input type="number" step="10000" name="deposit">
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-12 mt-2 mb-2">
                                        <button type="submit" class="btn-2 btn">Save</button>
                                    </div>
                                </div>
                                <c:if test="${alert != null}">
                                    <div class="alert alert-danger alert-dismissible fade show"
                                         role="alert">
                                        <strong>${alert}</strong>
                                        <button type="button" class="btn-close" data-bs-dismiss="alert"
                                                aria-label="Close"></button>
                                    </div>
                                </c:if>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- script -->
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery-3.6.0.min.js"></script>
        <script src="js/swiper-bundle.min.js"></script>
        <script src="js/main.js"></script>
</body>
</html>
