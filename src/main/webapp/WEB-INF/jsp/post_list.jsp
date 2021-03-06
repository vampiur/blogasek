<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<jsp:include page="header.jsp">
    <jsp:param value="All posts" name="page_title"/>
</jsp:include>
<body>
<header>
    <div class="blog-masthead">
        <div class="container">
            <nav class="nav">
                <a class="nav-link" href="/<%=request.getContextPath()%>">Home</a> <a
                    class="nav-link active" href="/list">Categories</a> <a
                    class="nav-link" href="<%=request.getContextPath()%>/post/add">Add
                post</a>
            </nav>
        </div>
    </div>
</header>
<main role="main" class="container">
    <div class="row">
        <div class="col-sm-8 blog-main">
            <c:choose>
                <c:when test="${empty posts }">
                    <h2>No posts</h2>
                </c:when>
                <c:otherwise>
                    <c:forEach var="post" items="${posts}">
                        <a href="show/${post.id}">${post.title}</a>
                        <jsp:include page="post_partial.jsp">
                            <jsp:param name="title" value="${post.title}"/>
                            <jsp:param name="text" value="${post.text}"/>
                            <jsp:param name="id" value="${post.id}"/>
                        </jsp:include>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</main>

<%@include file="footer.jsp" %>
</body>
</html>