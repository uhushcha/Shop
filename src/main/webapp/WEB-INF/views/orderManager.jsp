<%--
  Created by IntelliJ IDEA.
  User: gusch
  Date: 05.03.2018
  Time: 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="head.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-sm-offset-3 col-sm-9">
            <div class="breadcrumb">
                <li><a href="/catalog">Home</a></li>
                <li><a href="/account">User Name</a></li>
                <li><a href="/account/order">Order history</a></li>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-3">
            <%--сортировка категорий--%>
        </div>
        <div class="container col-sm-9">
            <div class="row">
                <div class="col-xs-12">
                    <c:if test="${fn:length(orders) != 0}">
                    <c:import url="orderItem.jsp"/>
                    </c:if>
                    <c:if test="${fn:length(orders) eq 0}">
                        <div>
                            <h4 class="pull-left">Your orders history, go shopping</h4>
                            <a href="/catalog" class="pull-left btn btn-success">Go</a>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<c:import url="footer.jsp"/>
