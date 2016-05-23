function calculate()
{
//    document.getElementById("table1Msg").focus();
    
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
        row.cells[8].innerHTML='<input type="hidden" value="'+newPr+'" name="disAmount">'+newPr;
//        row.cells[cLength-7].innerHTML='<input type="hidden" value="'+newPr+'" name="price">'+newPr;
        
//        var taxCst=(newPr*c)/100;
//        //taxCst=taxCst.toFixed(2);
//        var taxVat=(newPr*v)/100;
//        //taxVat=taxVat.toFixed(2);
//        var taxOther=(newPr*o)/100;
//        //taxOther=taxOther.toFixed(2);
//        
//        var totalTax1=taxCst+taxVat+taxOther;
//        var totalTax=totalTax1.toFixed(2);
        
//        var taxRs=(pr*t)/100;
//        var total=pr+((pr*t)/100);
//        total=total.toFixed(2);
//        taxRs=taxRs.toFixed(2);
//        row.cells[cLength-3].innerHTML='<input type="hidden" value="'+totalTax+'" name="taxprice">'+totalTax;
//        var total1=pr+totalTax1;
//        var total=total1.toFixed(2);
//        row.cells[cLength-2].innerHTML='<input type="hidden" value="'+total+'" name="totalPrice">'+total;
//        
//        var grossTotal= total*q;
//        grossTotal=grossTotal.toFixed(2);
//        row.cells[cLength-1].innerHTML='<input type="hidden" value="'+grossTotal+'" name="grossTotal">'+grossTotal;
         }


}

