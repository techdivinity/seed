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
        <script type="text/javascript" src="../js/stopBack.js"></script>
        
        <link rel="stylesheet" type="text/css" href="../css/epoch_styles.css" />
        <script type="text/javascript" src="../js/epoch_classes.js"></script>
        <script>
            var bas_cal,dp_cal,ms_cal;      
            window.onload = function () {
            dp_cal  = new Epoch('epoch_popup','popup',document.getElementById('popup_container'));
            dp_cal  = new Epoch('epoch_popup','popup',document.getElementById('popup_container1'));
            };
            </script>
            
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
                                <h4 class="page-title"> Add Item</h4><br>
                            </div>
                        </div>
                        
                        <jsp:useBean id="test" class="model.CatPopDao"/>
                        <c:set var="alphabet" value="${test.gatOption()}" scope="page" />
                                    
                        		<div class="card-box" >
                                              
                        			<div class="row" >
                                                    <div class="custom-modal-text text-left" id="addCustSuccess">
                                                        <form action=""method="post">
                                                            <div style="width: 50%;float: left;padding-right: 2px"> 
                                                                <div class="form-group">
                                                                    <label for="name">Select Category <font color="red">*</font></label>
                                                                    <select name="cat" id="cat" onchange="poupateSubCat()" class="form-control" required>
                                                                        <option value="" disabled selected>---Select Category---</option>
                                                                        <c:forEach var="item" items="${alphabet}" varStatus="status" step="2">
                                                                            <option value="${alphabet[status.index ]}">
                                                                                <c:out value="${alphabet[status.index+1 ]}" />
                                                                            </option>
                                                                        </c:forEach>
                                                                    </select> 
                                                                </div>
                                                            </div>  
                                                            <div style="width: 50%;float: right;padding-left: 2px">
                                                                <div class="form-group">
                                                                    <label for="name">Select Sub Category <font color="red">*</font></label>
                                                                    <select name="subcat" id="subcat" class="form-control" required>
                                                                        <option value="" disabled selected>Select Sub Category</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="name">Name <font color="red">*</font></label>
                                                                <input type="text" name="name" class="form-control" required/>
                                                            </div>
                                                            <div style="width: 50%;float: left;padding-right: 2px">
                                                                <div class="form-group">
                                                                    <label for="name">Paket Size</label>
                                                                    <input type="text" name="name" class="form-control" required/>
                                                                </div> 
                                                                <div class="form-group">
                                                                    <label for="name">Manufacturing Date</label>
                                                                    <input type="text" id="popup_container" name="price" step="0.01" class="form-control" required readonly="readonly"/>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="name">Price (Per Packet)</label>
                                                                    <input type="number" name="price" step="0.01" class="form-control" required/>
                                                                </div>
                                                            </div>
                                                            <div style="width: 50%;float: right;padding-left: 2px">
                                                                <div class="form-group">
                                                                    <label for="name">Batch</label>
                                                                    <input type="text" name="name" class="form-control" required/>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="name">Expiring Date</label>
                                                                    <input type="text" id="popup_container1" name="price" step="0.01" class="form-control" required readonly="readonly"/>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="name">Total Qnty(In Packets)</label>
                                                                    <input type="number" name="price" min="0" class="form-control" required/>
                                                                </div>
                                                            </div>
                                                        
                                                            <button type="reset" style="float: right" class="btn btn-danger waves-effect waves-light m-l-10">Reset</button>
                                                            <button type="submit" style="float: right"  class="btn btn-default waves-effect waves-light">Save</button>
                                                            
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