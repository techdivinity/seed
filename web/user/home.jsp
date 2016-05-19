<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
        <meta name="author" content="Coderthemes">

        <link rel="shortcut icon" href="../assets/images/favicon_1.ico">

        <title>TechDivinity</title>
        
        <!--Morris Chart CSS -->
		<link rel="stylesheet" href="../assets/plugins/morris/morris.css">

        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/core.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/components.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/icons.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/pages.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/responsive.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shiv and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->

        <script src="../assets/js/modernizr.min.js"></script>
        
    </head>


    <body class="fixed-left">

        <!-- Begin page -->
        <div id="wrapper">
            <jsp:include page="topper.jsp" />
            <jsp:include page="menu.html" /> 

            <!-- right Content -->
            <div class="content-page">
                <!-- Start content -->
                <div class="content">
                    <div class="container">

                        <!-- Page-Title -->
                        <div class="row">
                            <div class="col-sm-12">
                                <h4 class="page-title">Dashboard</h4>
                                <p class="text-muted page-title-alt">Welcome to Tech Divinity ERP  admin panel !</p>
                            </div>
                        </div>

        

                        
                        <div class="row">
                        	        
                            <div class="col-lg-12">
                                <div class="card-box">										
									<h4 class="text-dark header-title m-t-0">Deals Analytics</h4>
									<div class="text-center">
										<ul class="list-inline chart-detail-list">
											<li>
												<h5><i class="fa fa-circle m-r-5" style="color: #7e57c2;"></i>Deal - Won</h5>
											</li>
											<li>
												<h5><i class="fa fa-circle m-r-5" style="color: #34d3eb;"></i>Deal - Lost</h5>
											</li>
										</ul>
									</div>
									<div id="morris-line-chart" style="height: 300px;"></div>
								</div>
								<!-- /Portlet -->

                            </div>

                        </div>
                        <!-- end row -->
                        
                        
                        <div class="row">
                        	
                        	<div class="col-lg-6">
                        		<div class="card-box">
                        			<h4 class="text-dark header-title m-t-0 m-b-30">Average time for deal</h4>
                        			<div>
                                    	<div id="morris-bar-chart" style="height: 320px;"></div>
                                    </div>
                        		</div>
                        	</div>
                        	<!-- col -->
                        	
                        	<div class="col-lg-6">
                        		<div class="card-box">
                        			<h4 class="text-dark header-title m-t-0 m-b-30">Sales by product group</h4>
                                    <div class="text-center">
                                        <ul class="list-inline chart-detail-list">
                                            <li>
                                                <h5><i class="fa fa-circle m-r-5" style="color: #ebeff2;"></i>Group 1</h5>
                                            </li>
                                            <li>
												<h5><i class="fa fa-circle m-r-5" style="color: #7e57c2;"></i>Group 2</h5>
											</li>
											<li>
												<h5><i class="fa fa-circle m-r-5" style="color: #34d3eb;"></i>Group 3</h5>
											</li>
                                        </ul>
                                    </div>
                        			<div id="donut-chart">
                                    	<div id="morris-donut-example" style="height: 274px;">
                                    	</div>
                                    </div>
                        		</div>
                        	</div>
                        	<!-- col -->
                        		
                        	
                        </div>
                        <!-- end row -->
                        
                        
                        <div class="row">
                        	<div class="col-lg-7">
                        		<div class="card-box">
                        			<h4 class="text-dark header-title m-t-0">Contacts</h4>
                        			<p class="text-muted m-b-30 font-13">
										Your awesome text goes here.
									</p>
                        			
                        			<div class="nicescroll" style="height: 300px;">
	                        			<div class="table-responsive">
	                                        <table class="table table-actions-bar">	
												<thead>
													<tr>
														<th>Name</th>
														<th>Category</th>
														<th>Email</th>
														<th>Status</th>
														<th>Action</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>John deo</td>
														<td>Category one</td>
														<td>johndeo@dummy.com</td>
														<td><span class="label label-success">Delivered</span></td>
														<td>
                                                            <a href="#" class="table-action-btn"><i class="md md-edit"></i></a>
                                                            <a href="#" class="table-action-btn"><i class="md md-close"></i></a>
                                                        </td>
													</tr>
													<tr>
														<td>John deo</td>
														<td>Category one</td>
														<td>johndeo@dummy.com</td>
														<td><span class="label label-success">Delivered</span></td>
														<td>
                                                            <a href="#" class="table-action-btn"><i class="md md-edit"></i></a>
                                                            <a href="#" class="table-action-btn"><i class="md md-close"></i></a>
                                                        </td>
													</tr>
													<tr>
														<td>John deo</td>
														<td>Category one</td>
														<td>johndeo@dummy.com</td>
														<td><span class="label label-success">Delivered</span></td>
														<td>
                                                            <a href="#" class="table-action-btn"><i class="md md-edit"></i></a>
                                                            <a href="#" class="table-action-btn"><i class="md md-close"></i></a>
                                                        </td>
													</tr>
													<tr>
														<td>John deo</td>
														<td>Category one</td>
														<td>johndeo@dummy.com</td>
														<td><span class="label label-success">Delivered</span></td>
														<td>
                                                            <a href="#" class="table-action-btn"><i class="md md-edit"></i></a>
                                                            <a href="#" class="table-action-btn"><i class="md md-close"></i></a>
                                                        </td>
													</tr>
													<tr>
														<td>John deo</td>
														<td>Category one</td>
														<td>johndeo@dummy.com</td>
														<td><span class="label label-success">Delivered</span></td>
														<td>
                                                            <a href="#" class="table-action-btn"><i class="md md-edit"></i></a>
                                                            <a href="#" class="table-action-btn"><i class="md md-close"></i></a>
                                                        </td>
													</tr>
													
													<tr>
														<td>John deo</td>
														<td>Category one</td>
														<td>johndeo@dummy.com</td>
														<td><span class="label label-success">Delivered</span></td>
														<td>
                                                            <a href="#" class="table-action-btn"><i class="md md-edit"></i></a>
                                                            <a href="#" class="table-action-btn"><i class="md md-close"></i></a>
                                                        </td>
													</tr>
													
													<tr>
														<td>John deo</td>
														<td>Category one</td>
														<td>johndeo@dummy.com</td>
														<td><span class="label label-success">Delivered</span></td>
														<td>
                                                            <a href="#" class="table-action-btn"><i class="md md-edit"></i></a>
                                                            <a href="#" class="table-action-btn"><i class="md md-close"></i></a>
                                                        </td>
													</tr>
												</tbody>
											</table>
	                                    </div>
                                    </div>
                        		</div>
                        	</div>
                        	<!-- end col -->
                        	
                        	<div class="col-lg-5">
                        		<div class="card-box">
                        			<h4 class="text-dark header-title m-t-0">Activities</h4>
                        			<p class="text-muted font-13">
										Your awesome text goes here.
									</p>
                        			
                        			<div class="nicescroll p-20" style="height: 320px;">
                        				<div class="timeline-2">
		                                    <div class="time-item">
		                                        <div class="item-info">
		                                            <div class="text-muted"><small>5 minutes ago</small></div>
		                                            <p><strong><a href="#" class="text-info">John Doe</a></strong> Uploaded a photo <strong>"DSC000586.jpg"</strong></p>
		                                        </div>
		                                    </div>
		
		                                    <div class="time-item">
		                                        <div class="item-info">
		                                            <div class="text-muted"><small>30 minutes ago</small></div>
		                                            <p><a href="" class="text-info">Lorem</a> commented your post.</p>
		                                            <p><em>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam laoreet tellus ut tincidunt euismod. "</em></p>
		                                        </div>
		                                    </div>
		
		                                    <div class="time-item">
		                                        <div class="item-info">
		                                            <div class="text-muted"><small>59 minutes ago</small></div>
		                                            <p><a href="" class="text-info">Jessi</a> attended a meeting with<a href="#" class="text-success">John Doe</a>.</p>
		                                            <p><em>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam laoreet tellus ut tincidunt euismod. "</em></p>
		                                        </div>
		                                    </div>
		
		                                    <div class="time-item">
		                                        <div class="item-info">
		                                            <div class="text-muted"><small>5 minutes ago</small></div>
		                                            <p><strong><a href="#" class="text-info">John Doe</a></strong>Uploaded 2 new photos</p>
		                                        </div>
		                                    </div>
		
		                                    <div class="time-item">
		                                        <div class="item-info">
		                                            <div class="text-muted"><small>30 minutes ago</small></div>
		                                            <p><a href="" class="text-info">Lorem</a> commented your post.</p>
		                                            <p><em>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam laoreet tellus ut tincidunt euismod. "</em></p>
		                                        </div>
		                                    </div>
		
		                                    <div class="time-item">
		                                        <div class="item-info">
		                                            <div class="text-muted"><small>59 minutes ago</small></div>
		                                            <p><a href="" class="text-info">Jessi</a> attended a meeting with<a href="#" class="text-success">John Doe</a>.</p>
		                                            <p><em>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam laoreet tellus ut tincidunt euismod. "</em></p>
		                                        </div>
		                                    </div>
		                                </div>
                        			</div>
                                    
                        		</div>
                        	</div>
                        	<!-- end col -->
                        </div>
                        
                        

                    </div> <!-- container -->
                               
                </div> <!-- content -->

                <footer class="footer text-right">
                    2015 © Ubold.
                </footer>

            </div>
            
            
            <!-- ============================================================== -->
            <!-- End Right content here -->
            <!-- ============================================================== -->


            <!-- Right Sidebar -->
            <div class="side-bar right-bar nicescroll">
                <h4 class="text-center">Chat</h4>
                <div class="contact-list nicescroll">
                    <ul class="list-group contacts-list">
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="assets/images/users/avatar-1.jpg" alt="">
                                </div>
                                <span class="name">Chadengle</span>
                                <i class="fa fa-circle online"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="assets/images/users/avatar-2.jpg" alt="">
                                </div>
                                <span class="name">Tomaslau</span>
                                <i class="fa fa-circle online"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="assets/images/users/avatar-3.jpg" alt="">
                                </div>
                                <span class="name">Stillnotdavid</span>
                                <i class="fa fa-circle online"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="assets/images/users/avatar-4.jpg" alt="">
                                </div>
                                <span class="name">Kurafire</span>
                                <i class="fa fa-circle online"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="assets/images/users/avatar-5.jpg" alt="">
                                </div>
                                <span class="name">Shahedk</span>
                                <i class="fa fa-circle away"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="assets/images/users/avatar-6.jpg" alt="">
                                </div>
                                <span class="name">Adhamdannaway</span>
                                <i class="fa fa-circle away"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="assets/images/users/avatar-7.jpg" alt="">
                                </div>
                                <span class="name">Ok</span>
                                <i class="fa fa-circle away"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="assets/images/users/avatar-8.jpg" alt="">
                                </div>
                                <span class="name">Arashasghari</span>
                                <i class="fa fa-circle offline"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="assets/images/users/avatar-9.jpg" alt="">
                                </div>
                                <span class="name">Joshaustin</span>
                                <i class="fa fa-circle offline"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="assets/images/users/avatar-10.jpg" alt="">
                                </div>
                                <span class="name">Sortino</span>
                                <i class="fa fa-circle offline"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                    </ul>  
                </div>
            </div>
            <!-- /Right-bar -->

        </div>
        <!-- END wrapper -->


    
        <script>
            var resizefunc = [];
        </script>

        <!-- jQuery  -->
        <script src="../assets/js/jquery.min.js"></script>
        <script src="../assets/js/bootstrap.min.js"></script>
        <script src="../assets/js/detect.js"></script>
        <script src="../assets/js/fastclick.js"></script>
        <script src="../assets/js/jquery.slimscroll.js"></script>
        <script src="../assets/js/jquery.blockUI.js"></script>
        <script src="../assets/js/waves.js"></script>
        <script src="../assets/js/wow.min.js"></script>
        <script src="../assets/js/jquery.nicescroll.js"></script>
        <script src="../assets/js/jquery.scrollTo.min.js"></script>
        
        <!-- KNOB JS -->
        <!--[if IE]>
        <script src="assets/plugins/jquery-knob/excanvas.js"></script>
        <![endif]-->

        <script src="../assets/plugins/jquery-knob/jquery.knob.js"></script>
        
        <!--Morris Chart-->
		<script src="../assets/plugins/morris/morris.min.js"></script>
		<script src="../assets/plugins/raphael/raphael-min.js"></script>
		
		<!-- Flot chart -->
		<script src="../assets/plugins/flot-chart/jquery.flot.js"></script>
        <script src="../assets/plugins/flot-chart/jquery.flot.time.js"></script>
        <script src="../assets/plugins/flot-chart/jquery.flot.tooltip.min.js"></script>
        <script src="../assets/plugins/flot-chart/jquery.flot.resize.js"></script>
        <script src="../assets/plugins/flot-chart/jquery.flot.pie.js"></script>
        <script src="../assets/plugins/flot-chart/jquery.flot.selection.js"></script>
        <script src="../assets/plugins/flot-chart/jquery.flot.crosshair.js"></script>


        <script src="../assets/plugins/peity/jquery.peity.min.js"></script>

		<script src="../assets/pages/jquery.dashboard_crm.js"></script>


        <script src="../assets/js/jquery.core.js"></script>
        <script src="../assets/js/jquery.app.js"></script>
        
        
        
        <script>
			$(function() {
				$(".knob").knob();
			});
		</script>

       
    
    </body>
</html>