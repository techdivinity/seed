function poupateSubCat()
{
    var cat=document.getElementById("cat").value;
    var url="../SubCatDropPopulate?cat="+cat;  

    if(window.XMLHttpRequest)
    {  request=new XMLHttpRequest();  }  
    else if(window.ActiveXObject)
    {  request=new ActiveXObject("Microsoft.XMLHTTP");  }  

    try
    {  
        request.onreadystatechange=resuilOfPopulateSubCat;  
        request.open("GET",url,true);  
        request.send();  
    }catch(e){alert("Unable to connect to server");}
}
function resuilOfPopulateSubCat()
{
     if(request.readyState==4)
    {  var subcatdrop=document.getElementById("subcat");

        var selected = document.getElementById("cat");
        var selectedText = selected.options[selected.selectedIndex].text;
        var val=request.responseText;
        var v1=new String(val);
        v1=v1.trim();
        var res = v1.split("/");
        subcatdrop.innerHTML='';
        subcatdrop.insertAdjacentHTML('beforeend','<option value="" disabled selected>Select Sub Category From '+selectedText+'</option>');
        for(var i=0;i<res.length-1;i++)
        {
            var vals=res[i].split("-");
            subcatdrop.insertAdjacentHTML('beforeend','<option value="'+vals[0]+'">'+vals[1]+'</option>');
        }
    }  
}

