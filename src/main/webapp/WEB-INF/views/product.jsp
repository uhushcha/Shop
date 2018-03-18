<%--
  Created by IntelliJ IDEA.
  User: gusch
  Date: 26.02.2018
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:import url="head.jsp"/>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-offset-3 col-sm-9">
            <div class="breadcrumb">
                <li><a href="">Home</a></li>
                <li><a href="">${product.category.nameCategory}</a></li>
                <li><a href="">${product.nameProduct}</a></li>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-3">
            <%--<c:import url="category.jsp"/>--%>
        </div>
        <div class="col-sm-9">
            <div class="row">
                <div class="col-xs-12 text-center">
                    <h4 class="nameProduct">${product.nameProduct}</h4>
                </div>
                <div class="col-sm-6">
                    <img src="/resources/${product.image}" alt="" class="img-responsive">
                </div>
                <div class="col-sm-6 row">
                    <div class="col-xs-12">Brand : ${product.brand}</div>
                    <div class="col-xs-12">Property : ${product.weightAmount}</div>
                    <div class="col-xs-12">Price: <h4 id="priceProduct">${product.price}</h4></div>
                    <div class="col-xs-12">Ingredients : ${product.description}</div>
                    <div class="col-xs-12">
                        <button class="btn btn-success" data-toggle="modal" type="modal" data-target="#addToCart" onclick="countItems(${product.id})">
                            Add to basket
                    </button>
                    </div>
                    <%--<a href="#" class="btn"--%>
                       <%--onclick="Share.vkontakte('URL','${product.nameProduct}','../../resource/${product.image}','${product.description}')"><i--%>
                            <%--class="fab fa-vk fa-3x"></i></a>--%>
                    <%--<a href="#" class="btn"--%>
                       <%--onclick="Share.facebook('URL','${product.nameProduct}','../../resource/${product.image}','${product.description}')"><i--%>
                            <%--class="fab fa-facebook fa-3x"></i></a>--%>
                    <%--<a href="#" class="btn"--%>
                       <%--onclick="Share.mailru('URL','${product.nameProduct}','../../resource/${product.image}','${product.description}')"><i--%>
                            <%--class="fas fa-at fa-3x"></i></a>--%>
                    <%--<a href="#" class="btn" onclick="Share.odnoklassniki('URL','${product.description}')"><i--%>
                            <%--class="fab fa-odnoklassniki-square fa-3x"></i></a>--%>
                    <%--<a href="#" class="btn" onclick="Share.twitter('URL','${product.nameProduct}')"><i--%>
                            <%--class="fab fa-twitter-square fa-3x"></i></a>--%>
                </div>
            </div>
        </div>
    </div>
</div>
<sec:authorize access="hasRole('ROLE_USER') or hasRole('ROLE_ANONYMOUS')">
<div class="modal fade" id="addToCart">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <button class="close" type="button" data-dismiss="modal"><i class="fas fa-times"></i></button>
                <div class="item-amount row">
                    <div class="col-xs-5 col-sm-12 pay">

                        <h4 class="btn-cart">Choose amount:</h4></div>
                    <div class="col-sm-4 col-xs-5 amount-button  pay">
                        <%--<button type="button" class="button-less" onclick="clickLess()"><i class="fa fa-minus"></i>--%>
                        <%--</button>--%>
                        <%--<input type="number" id="amount-number" name="amount" class="amount-number" value="0" disabled>--%>
                        <%--<button type="button" class="button-more" onclick="clickMore()"><i class="fa fa-plus"></i>--%>
                        <%--</button>--%>
                    </div>
                    <div class="col-sm-4 col-xs-5  pay">Цена :
                        <h4 class="btn-cart" id="totalPrice">0</h4></div>
                    <%--<div class="col-sm-4  col-xs-5 pay text-center">--%>
                        <%--<a id="addToBag" class="btn btn-success btn-cart" type="button"--%>
                           <%--onclick="addToBag('${product.id}','${product.price}','${product.nameProduct}','${product.image}')">add to--%>
                            <%--bag</a>--%>
                    <%--</div>--%>
                </div>
            </div>
        </div>
    </div>
</div>
</sec:authorize>
<c:import url="footer.jsp"/>