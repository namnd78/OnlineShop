<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${product.name}</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet"
              href="fonts\FontAwesome.Pro.6.0.0.alpha3\fontawesome6\pro\css\all.min.css">
        <link rel="stylesheet" href="css/swiper-bundle.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <div class="main-wrapper">
            <jsp:include page="../common/header.jsp"/>
            <!-- Product Details Area Start -->
            <div class="product-details-area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="${product.images.size() > 1 ? "swiper slider-top" : ""} image-top">
                                <div class="swiper-wrapper">
                                    <c:forEach items="${product.images}" var="pimage">
                                        <div class="swiper-slide">
                                            <img class="m-auto" src="images/products/${pimage.image}">
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <c:if test="${product.images.size() > 1}">
                                <div class="swiper images-slider slider-nav-style-1 small-nav">
                                    <div class="swiper-wrapper">
                                        <c:forEach items="${product.images}" var="pimage">
                                            <div class="swiper-slide">
                                                <img class="m-auto" src="images/products/${pimage.image}">
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <!-- Add Arrows -->
                                    <div class="swiper-buttons">
                                        <div class="swiper-button-prev"><i class="fa-light fa-angle-left"></i></div>
                                        <div class="swiper-button-next"><i class="fa-light fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                        <div class="col-lg-6" data-aos="fade-up" data-aos-delay="200">
                            <div class="product-details-content">
                                <h2 class="name">${product.name}</h2>
                                <div class="price">
                                    <h2 class="new-price">${product.getNewPriceVND()}</h2>
                                    <c:if test="${product.discount > 0}">
                                        <p class="old-price">${product.getOldPriceVND()}</p>
                                    </c:if>
                                </div>
                                <div class="info">
                                    <span class="title">Category:</span>
                                    <span>${product.category.name}</span>
                                </div>
                                <div class="info">
                                    <span class="title">Brand:</span>
                                    <span>${product.brand.name}</span>
                                </div>
                                <div class="info">
                                    <span class="title">Release Date:</span>
                                    <span>${product.releaseDate}</span>
                                </div>
                                <div class="info">
                                    <span class="title">Status:</span>
                                    <span class="${product.state.id == 1 ? "in-stock" : "out-stock"}">${product.state.name}</span>
                                </div>
                                <form action="addtocart">
                                    <input type="hidden" name="pid" value="${product.id}"/>
                                    <input type="hidden" name="link" value="productdetail?pid=${product.id}"/>
                                    <div class="pro-details-quantity">
                                        <div class="cart-plus-minus">
                                            <div class="dec qtybutton">-</div>
                                            <input class="cart-plus-minus-box" type="text" name="quantity" value="1" />
                                            <div class="inc qtybutton">+</div>
                                        </div>
                                        <div class="pro-details-cart">
                                            <button class="add-cart" onclick="this.form.submit">
                                                <i class="fa-regular fa-cart-plus"></i>
                                                Add To Cart</button>
                                        </div>
                                    </div>
                                </form>
                                <div class="description-wrapper">
                                    <div class="description-topbar nav">
                                        <button data-bs-toggle="tab" data-bs-target="#description">Description</button>
                                        <button class="active" data-bs-toggle="tab"
                                                data-bs-target="#specification">Specification</button>
                                    </div>
                                    <div class="tab-content description-bottom">
                                        <div id="description" class="tab-pane">
                                            <div class="product-description">
                                                <p>
                                                    ${product.description}
                                                </p>
                                            </div>
                                        </div>
                                        <div id="specification" class="tab-pane active">
                                            <div class="product-specification">
                                                <p>
                                                    ${product.specification}
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Product Area Start -->
            <div class="product-area related-product">
                <div class="container">
                    <!-- Section Title & Tab Start -->
                    <div class="row">
                        <div class="col-12">
                            <div class="section-title text-center">
                                <h2 class="title">Related Products</h2>
                            </div>
                        </div>
                    </div>
                    <!-- Section Title & Tab End -->
                    <div class="row">
                        <div class="col">
                            <div class="related-product-slider swiper slider-nav-style-1">
                                <div class="swiper-wrapper">
                                    <c:forEach items="${requestScope.relatedProducts}" var="product">
                                        <div class="swiper-slide">
                                            <div class="product">
                                                <span class="badges">
                                                    <c:if test="${product.isNew()}">
                                                        <span class="new">New</span>
                                                    </c:if>
                                                    <c:if test="${product.isSale()}">
                                                        <span class="sale">-${product.discount}%</span>
                                                    </c:if>
                                                </span>
                                                <div class="thumb">
                                                    <a href="productdetail?pid=${product.id}" class="image">
                                                        <img src="images/products/${product.images.get(0).image}" />
                                                    </a>
                                                </div>
                                                <div class="content">
                                                    <span class="category">${product.category.name}</span>
                                                    <h5 class="title"><a href="productdetail?pid=${product.id}">${product.name}
                                                        </a>
                                                    </h5>
                                                    <span class="price">
                                                        <c:if test="${product.discount > 0}">
                                                            <span class="old">${product.getOldPriceVND()}</span>
                                                        </c:if>
                                                        <span class="new">${product.getNewPriceVND()}</span>
                                                    </span>
                                                </div>
                                                <div class="actions">
                                                    <button title="Add To Cart" class="btn action add-to-cart"
                                                            data-bs-toggle="modal" data-bs-target="#exampleModal-Cart"><i
                                                            class="fa-regular fa-cart-plus"></i><span>Add to
                                                            cart</span></button>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <!-- Add Arrows -->
                                <div class="swiper-buttons">
                                    <div class="swiper-button-prev"><i class="fa-light fa-angle-left"></i></div>
                                    <div class="swiper-button-next"><i class="fa-light fa-angle-right"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="../common/footer.jsp"/>
        </div>

        <!-- script -->
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery-3.6.0.min.js"></script>
        <script src="js/swiper-bundle.min.js"></script>
        <script src="js/main.js"></script>

    </body>

</html>
