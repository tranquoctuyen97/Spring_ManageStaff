<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html >
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <jsp:include page="header.jsp"/>
    

  <body>
    <div class="be-wrapper be-fixed-sidebar">
      <jsp:include page="navbar-top.jsp"></jsp:include>
 <jsp:include page="menu.jsp"></jsp:include>
        
          
      <div class="be-content">
        <div class="main-content container-fluid">
          <div class="row">
            <div class="col-xs-12 col-md-6 col-lg-6">
                        <div class="widget widget-tile">
                          <div id="spark1" class="chart sparkline"></div>
                          <div class="data-info">
                            <div class="desc">Tổng Nhân Viên</div>
                            <div class="value"><span data-toggle="counter" data-end="${sumstaff }" class="number">0</span>
                            </div>
                          </div>
                        </div>
            </div>
            <div class="col-xs-12 col-md-6 col-lg-6">
                        <div class="widget widget-tile">
                          <div id="spark2" class="chart sparkline"></div>
                          <div class="data-info">
                            <div class="desc">Monthly Sales</div>
                            <div class="value"><span class="indicator indicator-positive mdi mdi-chevron-up"></span><span data-toggle="counter" data-end="80" data-suffix="%" class="number">0</span>
                            </div>
                          </div>
                        </div>
            </div>
           
          </div>
      
          <div class="row">
            <div class="col-md-6">
              <div class="panel panel-default panel-table">
                <div class="panel-heading"> 
                  <div class="tools dropdown"> <span class="icon mdi mdi-download"></span><a href="index.html#" type="button" data-toggle="dropdown" class="dropdown-toggle"><span class="icon mdi mdi-more-vert"></span></a>
                    <ul role="menu" class="dropdown-menu pull-right">
                      <li><a href="index.html#">Action</a></li>
                      <li><a href="index.html#">Another action</a></li>
                      <li><a href="index.html#">Something else here</a></li>
                      <li class="divider"></li>
                      <li><a href="index.html#">Separated link</a></li>
                    </ul>
                  </div>
                  <div class="title">Purchases</div>
                </div>
                <div class="panel-body table-responsive">
                  <table class="table table-striped table-borderless">
                    <thead>
                      <tr>
                        <th style="width:40%;">Product</th>
                        <th class="number">Price</th>
                        <th style="width:20%;">Date</th>
                        <th style="width:20%;">State</th>
                        <th style="width:5%;" class="actions"></th>
                      </tr>
                    </thead>
                    <tbody class="no-border-x">
                   
                      <tr>
                        <td>Sony Xperia M4</td>
                        <td class="number">$149</td>
                        <td>Aug 23, 2016</td>
                        <td class="text-success">Completed</td>
                        <td class="actions"><a href="index.html#" class="icon"><i class="mdi mdi-plus-circle-o"></i></a></td>
                      </tr>
                      <tr>
                        <td>Apple iPhone 6</td>
                        <td class="number">$535</td>
                        <td>Aug 20, 2016</td>
                        <td class="text-success">Completed</td>
                        <td class="actions"><a href="index.html#" class="icon"><i class="mdi mdi-plus-circle-o"></i></a></td>
                      </tr>
                      <tr>
                        <td>Samsung Galaxy S7</td>
                        <td class="number">$583</td>
                        <td>Aug 18, 2016</td>
                        <td class="text-warning">Pending</td>
                        <td class="actions"><a href="index.html#" class="icon"><i class="mdi mdi-plus-circle-o"></i></a></td>
                      </tr>
                      <tr>
                        <td>HTC One M9</td>
                        <td class="number">$350</td>
                        <td>Aug 15, 2016</td>
                        <td class="text-warning">Pending</td>
                        <td class="actions"><a href="index.html#" class="icon"><i class="mdi mdi-plus-circle-o"></i></a></td>
                      </tr>
                      <tr>
                        <td>Sony Xperia Z5</td>
                        <td class="number">$495</td>
                        <td>Aug 13, 2016</td>
                        <td class="text-danger">Cancelled</td>
                        <td class="actions"><a href="index.html#" class="icon"><i class="mdi mdi-plus-circle-o"></i></a></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="panel panel-default panel-table">
                <div class="panel-heading">
                  <div class="tools dropdown"><span class="icon mdi mdi-download"></span><a href="index.html#" type="button" data-toggle="dropdown" class="dropdown-toggle"><span class="icon mdi mdi-more-vert"></span></a>
                    <ul role="menu" class="dropdown-menu pull-right">
                      <li><a href="index.html#">Action</a></li>
                      <li><a href="index.html#">Another action</a></li>
                      <li><a href="index.html#">Something else here</a></li>
                      <li class="divider"></li>
                      <li><a href="index.html#">Separated link</a></li>
                    </ul>
                  </div>
                  <div class="title">Latest Commits</div>
                </div>
                <div class="panel-body table-responsive">
                  <table class="table table-striped table-hover">
                    <thead>
                      <tr>
                        <th style="width:37%;">User</th>
                        <th style="width:36%;">Commit</th>
                        <th>Date</th>
                        <th class="actions"></th>
                      </tr>
                    </thead>
                    <tbody>
                   
                      <c:forEach items="${LIST_TOP10 }" var="RECORD">
                     <c:set var="NULL" value=""></c:set>
                     <tr>
                        <td class="user-avatar">
                        <c:choose>
                        <c:when test="${RECORD.getStaff().getPhoto()==NULL }">
                        <img src="<%=request.getContextPath()%>/resources/img/staff/images.png" alt="Avatar"></c:when>
                        <c:otherwise>
                        <img src="<%=request.getContextPath()%>/resources/img/staff/${RECORD.getStaff().getPhoto()}" alt="Avatar">
                        </c:otherwise>
                        </c:choose>
                        ${RECORD.getStaff().getName()}</td>
                        <td>${RECORD.getStaff().getEmail()}</td>
                        <td>${RECORD.getStaff().getDepart().getName()}</td>
                        <td class="actions"><a href="#" class="icon"><i class="mdi mdi-github-alt"></i></a></td>
                      </tr>
                    </c:forEach>
                      <tr>
                     
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-12 col-md-4">
              <div class="panel panel-default">
                <div class="panel-heading panel-heading-divider xs-pb-15">Current Progress</div>
                <div class="panel-body xs-pt-25">
                  <div class="row user-progress user-progress-small">
                    <div class="col-md-5"><span class="title">Bootstrap Admin</span></div>
                    <div class="col-md-7">
                      <div class="progress">
                        <div style="width: 40%" class="progress-bar progress-bar-success"></div>
                      </div>
                    </div>
                  </div>
                  <div class="row user-progress user-progress-small">
                    <div class="col-md-5"><span class="title">Custom Work</span></div>
                    <div class="col-md-7">
                      <div class="progress">
                        <div style="width: 65%" class="progress-bar progress-bar-success"></div>
                      </div>
                    </div>
                  </div>
                  <div class="row user-progress user-progress-small">
                    <div class="col-md-5"><span class="title">Clients Module</span></div>
                    <div class="col-md-7">
                      <div class="progress">
                        <div style="width: 30%" class="progress-bar progress-bar-success"></div>
                      </div>
                    </div>
                  </div>
                  <div class="row user-progress user-progress-small">
                    <div class="col-md-5"><span class="title">Email Templates</span></div>
                    <div class="col-md-7">
                      <div class="progress">
                        <div style="width: 80%" class="progress-bar progress-bar-success"></div>
                      </div>
                    </div>
                  </div>
                  <div class="row user-progress user-progress-small">
                    <div class="col-md-5"><span class="title">Plans Module</span></div>
                    <div class="col-md-7">
                      <div class="progress">
                        <div style="width: 45%" class="progress-bar progress-bar-success"></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xs-12 col-md-4">
              <div class="widget be-loading">
                <div class="widget-head">
                  <div class="tools"><span class="icon mdi mdi-chevron-down"></span><span class="icon mdi mdi-refresh-sync toggle-loading"></span><span class="icon mdi mdi-close"></span></div>
                  <div class="title">Top Sales</div>
                </div>
                <div class="widget-chart-container">
                  <div id="top-sales" style="height: 178px;"></div>
                  <div class="chart-pie-counter">36</div>
                </div>
                <div class="chart-legend">
                  <table>
                    <tr>
                      <td class="chart-legend-color"><span data-color="top-sales-color1"></span></td>
                      <td>Premium Purchases</td>
                      <td class="chart-legend-value">125</td>
                    </tr>
                    <tr>
                      <td class="chart-legend-color"><span data-color="top-sales-color2"></span></td>
                      <td>Standard Plans</td>
                      <td class="chart-legend-value">1569</td>
                    </tr>
                    <tr>
                      <td class="chart-legend-color"><span data-color="top-sales-color3"></span></td>
                      <td>Services</td>
                      <td class="chart-legend-value">824</td>
                    </tr>
                  </table>
                </div>
                <div class="be-spinner">
                  <svg width="40px" height="40px" viewBox="0 0 66 66" xmlns="http://www.w3.org/2000/svg">
                    <circle fill="none" stroke-width="4" stroke-linecap="round" cx="33" cy="33" r="30" class="circle"></circle>
                  </svg>
                </div>
              </div>
            </div>
            <div class="col-xs-12 col-md-4">
              <div class="widget widget-calendar">
                <div id="calendar-widget"></div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-12 col-md-6">
              <div class="panel panel-default">
                <div class="panel-heading">Latest Activity</div>
                <div class="panel-body">
                  <ul class="user-timeline user-timeline-compact">
                    <li class="latest">
                      <div class="user-timeline-date">Just Now</div>
                      <div class="user-timeline-title">Create New Page</div>
                      <div class="user-timeline-description">Vestibulum lectus nulla, maximus in eros non, tristique.</div>
                    </li>
                    <li>
                      <div class="user-timeline-date">Today - 15:35</div>
                      <div class="user-timeline-title">Back Up Theme</div>
                      <div class="user-timeline-description">Vestibulum lectus nulla, maximus in eros non, tristique.</div>
                    </li>
                    <li>
                      <div class="user-timeline-date">Yesterday - 10:41</div>
                      <div class="user-timeline-title">Changes In The Structure</div>
                      <div class="user-timeline-description">Vestibulum lectus nulla, maximus in eros non, tristique.      </div>
                    </li>
                    <li>
                      <div class="user-timeline-date">Yesterday - 3:02</div>
                      <div class="user-timeline-title">Fix the Sidebar</div>
                      <div class="user-timeline-description">Vestibulum lectus nulla, maximus in eros non, tristique.</div>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="col-xs-12 col-md-6">
              <div class="widget be-loading">
                <div class="widget-head">
                  <div class="tools"><span class="icon mdi mdi-chevron-down"></span><span class="icon mdi mdi-refresh-sync toggle-loading"></span><span class="icon mdi mdi-close"></span></div>
                  <div class="title">Conversions</div>
                </div>
                <div class="widget-chart-container">
                  <div class="widget-chart-info xs-mb-20">
                    <div class="indicator indicator-positive pull-right"><span class="icon mdi mdi-chevron-up"></span><span class="number">15%</span></div>
                    <div class="counter counter-inline">
                      <div class="value">156k</div>
                      <div class="desc">Impressions</div>
                    </div>
                  </div>
                  <div id="map-widget" style="height: 265px;"></div>
                </div>
                <div class="be-spinner">
                  <svg width="40px" height="40px" viewBox="0 0 66 66" xmlns="http://www.w3.org/2000/svg">
                    <circle fill="none" stroke-width="4" stroke-linecap="round" cx="33" cy="33" r="30" class="circle"></circle>
                  </svg>
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