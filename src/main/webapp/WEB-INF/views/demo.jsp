<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<h2 class="page-head-title">Chấm Điểm</h2>
				
			</div>
			<div class="main-content container-fluid">
				<div class="row">
					<div class="col-sm-12">
						<div class="panel panel-default panel-table">
							<div class="panel-heading">
							<c:set var="admin" value="admin"></c:set>
							<c:if test="${staff.roles==admin }">
							<a class="modal-title" id="lineModalLabel"> Phòng Ban : ${staff.getDepart().getName()} </a></c:if>
								
								<div class="tools dropdown">
									<span class="icon mdi mdi-download"></span><a
										href="tables-datatables.html#" type="button"
										data-toggle="dropdown" class="dropdown-toggle"><span
										class="icon mdi mdi-more-vert"></span></a>
									<ul role="menu" class="dropdown-menu pull-right">
										<li><a href="tables-datatables.html#">Action</a></li>
										<li><a href="tables-datatables.html#">Another action</a></li>
										<li><a href="tables-datatables.html#">Something else
												here</a></li>
										<li class="divider"></li>
										<li><a href="tables-datatables.html#">Separated link</a></li>
									</ul>
								</div>
							</div>
							<div class="panel-body">
								<table id="table1"
									class="table table-striped table-hover table-fw-widget">
									<thead>
										<tr>
											<th>Họ Tên</th>
											
											
											<th>Email</th>
											<th>Số điện thoại</th>
											
											<th>Phòng Ban</th>
											<th class="actions">Tùy Chọn</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="NHANVIEN" items="${LIST_STAFF }">
											<tr class="odd gradeX">
												<td class="user-avatar">
												<c:set var="NULL" value=""></c:set>
												<c:choose>
													<c:when test="${NHANVIEN.getPhoto()==NULL}">
													<img src="<%=request.getContextPath()%>/resources/img/staff/images.png" alt="Avatar">
													</c:when>
													<c:otherwise>
													<img src="<%=request.getContextPath()%>/resources/img/staff/${NHANVIEN.getPhoto()}" alt="Avatar">
													</c:otherwise>
													</c:choose>
												${NHANVIEN.getName() }</td>
											
												
													
													
												
												<td class="center">${NHANVIEN.getEmail()}</td>
												<td class="center">${NHANVIEN.getPhone()}</td>
												
												
												<td class="center">${NHANVIEN.getDepart().getName()}</td>
												<c:set var = "admin" value="admin"> </c:set>
												
												<td class="actions">
												
													<div class="center"><button data-toggle="modal" data-target="#squarespaceModal" class="btn btn-success center-block btn_chamdiem" data-id="${NHANVIEN.getId()}">Chấm Điểm</button></div> 
												
												</td>
												
											</tr>
										
</c:forEach>
									</tbody>
								</table>

					
							</div>
						
						</div>
					</div>
				</div>


			</div>
				
		 <div class="modal fade alert" id="squarespaceModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">x</span><span class="sr-only">Close</span></button>
            <h3 class="modal-title" id="lineModalLabel">Chấm Điểm Nhân Viên</h3>
        </div>
        <div class="controller">
        <div class="modal-body">
        
            <div id="form_chamdiem">
                        
             <ul class="list-group">
             
                <div class="row">
  <div class="col-md-3 col"><img class="img-responsive" alt="Cinque Terre" id="staff_img" src="<%=request.getContextPath()%>/resources/img/staff/images.png"> </div>
  <p class="col-md-9 hihinana">.col-xs-5 .col-sm-6 .col-lg-4</p>
</div>
                    <c:forEach var="REASON" items="${LIST_REASON}">
                    <c:if test="${REASON.id!=1 }">
                      <li class="list-group-item text-primary" >
                        ${REASON.name}
                        <div class="material-switch pull-right">
                            <input id="${REASON.id}"  type="checkbox"  value="${REASON.id}" />
                            <label for="${REASON.id}" class="label-danger"></label>
                        </div>
                    </li>
                    
                    </c:if>
                    </c:forEach>
                 
                   
                </ul>             
              <button  class="btn btn-primary center-block btn_chamdiem_staff">Chấm Điểm </button>
            
            </div>
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