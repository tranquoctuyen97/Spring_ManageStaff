<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html >
  <head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <jsp:include page="header.jsp"></jsp:include>
  </head>
  <body>
    <div class="be-wrapper">
   <jsp:include page="navbar-top.jsp"></jsp:include>
 <jsp:include page="menu.jsp"></jsp:include>
      <div class="be-content">
        <div class="page-head">
          <h2 class="page-head-title">Form Validation</h2>
          <ol class="breadcrumb page-head-nav">
            <li><a href="form-validation.html#">Home</a></li>
            <li><a href="form-validation.html#">Forms</a></li>
            <li class="active">Validation</li>
          </ol>
        </div>
        <div class="main-content container-fluid">
          
          <div class="row">
            <div class="col-md-12">
              <div class="panel panel-default panel-border-color panel-border-color-primary">
                <div class="panel-heading panel-heading-divider">Validation Types<span class="panel-subtitle">Parsley different validation types</span></div>
                <div class="panel-body">
                  <form action="form-validation.html#" class="form-horizontal group-border-dashed">
                    <div class="form-group">
                      <label class="col-sm-3 control-label">Họ Tên :</label>
                      <div class="col-sm-6">
                        <input type="text" required="" placeholder="Type something" class="form-control"value="${STAFF.name }" name="name">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-3 control-label">Số điện thoại :</label>
                      <div class="col-sm-6">
                        <input name="phone" type="text" required="" data-parsley-minlength="6" placeholder="Min 10 chars." class="form-control" value="${STAFF.phone }">
                      </div>
                    </div>
                     <div class="form-group">
                      <label class="col-sm-3 control-label">E-Mail</label>
                      <div class="col-sm-6">
                        <input name="email" type="email" required="" parsley-type="email" placeholder="Enter a valid e-mail" class="form-control" value="${STAFF.email }">
                      </div>
                    </div>
                      <div class="form-group">
                      <label class="col-sm-3 control-label">Ngày Sinh</label>
                      <div class="col-sm-6">
                       <input required="" type="date" data-mask="date" placeholder="DD/MM/YYYY" class="form-control" name="birthday" required pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}" value="${STAFF.birthday }">
                        
                      </div>
                    </div>
                    
                 
                    <div class="form-group">
                      <label class="col-sm-3 control-label">Giới Tính</label>
                   
					
                      <div class="col-sm-6">
                        <c:choose>
                  <c:when test="${STAFF.gender==1}">
                  <c:set var="GENDER" value="Nam"></c:set>
                  <div class="be form-check">
					  <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="Nữ">
					  <label class="form-check-label" for="exampleRadios1">
					    Nữ
					  </label>
					</div>
                  
                  </c:when>
                  <c:otherwise>
                  <c:set var="GENDER" value="Nữ"></c:set>
                  <div class="be form-check">
					  <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="Nam">
					  <label class="form-check-label" for="exampleRadios1">
					    Nam
					  </label>
					</div>
                  </c:otherwise> </c:choose>
                         <div class="be form-check">
					  <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1"  value="${GENDER}" checked="checked">
					  <label class="form-check-label" for="exampleRadios1">
					    ${GENDER}
					  </label>
					</div>
                          
                        
                        <div id="error-container2"></div>
                      </div>
                    </div>
                     <div class="form-group">
                     <label class="col-sm-3 control-label">Phòng Ban</label>
                     <div class="col-sm-6">
                   
                      <select name="departid" class="form-control">
                        
                      <c:forEach var="DEPARTT" items="${LIST_DEPART}">
                                    <c:if test="${DEPARTT.id==STAFF.getDepart().getId()}">
                                    <option selected value="${DEPARTT.id}">${DEPARTT.name}</option></c:if>
                                    <option value="${DEPARTT.id}">${DEPARTT.name}</option>
                                    </c:forEach>
                                </select></div>                    
                                </div>
                                
                <fmt:formatNumber  pattern="0" value="${STAFF.salary}" var="SALARY"/>
                 <div class="form-group">
                      <label class="col-sm-3 control-label">Mức lương:</label>
                      <div class="col-sm-6">
                     
                   
                        <input type="number" min="2000000"  class="form-control" value="${SALARY}">
                      </div>
                    </div>
                   <div class="form-group">
				    <label class="col-sm-3 control-label" for="exampleInputFile">Hình ảnh</label>
				    <div class="col-sm-6">
				    <input type="file" class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp">
				    <small id="fileHelp" class="form-text text-muted">This is some placeholder block-level help text for the above input. It's a bit lighter and easily wraps to a new line.</small></div>
    
  					</div>
                    
                    <div class="form-group">
                      <label class="col-sm-3 control-label">Ghi Chú:</label>
                      <div class="col-sm-6">
                        <textarea required="" class="form-control"></textarea>
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-sm-2 col-sm-10">
                        <button type="submit" class="btn btn-space btn-primary">Submit</button>
                        <button class="btn btn-space btn-default">Cancel</button>
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