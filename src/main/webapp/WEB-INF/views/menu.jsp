    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java"%>
     <div class="be-left-sidebar">
        <div class="left-sidebar-wrapper"><a href="index.html#" class="left-sidebar-toggle">Dashboard</a>
          <div class="left-sidebar-spacer">
            <div class="left-sidebar-scroll">
              <div class="left-sidebar-content">
                <ul class="sidebar-elements">
                  <li class="divider">Menu</li>
                  <li class="active"><a href="/Assignment/"><i class="icon mdi mdi-home"></i><span>Dashboard</span></a>
                  </li>
                  <li class="parent"><a href="<%=request.getContextPath() %>/staff"><i class="icon mdi mdi-face"></i><span>Nhân Viên</span></a>
                    <ul class="sub-menu">
                      <li><a href="<%=request.getContextPath() %>/staff">Quản Lí Nhân Viên</a>
                      </li>
                  
                         <c:set value="[]" var="CHECK"></c:set>
                   
                     <c:if test="${CHECK==checkrecord }">
                      <li><a href="/Assignment/record">Chấm Điểm Nhân Viên</a></li></c:if>
                      
               
                    </ul>
                  </li>
                  <li class="parent"><a href="<%=request.getContextPath() %>/depart"><i class="icon mdi mdi-chart-donut"></i><span>Phòng Ban</span></a>
                    <ul class="sub-menu">
                      <li><a href="<%=request.getContextPath() %>/depart">Quản Lí Phòng Ban</a>
                      </li>
                   
                    </ul>
                  </li>
                  <li class="parent"><a href="#"><i class="icon mdi mdi-dot-circle"></i><span>Bảng Điểm </span></a>
                    <ul class="sub-menu">
                      <li><a href="#">Bảng Xếp Hạng </a>
                      </li>
                      <li><a href="#">Bảng kỉ luật</a>
                      </li>
                      <li><a href="#">Bảng Khen Thưởng</a>
                      </li>
                      
                    </ul>
                  </li>
                   
                  <c:set var="admin" value="admin"></c:set>
                  <c:if test="${staff.roles==admin }">
                  <c:if test="${check_date==false }">
                    <li ><a href="/Assignment/record/muster"><i class="mdi mdi-check-all icon text-danger"></i><span class="text-warning">Điểm Danh</span></a></li></c:if>
                 
                  
                  </c:if>
                 
                 
                    </ul>
                
              </div>
            </div>
          </div>
        
        </div>
      </div>