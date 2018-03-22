<%--
  Created by IntelliJ IDEA.
  User: gusch
  Date: 01.03.2018
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="head.jsp"/>
<link rel="stylesheet" href="/resources/css/select.css">
<script src="/resources/js/order.js"></script>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-offset-3 col-sm-9">
            <div class="breadcrumb">
                <li><a href="/catalog">Home</a></li>
                <li><a href="/order">Order</a></li>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-3">
            <%--<c:import url="category.jsp"/>--%>
        </div>
        <div class="container col-sm-9">
            <div class="row">
                <div class="container-fluid">
                    <div class="row ">
                        <c:forEach var="item" items="${bag}">
                            <div class="col-xs-12">
                                <div class="img-thumbnail">
                                    <div class="col-xs-5 ">
                                        <img src="/resources/${item.image}" alt=""
                                             class="img-responsive img-circle img-thumbnail">
                                    </div>
                                    <div class="col-xs-7 order">
                                        <div class="col-xs-12"><h3 class="text-center"><a
                                                href="/catalog/${item.idProduct}">${item.nameProduct}</a></h3>
                                        </div>
                                        <div class="col-xs-12">
                                            <h4>Unit price:&nbsp;&nbsp;</h4>
                                            <h4>${item.price}</h4>
                                        </div>
                                        <div class="col-xs-12">
                                            <h4>Amount:&nbsp;&nbsp;</h4>
                                            <h4>${item.amount}</h4>
                                        </div>
                                        <div class="col-xs-12">
                                            <h4>Total price:&nbsp;&nbsp;</h4>
                                            <h4>${item.amount*item.price}</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="container-fluid">
                    <div class="row ">
                        <div class="col-xs-12">
                            <div class="container img-thumbnail order" >
                                <div class="col-sm-6 ">
                                    <h4>Order price:&nbsp;&nbsp;</h4>
                                    <h4>${totalPriceForPay}</h4>
                                </div>
                                <div class="col-sm-6">
                                    <select id="selectForAddress" class="sort">
                                        <c:forEach var="item" items="${user.addresses}">
                                            <option value="${item.id}">${item.city}&nbsp;${item.street}&nbsp;${item.house}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-sm-6">
                                    <a class="btn btn-success pay">Pay</a>
                                </div>
                                <div class="col-sm-6 param">
                                    <a class="btn btn-success CARD" data-toggle="modal" type="modal" data-target="#CARD"></a>
                                </div>
                                <div class="col-sm-6">
                                    <select id="selectPaymentType" class="sort">
                                        <option value="CASH">Cash</option>
                                        <option value="CARD">Credit card</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="CARD">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-head">
                <button id="closeModal" class="close" type="button" data-dismiss="modal"><i class="fas fa-times"></i></button>
            </div>
            <div class="modal-body">

            </div>
        </div>
    </div>
</div>
<c:import url="footer.jsp"/>
