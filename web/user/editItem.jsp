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
        <script type="text/javascript" src="../js/AllProduct.js"></script>
        <script type="text/javascript" src="../js/stopBack.js"></script>
        
        <link rel="stylesheet" type="text/css" href="../css/epoch_styles.css" />
        <script type="text/javascript" src="../js/epoch_classes.js"></script>
        <script>
            var bas_cal,dp_cal,ms_cal;      
            window.onload = function () {$('#link').click();
            dp_cal  = new Epoch('epoch_popup','popup',document.getElementById('popup_container'));
            dp_cal  = new Epoch('epoch_popup','popup',document.getElementById('popup_container1'));
            
            };

            </script>
            
    </head>
    <body class="fixed-left" >

<jsp:include page="UserChk.jsp" />
        <!-- Begin page -->
        <div id="wrapper" style="padding: 20px"> 
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
            
            <c:choose>
                <c:when test= "${sessionScope.msg=='ERROR'}">
                </c:when>
                <c:otherwise>
                    
            

                    
            <!-- right Content -->   
                <!-- Start content -->
                        
                        <!-- Page-Title -->
                        <div class="row" >
                            <div class="col-sm-12">
                                <h4 class="page-title"> Edit Item Details</h4><br>
                            </div>
                        </div>
                        <c:set var="id" value="${param.i}" scope="page" />
                        <jsp:useBean id="itemInfo" class="model.ShowItemDetailsDao"/>
                        <c:set var="item" value="${itemInfo.gatItemDetails(id)}" scope="page" />
                        <jsp:useBean id="dateparse" class="com.dateParse"/>
                              
                        		<div class="card-box" >
                                              
                        			<div class="row" >
                                                    <div class="custom-modal-text text-left" id="addCustSuccess">
                                                        <form action="EditItem" method="post" onsubmit="return chkEditItemForm()">
                                                            <input type="hidden" value="${id}" name="id"/>
                                                            <div class="form-group">
                                                                <label for="name">Name <font color="red">*</font></label>
                                                                <input type="text" name="name" class="form-control" required value="${item[1]}"/>
                                                            </div>
                                                            <div style="width: 50%;float: left;padding-right: 2px">
                                                                <div class="form-group">
                                                                    <label for="name">Paket Size <font color="red">*</font></label>
                                                                    <input type="text" name="pktsize" class="form-control" required value="${item[2]}"/>
                                                                </div> 
                                                                    <div class="form-group">
                                                                    <label for="name">Manufacturing Date <font color="red">*</font></label>
                                                                    <input type="text" name="mfgdate" id="popup_container" name="price" step="0.01" class="form-control"  readonly="readonly" required value="${dateparse.getLocalDate(item[4])}"/>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="name">Price (Per Packet) <font color="red">*</font></label>
                                                                    <input type="number" name="price" step="0.01" class="form-control" required value="${item[6]}"/>
                                                                </div>
                                                            </div>
                                                            <div style="width: 50%;float: right;padding-left: 2px">
                                                                <div class="form-group">
                                                                    <label for="name">Batch <font color="red">*</font></label>
                                                                    <input type="text" name="batch" class="form-control" required value="${item[3]}"/>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="name">Expiring Date <font color="red">*</font></label>
                                                                    <input type="text" name="expdate" id="popup_container1" name="price" step="0.01" class="form-control"  readonly="readonly" required value="${dateparse.getLocalDate(item[5])}"/>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="name">Total Qnty(In Packets) <font color="red">*</font></label>
                                                                    <input type="number" name="qnty" min="0" class="form-control" required value="${item[7]}"/>
                                                                </div>
                                                            </div>
                                                        
                                                                <button type="button" style="float: right;margin-left: 5px" onclick="window.opener=self;window.close();" class="btn btn-danger waves-effect waves-light m-l-10">Cancel</button>
                                                            <button type="submit" style="float: right"  class="btn btn-default waves-effect waves-light">Save</button>
                                                        </form>
                                                    </div>
                                    
                                                </div>
			                        
                        			<div class="table-responsive">
                                                  

                                    </div>
             		</div>
                    </c:otherwise>
            </c:choose>
                    <c:remove var="msg" scope="session" />           
                                                                
                <!--MODEL-->                                                
                   <div id="success-modal" class="modal-demo" >
			    <button type="button" class="close" onclick="Custombox.close();">
			        <span>&times;</span><span class="sr-only">Close</span>
			    </button>
                                <h4 class="custom-modal-title"></h4>
                                <br><br>
                                <img src="../icon/done32.png"/> <b><font color="green">Item Updated Successfully.</font></b><br><br>
                                <button type="button" onclick="Custombox.close();" class="btn btn-default waves-effect waves-light">   OK   </button><br><br>
                </div>
                <div id="error-modal" class="modal-demo" >
			    <button type="button" class="close" onclick="Custombox.close();">
			        <span>&times;</span><span class="sr-only">Close</span>
			    </button>
                                <h4 class="custom-modal-title"></h4>
                                <br><br>
                                <img src="../icon/Error-32.png"/> <b><font color="red">Something Went Wrong. Try Again.</font></b><br><br>
                                <button type="button" onclick="window.opener=self;window.close();" class="btn btn-default waves-effect waves-light">   OK   </button><br><br>
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