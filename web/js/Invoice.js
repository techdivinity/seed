function calculate()
{
        var tbl = document.getElementById("itemTable");
        var cLength=tbl.rows[0].cells.length;
        if (tbl != null) 
        {
            for (var i = 0; i < tbl.rows.length; i++) 
            {
                for (var j = 0; j < tbl.rows[i].cells.length; j++)
                { 
                        tbl.rows[i].onkeyup = function () 
                    {
                            getval(this);
                            
                              var totalAmount=0.0;
                              var totalAmountPrint=0.0;
                              for (var ii = 1; ii < tbl.rows.length; ii++) 
                                {   
                                       var tt= tbl.rows[ii].cells[8].textContent; 
                                       if(parseFloat(tt))
                                       { 
                                       totalAmount += parseFloat(tt);
                                       totalAmountPrint=totalAmount.toFixed(2);
                                        }
                                } 
    //                              document.getElementById("total").innerHTML='<input type="hidden" value="'+totalAmountPrint+'" name="totalAmount">'+totalAmountPrint;
                                  document.getElementById("totalAmt").innerHTML='<input type="hidden" value="'+totalAmountPrint+'" name="totalAmount">'+totalAmountPrint;
                                  calFinalTotal();
                    };

                    tbl.rows[i].onclick = function () 
                    {
                            getval(this);

                              var totalAmount=0.0;
                              var totalAmountPrint=0.0;
                              for (var ii = 1; ii < tbl.rows.length; ii++) 
                                {
                                       var tt= tbl.rows[ii].cells[8].textContent;
                                       if(parseFloat(tt))
                                       { 
                                       totalAmount += parseFloat(tt);
                                       totalAmountPrint=totalAmount.toFixed(2);
                                        }
                                }
    //                              document.getElementById("total").innerHTML='<input type="hidden" value="'+totalAmountPrint+'" name="totalAmount">'+totalAmountPrint;
                              document.getElementById("totalAmt").innerHTML='<input type="hidden" value="'+totalAmountPrint+'" name="totalAmount">'+totalAmountPrint;
                              calFinalTotal();
                    };
                }
            }
            
        }
//      
        function getval(row) {
        var price=row.getElementsByClassName("rs");
        var qnt=row.getElementsByClassName("qnty"); 
        
        price[0].addEventListener("mousewheel", function(evt){ evt.preventDefault(); });
        qnt[0].addEventListener("mousewheel", function(evt){ evt.preventDefault(); });
        
        
        var p=price[0].value;
        var q=qnt[0].value; 
        
        var pr=p*q;
        var newPr=pr.toFixed(2);
        row.cells[8].innerHTML='<input type="hidden" value="'+newPr+'" name="total">'+newPr;
//        row.cells[cLength-7].innerHTML='<input type="hidden" value="'+newPr+'" name="price">'+newPr;
        }


}

function proceedToNext()
{
    var tblDiv = document.getElementById("tableDiv");
    tblDiv.style.border="";
    var tblRows = document.getElementById("itemTable").rows.length;
    if(tblRows<2)
    {
        tblDiv.style.border="2px solid red";
        return false;
    }
    else{
        return true;
    }
}

function calFinalTotal()
{
    var sb = document.getElementById("totalAmt").textContent;
    var d = document.getElementById("discount").value;
    var v = document.getElementById("vat").value;
    
    var pr=sb-(sb*d/100);
    var newPr=pr.toFixed(2);
    var vatA=(newPr*v)/100;
//    alert(sb+" "+newPr+" "+vatA);
    var total= +newPr + +vatA;
    var finalTotal=total.toFixed(2);
    document.getElementById("finalToatl").innerHTML='<input type="hidden" value="'+finalTotal+'" name="finalTotal">'+finalTotal;
}

