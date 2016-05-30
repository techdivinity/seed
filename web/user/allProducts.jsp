
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
        <meta name="author" content="Coderthemes">
        <link rel="shortcut icon" href="../assets/images/favicon_1.ico">
        <title>Tech Divinity</title>
        <link href="../assets/plugins/custombox/dist/custombox.min.css" rel="stylesheet">
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/core.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/components.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/icons.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/pages.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/responsive.css" rel="stylesheet" type="text/css" />
        <script src="../assets/js/modernizr.min.js"></script>
        
        <script type="text/javascript" src="../js/Item.js"></script>
        <script type="text/javascript" src="../js/Customer.js"></script>
        <script type="text/javascript" src="../js/Invoice.js"></script>
        <script type="text/javascript" src="../js/AllProduct.js"></script>
        <script type="text/javascript" src="../js/stopBack.js"></script>
        
        <link rel="stylesheet" type="text/css" href="../css/table.css" />
        <script>
                  
            window.onload = function () {
            $('#link').click();
            
            };
            
            

            </script>
            
    </head>
    <body class="fixed-left" >

<jsp:include page="UserChk.jsp" />
        <!-- Begin page -->
        <div id="wrapper">
            <jsp:include page="topper.jsp" />
            <jsp:include page="menu.html" /> 

            <!-- right Content -->                     
            <div class="content-page">
                <!-- Start content -->
                <div class="content">
                    <div class="container">
                        <c:choose>
                            <c:when test= "${sessionScope.msg=='SUCCESS'}">
                                <a id="link" onclick="window.open('showInvoice?i=${sessionScope.val}', 'newwindow', 'scrollbars=yes, width='+($(window).width()-($(window).width()*0.1))+', height='+($(window).height()-($(window).height()*0.1))+',top='+$(window).height()*0.05+',left='+$(window).width()*0.05+''); return false;"></a>
                            </c:when>
                            <c:when test= "${sessionScope.msg=='ERROR'}">
                                <a id="link" href="#error-modal"  data-animation="fadein" data-plugin="custommodal" 
                                       data-overlaySpeed="200" data-overlayColor="#36404a" ></a>
                            </c:when>
                            <c:otherwise></c:otherwise>
                        </c:choose>
                                <c:remove var="msg" scope="session" /><c:remove var="val" scope="session" />

                        <!-- Page-Title -->
                        <div class="row" >
                            <div class="col-sm-12">
                                <h4 class="page-title"> All Products</h4><br>
                            </div>
                        </div>
                        <jsp:useBean id="test" class="model.CatPopDao"/>
                        <c:set var="alphabet" value="${test.gatOption()}" scope="page" />
                        
                                    
                        <div class="card-box" >
                                              
                        			<div class="row" >
                                                    <div class="custom-modal-text text-left" id="addCustSuccess">
                                                        <form action="Invoice"method="post" onsubmit="return proceedToNext()">
                                                            <div class="form-group" style="width: 50%;float: left;padding-right: 2px">
                                                                <label for="name">Select Category <font color="red">*</font></label>
                                                                <select name="cat" id="cat"  onchange="poupateSubCat();clrArea()" class="form-control" required>
                                                                    <option value="" disabled selected>---Select Category---</option>
                                                                    <c:forEach var="item" items="${alphabet}" varStatus="status" step="2">
                                                                        <option value="${alphabet[status.index ]}">
                                                                            <c:out value="${alphabet[status.index+1 ]}" />
                                                                        </option>
                                                                    </c:forEach>
                                                                </select> 
                                                            </div>
                                                            <div class="form-group" style="width: 50%;float: left;padding-left: 2px">
                                                                <label for="name">Select Sub Category <font color="red">*</font></label>
                                                                <select name="subcat" id="subcat" onchange="showCustomItemsInAllProduct()" class="form-control" required>
                                                                    <option value="" disabled selected>---Select Sub Category---</option>
                                                                </select>
                                                            </div> 
                                                            <div id="itemsArea" >

                                                            </div>

                                                                    <br><br>
                                                        </form>
                                                    </div>
                                    
                                                </div>
			                        
                        			<div class="table-responsive">
                                                  

                                    </div>
             		</div>
                           
                    </div> <!-- container -->
                               
                </div> <!-- content -->

                <jsp:include page="footer.jsp"/>
                
            </div>
            <!-- Modal -->
                <div id="success-modal" class="modal-demo" >
			    <button type="button" class="close" onclick="Custombox.close();">
			        <span>&times;</span><span class="sr-only">Close</span>
			    </button>
                                <h4 class="custom-modal-title"></h4>
                                <br><br>
                                <img src="../icon/done32.png"/> <b><font color="green">Item Added Successfully.</font></b><br><br>
                                <button type="button" onclick="Custombox.close();" class="btn btn-default waves-effect waves-light">   OK   </button><br><br>
                </div>
                <div id="error-modal" class="modal-demo" >
			    <button type="button" class="close" onclick="Custombox.close();">
			        <span>&times;</span><span class="sr-only">Close</span>
			    </button>
                                <h4 class="custom-modal-title"></h4>
                                <br><br>
                                <img src="../icon/Error-32.png"/> <b><font color="red">Something Went Wrong. Try Again.</font></b><br><br>
                                <button type="button" onclick="Custombox.close();" class="btn btn-default waves-effect waves-light">   OK   </button><br><br>
                </div>

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
        
        <!-- Modal-Effect -->
        <script src="../assets/plugins/custombox/dist/custombox.min.js"></script>
        <script src="../assets/plugins/custombox/dist/legacy.min.js"></script>
        

       
    
    </body>
</html>