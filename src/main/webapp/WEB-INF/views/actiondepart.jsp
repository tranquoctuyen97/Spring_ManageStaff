<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html >
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <head>
  <!-- mi phải cho jsp utf8 nó mới hiểu ti,êếng việt,thì cho trình duyệt nhớ code  sang lisst phòng ban dổi luôn ba ơi! cái hiện ra à.ukm
  -->
    <jsp:include page="header.jsp"></jsp:include>
  </head>
  <body>
    <div class="be-wrapper">
   <jsp:include page="navbar-top.jsp"></jsp:include>
 <jsp:include page="menu.jsp"></jsp:include>
 <c:set var="AC" value="update"></c:set>
      <div class="be-content">
       
        <div class="main-content container-fluid">
          
          <div class="row">
            <div class="col-md-12">
              <div class="panel panel-default panel-border-color panel-border-color-primary">
                <div class="panel-heading panel-heading-divider">Validation Types<span class="panel-subtitle">Parsley different validation types</span></div>
                <div class="panel-body">
                  <form action="/Assignment/depart/${action }" class="form-horizontal group-border-dashed" id="table-staff" method="post">
                    <div class="form-group">
                      <label class="col-sm-3 control-label">Tên Ngành:</label>
                      <div class="col-sm-6">
                        <input type="text" required="" placeholder="Type something" class="form-control" name="name" value="${DEPART.name }">
                        <input type="hidden" name="id" value="${DEPART.id }"> 
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-sm-2 col-sm-10">
                      <c:choose>
                      <c:when test="${AC==action }">
                       <button type="submit" class="btn btn-space btn-primary" id="btninsertstaff">Lưu</button></c:when>
                       <c:otherwise>
                       <button type="submit" class="btn btn-space btn-primary" id="btninsertstaff">Thêm Ngành</button></c:otherwise> </c:choose>
                        
                        <button class="btn btn-space btn-default">Hủy</button>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
<jsp:include page="navbar.jsp"></jsp:include>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
  </body>
</html>