<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<h2 class="page-head-title">Phòng Ban</h2>
				
			</div>
			<div class="main-content container-fluid">
				<div class="row">
					<div class="col-sm-12">
						<div class="panel panel-default panel-table">
							<div class="panel-heading">
								<a class="btn btn-primary" href="/Assignment/depart/insertdepart">Thêm Phòng Ban</a>
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
							<c:set var="admin" value="admin"></c:set>
							<div class="panel-body">
								<table id="table1"
									class="table table-striped table-hover table-fw-widget">
									<thead>
										<tr>
											<th>Tên Phòng Ban</th>
											
											<th class="actions">Tùy Chọn</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="DEPART" items="${LIST_DEPART }">
											<tr class="odd gradeX">
												<td class="user-avatar">
												<c:set var="NULL" value=""></c:set>
												
												${DEPART.getName() }</td>
											
												<td class="actions">
												<c:choose>
												<c:when test="${staff.roles==admin }">
												<a class="mdi mdi-edit"href='<%=request.getContextPath()  %>/depart/editdepart/${DEPART.getId()}' class="icon"></a>
												&emsp;| &emsp;
													<button class="btn btn-danger mdi mdi-delete btnxoadepart" data-id="${DEPART.getId() }" data-name="${DEPART.getName()}"></button> 
												</c:when> 
												<c:otherwise>
												<a class="btn-lg mdi mdi-eye viewstaff" data-toggle="modal" data-target="#myModal" data-id="${DEPART.getId() }"></a>
												</c:otherwise> </c:choose>
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
				
				
				<div class="container">

  

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog changestaff">
    
     
      
    </div>
  </div>
  
</div>

							
		</div>
		<jsp:include page="navbar.jsp"></jsp:include>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>