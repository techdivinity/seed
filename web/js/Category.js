function chkAddSubCatForm()
{
    var subcatbox=document.getElementById("subcat");
    if(subcatbox.value=="")
    {
        subcatbox.style.border="2px solid red";
    }
    else
    {
        subcatbox.style.border='';
        show('two');
        addSubcategory();
    }
}
function addSubcategory()
{
    var cat=document.getElementById("cat").value;
    var subcat=document.getElementById("subcat").value;
    
    var url="../AddSubCategory?cat="+cat+"&subcat="+subcat;  

    if(window.XMLHttpRequest)
    {  request=new XMLHttpRequest();  }  
    else if(window.ActiveXObject)
    {  request=new ActiveXObject("Microsoft.XMLHTTP");  }  

    try
    {  
        request.onreadystatechange=changePerResult;  
        request.open("GET",url,true);  
        request.send();  
    }catch(e){alert("Unable to connect to server");}
}
function changePerResult(){  
    if(request.readyState==4)
    {  
        var val=request.responseText;
        var v1=new String(val);
        v1=v1.trim();
        
        if(v1=="SUCCESS")
        {
                show('three');
        }
        else
        {
                show('four');
        }
    }  
}

function show(id)
{
    if(id=='one'){populateCatBox()}
    document.getElementById("one").style.display='none';
    document.getElementById("two").style.display='none';
    document.getElementById("three").style.display='none';
    document.getElementById("four").style.display='none';
    document.getElementById(id).style.display='block';
}

function populateCatBox()
{
    var url="../CatDropPopulate";  

    if(window.XMLHttpRequest)
    {  request=new XMLHttpRequest();  }  
    else if(window.ActiveXObject)
    {  request=new ActiveXObject("Microsoft.XMLHTTP");  }  

    try
    {  
        request.onreadystatechange=resuilOfPopulateCatBox;  
        request.open("GET",url,true);  
        request.send();  
    }catch(e){alert("Unable to connect to server");}
    
}
function resuilOfPopulateCatBox()
{
     if(request.readyState==4)
    {  var catdrop=document.getElementById("cat");
        var val=request.responseText;
        var v1=new String(val);
        v1=v1.trim();
        var res = v1.split("/");
        catdrop.innerHTML='';
        for(var i=0;i<res.length-1;i++)
        {
            var vals=res[i].split("-");
            catdrop.insertAdjacentHTML('beforeend','<option value="'+vals[0]+'">'+vals[1]+'</option>');
        }
    }  
}




function showCat(id)
{ 
    document.getElementById("oneCat").style.display='none';
    document.getElementById("twoCat").style.display='none';
    document.getElementById("threeCat").style.display='none';
    document.getElementById("fourCat").style.display='none';
    document.getElementById(id).style.display='block';
}

function chkAddCatForm()
{ 
    var catbox=document.getElementById("catBox");
    if(catbox.value=="")
    {
        catbox.style.border="2px solid red";
    }
    else
    {
        catbox.style.border='';
        showCat('twoCat');
        addCategory();
    }
}

function addCategory()
{
    var cat=document.getElementById("catBox").value;
    
    var url="../AddCategory?cat="+cat;  

    if(window.XMLHttpRequest)
    {  request=new XMLHttpRequest();  }  
    else if(window.ActiveXObject)
    {  request=new ActiveXObject("Microsoft.XMLHTTP");  }  

    try
    {  
        request.onreadystatechange=changePerResultOfCat;  
        request.open("GET",url,true);  
        request.send();  
    }catch(e){alert("Unable to connect to server");}
}
function changePerResultOfCat(){  
    if(request.readyState==4)
    {  
        var val=request.responseText;
        var v1=new String(val);
        v1=v1.trim();
        
        if(v1=="SUCCESS")
        {
                showCat('threeCat');
        }
        else
        {
                showCat('fourCat');
        }
    }  
}


