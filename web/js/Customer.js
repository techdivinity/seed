function displyCustInfo()
{
    var custID=document.getElementById("cust").value;
    var url="../ShowCustInfo?custID="+custID;  

    if(window.XMLHttpRequest)
    {  request=new XMLHttpRequest();  }  
    else if(window.ActiveXObject)
    {  request=new ActiveXObject("Microsoft.XMLHTTP");  }  

    try
    {  
        request.onreadystatechange=resuilOfDisplayCustInfo;  
        request.open("GET",url,true);  
        request.send();  
    }catch(e){alert("Unable to connect to server");}
}
function resuilOfDisplayCustInfo()
{
     if(request.readyState==4)
     {
        var val=request.responseText;
        var v1=new String(val);
        v1=v1.trim();
        var res = v1.split("/");
        document.getElementById("custName").innerHTML=res[0]+" "+res[1];
        document.getElementById("custAdd").innerHTML=res[2];
        document.getElementById("custCity").innerHTML=res[3];
        document.getElementById("custTIN").innerHTML=res[4];
        document.getElementById("custCST").innerHTML=res[5];

    }  
}


function showCustomItems()
{ 
    var subCatID=document.getElementById("subcat").value;
    var url="../ShowCustomItems?ID="+subCatID+"&type=subCat";  

    if(window.XMLHttpRequest)
    {  request=new XMLHttpRequest();  }  
    else if(window.ActiveXObject)
    {  request=new ActiveXObject("Microsoft.XMLHTTP");  }  

    try
    {  
        request.onreadystatechange=resuilOfShowCustomItems;  
        request.open("GET",url,true);  
        request.send();  
    }catch(e){alert("Unable to connect to server");}
}
function resuilOfShowCustomItems()
{
     if(request.readyState==4)
     {
        var items=document.getElementById("itemsArea");
        var val=request.responseText;
        var v1=new String(val);
        v1=v1.trim();
        items.innerHTML='';
        if(v1=="")
        {
            items.innerHTML='<font color="red">No Items For This Criteria.</font>';
        }
        else
        {
            var res = v1.split("/");
            for(var i=0;i<res.length-1;i++)
            {
                var vals=res[i].split("~");
                items.insertAdjacentHTML('beforeend','<a  style="cursor:pointer" onclick="addItemToInvoice(\''+vals[0]+'\')" >'+vals[1]+'</a><br>');
            }
        }
        

    }  
}

function clrArea()
{
    document.getElementById("itemsArea").innerHTML='';
}

function addItemToInvoice(itemID)
{
    
    var url="../ShowCustomItems?ID="+itemID+"&type=item";  
    
    if(window.XMLHttpRequest)
    {  request=new XMLHttpRequest();  }  
    else if(window.ActiveXObject)
    {  request=new ActiveXObject("Microsoft.XMLHTTP");  }  

    try
    {  
        request.onreadystatechange=resultOFAddItemToInvoice;  
        request.open("GET",url,true);  
        request.send();  
    }catch(e){alert("Unable to connect to server");}
}

function resultOFAddItemToInvoice()
{
    if(request.readyState==4)
     {
        var table = document.getElementById("itemTable");
        var rowCount = table.rows.length;
        var val=request.responseText;
        var v1=new String(val);
        v1=v1.trim();
        var res = v1.split("~");
        var row = table.insertRow(rowCount);
        
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        var cell3 = row.insertCell(2);
        var cell4 = row.insertCell(3);
        var cell5 = row.insertCell(4);
        var cell6 = row.insertCell(5);
        var cell7 = row.insertCell(6);
        var cell8 = row.insertCell(7);
        var cell9 = row.insertCell(8);
        var cell10 = row.insertCell(9);
        
        cell1.innerHTML = rowCount;
        cell2.innerHTML = res[1]+'<input type="hidden" name="itemID" value="'+res[0]+'"/>';
        cell3.innerHTML = res[2];
        cell4.innerHTML = res[3];
        cell5.innerHTML = res[4];
        cell6.innerHTML = res[5];
        cell7.innerHTML = '<input type="number" name="price"  class="rs" step="0.01" required>';
        cell8.innerHTML = '<input type="number" name="qnty" class="qnty"  required>';
        cell9.innerHTML = '';
        cell10.innerHTML = '<a style="cursor:pointer" onclick="deleteRow(this)"><img src="../icon/delete.png"/></a>';
     
    }  
}
function deleteRow(o)
{
    var v=o.parentNode.parentNode.rowIndex;
    var table = document.getElementById("itemTable");
        table.deleteRow(v);
         index();
}
function index()
{
    var table = document.getElementById("itemTable");  
    var rowCount = table.rows.length;
    var sno=0;
    for(var i=1;i<rowCount;i++)
    {
            table.rows[i].cells[0].innerHTML= ++sno;
    }
    
}