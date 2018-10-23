<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
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
       
        <div class="main-content container-fluid">
          
          <div class="row">
            <div class="col-md-12">
              <div class="panel panel-default panel-border-color panel-border-color-primary">
                <div class="panel-heading panel-heading-divider">Validation Types<span class="panel-subtitle">Parsley different validation types</span></div>
                <div class="panel-body">
                  <form action="/Assignment/staff/insertStaff" class="form-horizontal group-border-dashed" id="table-staff">
                    <div class="form-group">
                      <label class="col-sm-3 control-label">Họ tên:</label>
                      <div class="col-sm-6">
                        <input type="text" required="" placeholder="Type something" class="form-control" name="name">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-3 control-label">Số điện thoại :</label>
                      <div class="col-sm-6">
                        <input id="phone_id" name="phone" type="text" required="" data-parsley-minlength="6" placeholder="Min 10 chars." class="form-control" >
                        <p id="kiemtra_phone"></p>
                      </div>
                    </div>
                     <div class="form-group">
                      <label class="col-sm-3 control-label">E-Mail</label>
                      <div class="col-sm-6">
                        <input name="email" type="email" required="" parsley-type="email" placeholder="Enter a valid e-mail" class="form-control" id="email_id">
                        <p id="kiemtra_email"></p>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-3 control-label">Password:</label>
                      <div class="col-sm-6">
                        <input required="" type="password"  class="form-control" name="password">
                      </div>
                    </div>
                      <div class="form-group">
                      <label class="col-sm-3 control-label">Ngày Sinh</label>
                      <div class="col-sm-6">
                      
                        <input required="" type="date" data-mask="date" placeholder="DD/MM/YYYY" class="form-control" name="birthday" required pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}">
                      </div>
                    </div>
                  
                  
                    <div class="form-group">
                      <label class="col-sm-3 control-label">Giới Tính</label>
                      <div class="col-sm-6">
                         <div class="form-check">
					  <input required="" class="form-check-input" type="radio" name="gender" id="exampleRadios1" value="Nam"  checked>
					  <label class="form-check-label" for="exampleRadios1">
					    Nam
					  </label>
					</div>
                          <div class="form-check">
					  <input class="form-check-input" type="radio" name="gender" id="exampleRadios1" value="Nữ">
					  <label class="form-check-label" for="exampleRadios1">
					    Nữ
					  </label>
					</div>
                        
                        <div id="error-container2"></div>
                      </div>
                    </div>
                     <div class="form-group">
                     <label class="col-sm-3 control-label">Phòng Ban</label>
                     <div class="col-sm-6">
                      <select name="departid" class="form-control">
                        
                      <c:forEach var="DEPART" items="${LIST_DEPART}">
                                  
                                    <option value="${DEPART.id}">${DEPART.name}</option>
                                    </c:forEach>
                                </select></div>                    
                                </div>
                 <div class="form-group">
                      <label  required="" class="col-sm-3 control-label">Mức Lương:</label>
                      <div class="col-sm-6">
                        <input type="number"  class="form-control" name="salary" >
                      </div>
                    </div>
                   <div class="form-group">
				    <label class="col-sm-3 control-label" for="exampleInputFile">Hình Ảnh</label>
				    <div class="col-sm-6">
				    <input type="file" name="photo" class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp">
				   </div>
    
  					</div>
                    
                    <div class="form-group">
                      <label class="col-sm-3 control-label">Ghi Chú:</label>
                      <div class="col-sm-6">
                        <textarea name="notes" class="form-control"></textarea>
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-sm-2 col-sm-10">
                        <button type="submit" class="btn btn-space btn-primary" id="btninsertstaff">Thêm Nhân viên</button>
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