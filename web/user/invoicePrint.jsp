<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
        <meta name="author" content="Coderthemes">

        <link rel="shortcut icon" href="assets/images/favicon_1.ico">

        <title>Ubold - Responsive Admin Dashboard Template</title>

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

            <!-- Top Bar Start -->

            <!-- Top Bar End -->


            <!-- ========== Left Sidebar Start ========== -->

            <!-- Left Sidebar End --> 



            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->                      
            <div class="content-page">
                <!-- Start content -->
                <div class="content">
                    <div class="container" id="printingDiv">

                        <!-- Page-Title -->
                        

                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel panel-default">
                                    <!-- <div class="panel-heading">
                                        <h4>Invoice</h4>
                                    </div> -->
                                    <div class="panel-body">
                                        
                                                <c:if test="${requestScope.d == 'y' }">
                                                    *Duplicate
                                                    <jsp:useBean id="now" class="java.util.Date" scope="request" />
                                                    <div style="float: right">
                                                    <fmt:formatDate pattern="yyyy-MM-dd" value="${now}" />
                                                    </div>
                                                    <hr>
                                                </c:if>
                                        <div class="clearfix">
                                            <div class="pull-left">
                                                <h4 class="text-right">TECH DIVINITY</h4>
                                                <c:set var="obj" value="${requestScope.invInfo}" scope="page" />
                                            </div>
                                            <div class="pull-right">
                                                <h4>Invoice # <br>
                                                   <strong> <c:out value="${obj.getInvID()}"/> </strong>
                                                </h4>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-12">
                                                
                                                <div class="pull-left m-t-30">
                                                    <address>
                                                      <strong><c:out value="${obj.getFirstName()} ${obj.getLastName()}"/></strong><br>
                                                      ${obj.getAddress()}<br>
                                                      ${obj.getCity()}
                                                      </address>
                                                </div>
                                                <div class="pull-right m-t-30">
                                                    <p><strong>Date: </strong> ${obj.getCreatedDate()}</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="m-h-50"></div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="table-responsive">
                                                    <table class="table m-t-30">
                                                        <thead>
                                                            <tr><th>#</th>
                                                            <th>Item</th>
                                                            <th>Packet Size</th>
                                                            <th>Batch</th>
                                                            <th>MFG Date</th>
                                                            <th>EXP Date</th>
                                                            <th>Unit Cost</th>
                                                            <th>Quantity</th>
                                                            <th>Total</th>
                                                        </tr></thead>
                                                        <tbody>
                                                            <c:forEach var="item" items="${obj.getItemName()}" varStatus="status">
                                                                <tr>
                                                                    <td>${status.count}</td>
                                                                    <td>${obj.getItemName()[status.index]}</td>
                                                                    <td>${obj.getPacketSize()[status.index]}</td>
                                                                    <td>${obj.getBatch()[status.index]}</td>
                                                                    <td>${obj.getMFGDate()[status.index]}</td>
                                                                    <td>${obj.getEXPDate()[status.index]}</td>
                                                                    <td>${obj.getPrice()[status.index]}</td>
                                                                    <td>${obj.getQnty()[status.index]}</td>
                                                                    <td>${obj.getTotal()[status.index]}</td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="border-radius: 0px;">
                                            <div class="col-md-3 col-md-offset-9">
                                                <p class="text-right"><b>Sub-total: ${obj.getTotalAmount()} </b></p>
                                                <c:if test="${obj.getDiscount() != 0.0}">
                                                    <p class="text-right">Discount  : ${obj.getDiscount()} %</p>
                                                </c:if>
                                                <p class="text-right">VAT  : ${obj.getVat()} %</p>
                                                <hr>
                                                <h3 class="text-right"><b>Total: ${obj.getFinalAmount()} </b></h3>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="hidden-print">
                                            <div class="pull-right">
                                                <a href="javascript:window.print()" class="btn btn-inverse waves-effect waves-light"><i class="fa fa-print"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>

                    </div> <!-- container -->
                               
                </div> <!-- content -->

                

            </div>
            <!-- ============================================================== -->
            <!-- End Right content here -->
            <!-- ============================================================== -->


            <!-- Right Sidebar -->
            
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


        <script src="../assets/js/jquery.core.js"></script>
        <script src="../assets/js/jquery.app.js"></script>
	
	</body>
</html>