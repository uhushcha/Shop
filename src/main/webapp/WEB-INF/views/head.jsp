<%--
  Created by IntelliJ IDEA.
  User: gusch
  Date: 26.02.2018
  Time: 4:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../../resource/css/bootstrap.min.css" rel="stylesheet">
    <script defer src="../../resource/js/fontawesome-all.min.js"></script>
    <link href="../../resource/css/head.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="navbar navbar-inverse navbar-static-top">
    <div class="container-fluid">
        <div class="row menu">
            <div class="col-xs-3 ">
                <a class="text-left" href="#">Логотип</a>
            </div>
            <div class="col-xs-3 dropdown text-center">
                <sec:authorize access="hasRole('ROLE_ANONYMOUS')">
                    <a class="btn" href="/login">
                        <i class="menu-icon fas fa-sign-in-alt fa-lg "></i>Sing In
                    </a>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_USER')">
                    <a href="" class="dropdown-toggle" data-toggle="dropdown"><i
                            class="menu-icon fas fa-user fa-lg"></i>Name<b
                            class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="/account">Profile</a></li>
                        <li class="divider"></li>
                        <li><a href="/account/password">Update password</a></li>
                        <li><a href="/account/addresses">Update addresses</a></li>
                        <li><a href="/account/order">History orders</a></li>
                        <li class="divider"></li>
                        <li><a href="/j_spring_security_logout">Log out</a></li>
                    </ul>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                            class="menu-icon fas fa-user fa-lg"></i>Имя<b
                            class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="/account">Profile</a></li>
                        <li class="divider"></li>
                        <li><a href="/admin/order">Orders</a></li>
                        <li><a href="#">Statistics</a></li>
                        <li class="divider"></li>
                        <li><a href="/j_spring_security_logout">Log out</a></li>
                    </ul>
                </sec:authorize>
            </div>
            <sec:authorize access="hasRole('ROLE_USER') or hasRole('ROLE_ANONYMOUS')">
                <div class="col-xs-3 text-center">
                    <a href=""><i class="fab fa-amazon-pay fa-lg menu-icon fa-fw"></i>Order</a></div>
                <div class="col-xs-3 text-center">
                    <a data-toggle="modal" type="modal" data-target="#basketFoods"><i
                            class="fas fa-shopping-basket fa-lg menu-icon fa-fw"></i>Basket<span
                            class="badge" id="countItemInBag"></span></a>
                </div>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_ADMIN') or hasRole('ROLE_SUPER_ADMIN')">
                <div class="col-xs-3 text-center">
                    <a href=""><i class="fab fa-amazon-pay fa-lg menu-icon fa-fw"></i>Change product</a>
                </div>
                <div class="col-xs-3 text-center">
                    <a href=""><i class="fab fa-amazon-pay fa-lg menu-icon fa-fw"></i>Change category</a>
                </div>
            </sec:authorize>
        </div>
    </div>
</div>
<sec:authorize access="hasRole('ROLE_USER') or hasRole('ROLE_ANONYMOUS')">
    <div class="modal fade" id="basketFoods">

    </div>
    <c:import url="slider.jsp"/>
</sec:authorize>