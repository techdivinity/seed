function showCustomItemsInAllProduct()
{ 
    var subCatID=document.getElementById("subcat").value;
    var url="../ShowCustomItems?ID="+subCatID+"&type=subCat";  

    if(window.XMLHttpRequest)
    {  request=new XMLHttpRequest();  }  
    else if(window.ActiveXObject)
    {  request=new ActiveXObject("Microsoft.XMLHTTP");  }  

    try
    {  
        request.onreadystatechange=resultOfshowCustomItemsInAllProduct;  
        request.open("GET",url,true);  
        request.send();  
    }catch(e){alert("Unable to connect to server");}
}
function resultOfshowCustomItemsInAllProduct()
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
                items.insertAdjacentHTML('beforeend',"<a  style=\"cursor:pointer\" onclick=\"window.open('editItem.jsp?i="+vals[0]+"', 'newwindow', 'scrollbars=yes, width='+($(window).width()-($(window).width()*0.1))+', height='+($(window).height()-($(window).height()*0.1))+',top='+$(window).height()*0.05+',left='+$(window).width()*0.05+''); return false;\" >"+vals[1]+'</a><br>');
            }
        }
        

    }  
}
function chkEditItemForm()
{
    var go=true;
    var mfg =document.getElementById("popup_container");
    var exp =document.getElementById("popup_container1");
    if(mfg.value=="")
    {
        mfg.style.border='2px solid red';
        go=false
    }
    else
    {
        mfg.style.border='';
    }
    if(exp.value=="")
    {
        exp.style.border='2px solid red';
        go=false
    }
    else
    {
        exp.style.border='';
    }
    return go;
}