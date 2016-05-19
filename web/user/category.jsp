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
        
        <script type="text/javascript" src="../js/Category.js"></script>
        <script type="text/javascript" src="../js/stopBack.js"></script>
 
    </head>
    <body class="fixed-left">
        
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

                        <!-- Page-Title -->
                        <div class="row" >
                            <div class="col-sm-12">
                                <h4 class="page-title">Categories
                                    <a style="float: right" href="#addSubCat-modal" onclick="show('one')"  class="btn btn-default btn-md waves-effect waves-light m-b-30" data-animation="fadein" data-plugin="custommodal" 
                                       data-overlaySpeed="200" data-overlayColor="#36404a" ><i class="md md-add"></i> Add Sub Category</a>
                                    <a style="float: right;margin-right: 5px" href="#addCat-modal" onclick="showCat('oneCat')"  class="btn btn-default btn-md waves-effect waves-light m-b-30" data-animation="fadein" data-plugin="custommodal" 
			                                                    	data-overlaySpeed="200" data-overlayColor="#36404a" ><i class="md md-add"></i> Add Category</a>                                           
                                </h4>
                            </div>
                        </div>
                                    
                        <div class="card-box" >
                            <div class="table-responsive">
                                <%--<c:out value="${requestScope.hiIndex}" />--%>
                                <%--<c:forEach var="item" items="${requestScope.catsInfo}">--%>
                                    <%--<c:forEach var="itemVal" items="${item}" >--%>
                                    <%--<c:out value="${itemVal}" />--%>
                                    <%--</c:forEach>--%>
                                    <!--<br>-->
                                <%--</c:forEach>--%>
                                
                                <table class="table table-hover mails m-0 table table-actions-bar">
                                    <tr style="background: lightyellow">
                                        <c:forEach var="item" items="${requestScope.catsInfo}" varStatus="status">
                                            <th>
                                                <c:out value="${requestScope.catsInfo[status.count-1][0]}" />
                                            </th>
                                        </c:forEach>
                                    </tr>
                                    <c:forEach var="item" varStatus="i" begin="1" end="${requestScope.hiIndex-1}">
                                        <tr>
                                        <c:forEach var="item" items="${requestScope.catsInfo}" varStatus="j" >
                                                <td>
                                                    <c:out value="${requestScope.catsInfo[j.count-1][i.count]}" />
                                                </td>
                                            
                                        </c:forEach>
                                            </tr>
                                    </c:forEach>
                                </table>

                            </div>
             		</div>
                           
                    </div> <!-- container -->
                               
                </div> <!-- content -->

                <footer class="footer text-right">
                    2015 © TechDivinity.
                </footer>

            </div>
            
            
            <!-- Modal -->
                <div id="addCat-modal" class="modal-demo" >
			    <button type="button" class="close" onclick="Custombox.close();">
			        <span>&times;</span><span class="sr-only">Close</span>
			    </button>
			    <h4 class="custom-modal-title">Add Category</h4>
                    <div id="oneCat">
			    <div class="custom-modal-text text-left" id="addsubCat">
			                        
                        
                        <div class="form-group">
                            <label for="position">Add Category</label>
                            <input type="text" class="form-control" id="catBox" placeholder="">
                        </div>
                        
                        <button type="button" onclick="chkAddCatForm()" class="btn btn-default waves-effect waves-light">Save</button>
                        <button type="button" onclick="Custombox.close();" class="btn btn-danger waves-effect waves-light m-l-10">Cancel</button>
                    
			    </div>
                    </div>
                    <div id="twoCat"><br>
                                <img src="../icon/load.gif"/><br>
                                Wait...<br><br>
                    </div>
                    <div id="threeCat"><br>
                                <img src="../icon/done32.png"/> <b><font color="green">Sub Category Added Successfully.</font></b><br><br>
                                <button type="button" onclick="window.location.reload();" class="btn btn-default waves-effect waves-light">   OK   </button><br><br>
                    </div>
                    <div id="fourCat"><br>
                                <img src="../icon/Error-32.png"/> <b><font color="red">Something Went Wrong. Try Again.</font></b><br><br>
                                <button type="button" onclick="showCat('oneCat')" class="btn btn-default waves-effect waves-light">   OK   </button><br><br>
                    </div>
                </div>
            
            
            <div id="addSubCat-modal" class="modal-demo" >
			    <button type="button" class="close" onclick="Custombox.close();">
			        <span>&times;</span><span class="sr-only">Close</span>
			    </button>
			    <h4 class="custom-modal-title">Add Sub Category</h4>
                    <div id="one">
			    <div class="custom-modal-text text-left" id="addsubCat">
			    
			<div class="form-group">
                            <label for="name">Select Category</label>
                            <select name="cat" class="form-control" id="cat">
                                
                            </select>
                            
                        </div>                        
                        
                        <div class="form-group">
                            <label for="position">Add Sub Category</label>
                            <input type="text" class="form-control" id="subcat" placeholder="">
                        </div>
                        
                        <button type="button" onclick="chkAddSubCatForm()" class="btn btn-default waves-effect waves-light">Save</button>
                        <button type="button" onclick="Custombox.close();" class="btn btn-danger waves-effect waves-light m-l-10">Cancel</button>
                    
			    </div>
                                </div>
                            <div id="two"><br>
                                <img src="../icon/load.gif"/><br>
                                Wait...<br><br>
                            </div>
                            <div id="three"><br>
                                <img src="../icon/done32.png"/> <b><font color="green">Sub Category Added Successfully.</font></b><br><br>
                                <button type="button" onclick="window.location.reload();" class="btn btn-default waves-effect waves-light">   OK   </button><br><br>
                            </div>
                            <div id="four"><br>
                                <img src="../icon/Error-32.png"/> <b><font color="red">Something Went Wrong. Try Again.</font></b><br><br>
                                <button type="button" onclick="show('one')" class="btn btn-default waves-effect waves-light">   OK   </button><br><br>
                            </div>
			</div>
            
            
            <!-- ============================================================== -->
            <!-- End Right content here -->
            <!-- ============================================================== -->




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