//$.ajaxSetup({
//    scriptCharset: "utf-8",
//    contentType: "application/json; charset=utf-8"
//});
$(document).ready(function() {
	var kiemtra_phone;
	var kiemtra_email;
					$("#btndangnhap").click(function() {
										var usename = $("#username").val();
										var password = $("#password").val();

										$.ajax({

													url : "/Assignment/api/kiemtradangnhap",
													type : "GET",

													data : {
														username : usename,
														password : password
													},

													success : function(value) {
														if (value == "true") {
															window.location.href = "/Assignment/";
														}else{
															$("#ketqua").css(
																	"color",
																	"red");
															$("#ketqua")
																	.text(
																			"Đăng nhập thất bại ! Vui lòng kiểm tra Username hoặc Password !")
														}

													}
												})
									});

					$("body").on(
							"click",
							".btnxoanv",
							function() {

								var self = $(this);
								var tennv = $(this).attr("data-name");
								var chon = confirm("Bạn muốn xóa Nhân Viên "
										+ tennv + " ?");
								var maid = $(this).attr("data-id");
								if (chon == true) {
									$.ajax({

										url : "/Assignment/staff/deletestaff",
										type : "GET",

										data : {
											id : maid,

										},

										success : function(value) {
											self.closest("tr").remove();

										}
									})
								}

							});

					// $(".btnxoadepart").click(function() {
					//	
					//		
					//
					// });

					// $("#cancel-user").click(function() {
					// window.location.href="/Assignment/user/newUser";
					//		
					//
					// });
					$("body").on("click", ".paging-item", function() {
						$(".paging-item").removeClass("active");// xóa class
																// active
						$(this).addClass("active");// thêm class active tại nơi
													// click
						var batdau = $(this).text();// lấy biến

						$.ajax({

							url : "/Assignment/staff/pagestaff",
							type : "GET",

							data : {
								start : batdau,

							},

							success : function(value) {
								var tbody = $("#table1").find("tbody");
								tbody.empty();
								tbody.append(value);

							}
						})
					});

					var files = [];
					$("#exampleInputFile").change(function(event) {
						files = event.target.files;
						forms = new FormData();
						forms.append("file", files[0]);
						$.ajax({

							url : "/Assignment/api/uploadfile",
							type : "POST",
							data : forms,
							contentType : false,
							processData : false,

							enctype : "multipart/form-data",
							success : function(value) {

							}
						})

					});
					$("body").on("click", ".viewstaff", function() {

						var maid = $(this).attr("data-id");

						$.ajax({

							url : "/Assignment/staff/viewtaff",
							type : "GET",

							data : {
								id : maid,

							},

							success : function(value) {
								var tbody = $("#myModal").find(".changestaff");
								tbody.empty();
								tbody.append(value);

							}
						})
					});
					
					$("#email_id").blur(function(){
						var emails = $("#email_id").val();
					$.ajax({
						
													url : "/Assignment/api/kiemtraemail",
													type : "GET",
						
													data : {
														email : emails,
													
						
													},
						
													success : function(value) {
														if (value=="true") {
															kiemtra_email=false;
															$( "#btninsertstaff" ).prop( "disabled", true );
															$("#kiemtra_email").css("color","red");
															$("#kiemtra_email").text("Email đã tồn tại !");
														}
														if (value=="false") {
															kiemtra_email=true;
															if (kiemtra_email==true&&kiemtra_phone==true) {
																$( "#btninsertstaff" ).prop( "disabled", false );
															}
															$("#kiemtra_email").text("");
															
														}
						
													}
												})
						
					});

					$("#phone_id").blur(function(){
						var phones = $("#phone_id").val();
					$.ajax({
						
													url : "/Assignment/api/kiemtraphone",
													type : "GET",
						
													data : {
														phone : phones,
													
						
													},
						
													success : function(value) {
														if (value=="true") {
															kiemtra_phone=false;
															$( "#btninsertstaff" ).prop( "disabled", true );
															$("#kiemtra_phone").css("color","red");
															$("#kiemtra_phone").text("Số điện thoại đã tồn tại !");
														}
														if (value=="false") {
															kiemtra_phone=true;
															if (kiemtra_email==true&&kiemtra_phone==true) {
																$( "#btninsertstaff" ).prop( "disabled", false );
															}
															$("#kiemtra_phone").text("");
															
														}
						
													}
												})
						
					});
					$("body").on(
							"click",
							".btnxoadepart",
							function() {

								var self = $(this);
								var tennv = $(this).attr("data-name");
								var chon = confirm("Bạn muốn xóa Phòng Ban "
										+ tennv + " ?");
								var maid = $(this).attr("data-id");
								if (chon == true) {
									$.ajax({

										url : "/Assignment/depart/deleteDepart",
										type : "GET",

										data : {
											id : maid,

										},

										success : function(value) {
											self.closest("tr").remove();

										}
									})
								}

							});
					$(".hihin").click(function (event) {
						event.preventDefault();
						var formdata=$("#form-sanpham").serializeArray();
						json = {};
					
						
						 $.each(formdata, function(i, field){
							 if (field.name== field.value) {
								 json[""+i+""]   = field.value; 
								 console.log(field.name);
								
							}
									 
						 });
						 $.ajax({
								url:"/Assignment/record/insertmuster",
							    type:"POST",
							    
							    data:{
							    	dataJson: JSON.stringify(json)
							    },
								success: function(value){
									
								}
							})
						 
					});
					var id_staff;
					var button;
					$("body").on("click",".btn_chamdiem",function() {
						 button=$(this);
								var idstaff = $(this).attr("data-id");
								id_staff=idstaff;
								 $.ajax({
								url:"/Assignment/api/viewRecord",
							    type:"POST",
							    
							    data:{
							    	id: idstaff
							    },
								success: function(value){
									if (value.photo!="") {
										var a=$('#staff_img').attr('src',"/Assignment/resources/img/staff"+"/"+value.photo+"");
									}else{
										$('#staff_img').attr('src',"/Assignment/resources/img/staff/images.png");
									}	
								}
							})

							});	
					$("body").on("click",".btn_chamdiem_staff",function() {
						
						var json = {};
						var id=id_staff;
						var bien;
						$("input:checkbox:checked").map(function()
						{
							if ($(this).val()!="on") {
								json[""+ $(this).val() +""]=$(this).val();	
							}				
							});

						
						console.log(json)
							 $.ajax({
							url:"/Assignment/api/insertRecord",
						    type:"POST",
						    data:{
						    	dataJson: JSON.stringify(json),
						    	id :id
						    },
							success: function(value){
								   
									  $('#squarespaceModal').modal('hide');
									   $('#squarespaceModal').attr("aria-hidden","true")  ;  
									
								 $('input:checkbox').removeAttr('checked');
								 button.closest("tr").remove();
								
							}
						})
					});
					});
					
					