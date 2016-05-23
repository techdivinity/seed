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
        <script type="text/javascript" src="../js/stopBack.js"></script>
        
        <link rel="stylesheet" type="text/css" href="../css/table.css" />
        <script>
            var bas_cal,dp_cal,ms_cal;      
            window.onload = function () {
            dp_cal  = new Epoch('epoch_popup','popup',document.getElementById('popup_container'));
            dp_cal  = new Epoch('epoch_popup','popup',document.getElementById('popup_container1'));
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
                                <a id="link" href="#success-modal"  data-animation="fadein" data-plugin="custommodal" 
                                       data-overlaySpeed="200" data-overlayColor="#36404a" ></a>
                            </c:when>
                            <c:when test= "${sessionScope.msg=='ERROR'}">
                                <a id="link" href="#error-modal"  data-animation="fadein" data-plugin="custommodal" 
                                       data-overlaySpeed="200" data-overlayColor="#36404a" ></a>
                            </c:when>
                            <c:otherwise></c:otherwise>
                        </c:choose>
                                <c:remove var="msg" scope="session" />

                        <!-- Page-Title -->
                        <div class="row" >
                            <div class="col-sm-12">
                                <h4 class="page-title"> Add Item</h4><br>
                            </div>
                        </div>
                        
                        <jsp:useBean id="test" class="model.CatPopDao"/>
                        <c:set var="alphabet" value="${test.gatOption()}" scope="page" />
                        <jsp:useBean id="custInfo" class="model.CustPopDao"/>
                        <c:set var="customer" value="${custInfo.gatCustomer()}" scope="page" />
                                    
                        <div class="card-box" >
                                              
                        			<div class="row" >
                                                    <div class="custom-modal-text text-left" id="addCustSuccess">
                                                        <form action=""method="post">
                                                            
                                                            <div style="width: 70%;float: left;padding-right: 2px;padding-top: 5px;border-right: 1px solid #CCC"> 
                                                                <div style="border-bottom: 1px solid #AAA">
                                                                    <div class="form-group">
                                                                        <label for="name">Select Customer <font color="red">*</font></label>
                                                                        <select name="cust" id="cust" onchange="displyCustInfo()" class="form-control" required>
                                                                            <option value="" disabled selected>---Select Customer---</option>
                                                                                <c:forEach var="custs" items="${customer}" varStatus="status" step="2">
                                                                                    <option value="${customer[status.index ]}">
                                                                                        <c:out value="${customer[status.index+1 ]}" />
                                                                                    </option>
                                                                                </c:forEach>
                                                                        </select>
                                                                        <table width="100%">
                                                                            <tr><td><b>Name :</b></td><td id="custName"></td></tr>
                                                                            <tr><td><b>Address :</b></td><td id="custAdd"></td></tr>
                                                                            <tr><td><b>City :</b></td><td id="custCity"></td></tr>
                                                                        </table>
                                                                    </div>
                                                                </div>

                                                                    <div class="form-group">
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
                                                                    <div class="form-group">
                                                                        <label for="name">Select Sub Category <font color="red">*</font></label>
                                                                        <select name="subcat" id="subcat" onchange="showCustomItems()" class="form-control" required>
                                                                            <option value="" disabled selected>---Select Sub Category---</option>
                                                                        </select>
                                                                    </div>
                                                                </div>  
                                                                <div id="itemsArea" style="width: 30%;float: right;padding-left: 2px;">

                                                                </div>
                                                            
                                                            <!--<p style="margin: 5px"></p>-->
                                                            <div style="width: 100%;overflow-x: auto;border-top: 1px solid #AAA;padding-top: 2px" >
                                                                    <table  id="itemTable" width="100%" class="simple" onclick="calculate()">
                                                                        <th>SNO</th><th>Name</th><th>Packet Size</th><th>Batch</th><th>MFG DATE</th><th>EXP Date</th><th>Price</th><th>Quantity</th><th>Total Price</th>
                                                                    </table>
                                                                <div style="background: #DDD;text-align: right;font-weight: bold;padding-right: 3px;">TOTAL : <span id="totalAmt"></span></div>
                                                            </div>


                                                                    <br><br>
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