
function Client_add()
{
	if (document.getElementById("Client_Company").value=="")
	{
			alert("单位名称不能为空!");
			return false;
		}
	else
	{
		var ClientCompany = document.getElementById("Client_Company").value;
		if(ClientCompany!="")
		{
			var url = "../Include/Dataset.asp?SQL=" + escape(ClientCompany);
			var XMLDoc=new ActiveXObject("MSXML");	
			XMLDoc.url=url;
			var XMLRoot=XMLDoc.root;
			if (XMLRoot.children.item("SUCCESS").text == "YES")
			{
				var name = XMLRoot.children.item("name").text;
				alert("客户冲突！请检索后再添加！");
				return false;
			}		
		}	
	}
}

function Client_Company_Check()
{
	var ClientCompany = document.getElementById("Client_Company").value;
	if(ClientCompany!="")
	{
		var url = "../Include/Dataset.asp?SQL=" + escape(ClientCompany);
		var XMLDoc=new ActiveXObject("MSXML");	
		XMLDoc.url=url;
		var XMLRoot=XMLDoc.root;
		if (XMLRoot.children.item("SUCCESS").text == "YES")
		{
			var name = XMLRoot.children.item("name").text;
			alert("客户冲突！请检索后再添加！");
		}		
	}
}

function Client_Check()
{
	var ClientCompany = document.getElementById("Client_Company").value;
	window.open('Client_Check.asp?Client_Company='+ClientCompany,'检索客户','toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=400,height=400');
}

function Waiting()
{
	document.getElementById("floater").style.display="block";
	document.getElementById("floater").style.width=document.body.clientWidth;
	document.getElementById("floater").style.height=document.body.clientHeight;
}