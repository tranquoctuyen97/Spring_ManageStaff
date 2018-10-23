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
          <h2 class="page-head-title">Wizard Form</h2>
          <ol class="breadcrumb page-head-nav">
            <li><a href="form-wizard.html#">Home</a></li>
            <li><a href="form-wizard.html#">Forms</a></li>
            <li class="active">Wizard</li>
          </ol>
        </div>
        <div class="main-content container-fluid">
          <div class="row wizard-row">
            <div class="col-md-12 fuelux">
              <div class="block-wizard panel panel-default">
                <div id="wizard1" class="wizard wizard-ux">
                  <ul class="steps">
                    <li data-step="1" class="active">Step 1<span class="chevron"></span></li>
                    
                  </ul>
                 
                  <div class="step-content">
                    <div data-step="1" class="step-pane active">
                      <form action="<%=request.getContextPath()  %>/user/newUser" data-parsley-namespace="data-parsley-" class="form-horizontal group-border-dashed"
                      method="post">
                        <div class="form-group no-padding">
                          <div class="col-sm-7">
                            <h3 class="wizard-title">User Info</h3>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-3 control-label">User Name</label>
                          <div class="col-sm-6">
                            <input type="text" placeholder="User name" class="form-control "  name="username">
                          </div>
                        </div>
                       <div class="form-group">
                          <label class="col-sm-3 control-label">Họ Tên</label>
                          <div class="col-sm-6">
                            <input type="text" placeholder="Enter your Full Name" class="form-control" name="fullname">
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-3 control-label">Mật Khẩu</label>
                          <div class="col-sm-6">
                            <input type="password" placeholder="Enter your password" class="form-control" name="password">
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-3 control-label">Nhập Lại Mật Khẩu</label>
                          <div class="col-sm-6">
                            <input type="password" placeholder="Enter your password again" class="form-control" name="nhaplaipassword">
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="col-sm-offset-2 col-sm-10">
                          <a class="btn btn-default btn-space" id="cancel-user">Cancel</a>
                            <button data-wizard="#wizard1" class="btn btn-primary btn-space wizard-next" type="submit">Thêm User</button>
                          </div>
                        </div>
                      </form>
                    </div>
                    <div data-step="2" class="step-pane">
                      <form action="form-wizard.html#" data-parsley-namespace="data-parsley-"  class="form-horizontal group-border-dashed">
                        <div class="form-group no-padding">
                          <div class="col-sm-7">
                            <h3 class="wizard-title">Notifications</h3>
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="col-sm-7">
                            <label class="control-label">E-Mail Notifications</label>
                            <p>This option allow you to recieve email notifications by us.</p>
                          </div>
                          <div class="col-sm-3 xs-pt-15">
                            <div class="switch-button">
                              <input type="checkbox" checked="" name="swt1" id="swt1"><span>
                                <label for="swt1"></label></span>
                            </div>
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="col-sm-7">
                            <label class="control-label">Phone Notifications</label>
                            <p>Allow us to send phone notifications to your cell phone.</p>
                          </div>
                          <div class="col-sm-3 xs-pt-15">
                            <div class="switch-button">
                              <input type="checkbox" checked="" name="swt2" id="swt2"><span>
                                <label for="swt2"></label></span>
                            </div>
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="col-sm-7">
                            <label class="control-label">Global Notifications</label>
                            <p>Allow us to send notifications to your dashboard.</p>
                          </div>
                          <div class="col-sm-3 xs-pt-15">
                            <div class="switch-button">
                              <input type="checkbox" checked="" name="swt3" id="swt3"><span>
                                <label for="swt3"></label></span>
                            </div>
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="col-sm-12">
                            <button data-wizard="#wizard1" class="btn btn-default btn-space wizard-previous">Previous</button>
                            <button data-wizard="#wizard1" class="btn btn-primary btn-space wizard-next">Next Step</button>
                          </div>
                        </div>
                      </form>
                    </div>
                    <div data-step="3" class="step-pane">
                      <form action="form-wizard.html#" data-parsley-namespace="data-parsley-" data-parsley-validate="" novalidate="" class="form-horizontal group-border-dashed">
                        <div class="form-group no-padding">
                          <div class="col-sm-7">
                            <h3 class="wizard-title">Configuration</h3>
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="col-sm-6">
                            <label class="control-label">Buy Credits: <span id="credits">$30</span></label>
                            <p>This option allow you to buy an amount of credits.</p>
                            <input id="credit_slider" type="text" value="30" class="bslider form-control">
                          </div>
                          <div class="col-sm-6">
                            <label class="control-label">Change Plan</label>
                            <p>Change your plan many times as you want.</p>
                            <select class="select2">
                              <optgroup label="Personal">
                                <option value="p1">Basic</option>
                                <option value="p2">Medium</option>
                              </optgroup>
                              <optgroup label="Company">
                                <option value="p3">Standard</option>
                                <option value="p4">Silver</option>
                                <option value="p5">Gold</option>
                              </optgroup>
                            </select>
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="col-sm-6">
                            <label class="control-label">Payment Rate: <span id="rate">5%</span></label>
                            <p>Choose your payment rate to calculate how much money you will recieve.</p>
                            <input id="rate_slider" data-slider-min="0" data-slider-max="100" type="text" value="5" class="bslider form-control">
                          </div>
                          <div class="col-sm-6">
                            <label class="control-label">Keywords</label>
                            <p>Write your keywords to do a successful SEO with web search engines.</p>
                            <select multiple="" class="tags">
                              <option value="1">Twitter</option>
                              <option value="2">Google</option>
                              <option value="3">Facebook</option>
                            </select>
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="col-sm-12">
                            <button data-wizard="#wizard1" class="btn btn-default btn-space wizard-previous">Previous</button>
                            <button data-wizard="#wizard1" class="btn btn-success btn-space wizard-next">Complete</button>
                          </div>
                        </div>
                      </form>
                    </div>
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