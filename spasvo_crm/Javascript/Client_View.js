	document.write("<Div id='_alt' style='position:absolute;visibility:hidden;left:77px;top:96px;background-color:#FF0000;color:000000;font-size:12px;line-height:25px;'><table cellspacing=1 cellpadding=1 ><tr bgcolor='#FFCC66'><td ></td></tr></table></DIV>");
	
	function ShowLayer(obj,iLength)
	{
		if(document.all("_alt").style.visibility!="visible")
		{
			if(getStrLength(obj.sValue) > iLength)
			{
				var iX=event.clientX;
				var iY=event.clientY+document.body.scrollTop;
		
				var _oTD=document.all("_alt");
				while(_oTD.tagName!="TD") _oTD=_oTD.firstChild;
				_oTD.innerHTML=obj.sValue;
				
				
				
				if(iX + 15 + document.all("_alt").offsetWidth>document.body.clientWidth)
					if(iX  - 15 - document.all("_alt").offsetWidth<=0)
						document.all("_alt").style.left = 1;
					else
						document.all("_alt").style.left = iX  - 15 - document.all("_alt").offsetWidth;
					
				else
					document.all("_alt").style.left = iX + 15;
				if((Number(document.all("_alt").offsetHeight)+iY +15)>document.body.clientHeight+document.body.scrollTop)
				{
					document.all("_alt").style.top=iY-document.all("_alt").offsetHeight;
				}else
				document.all("_alt").style.top = iY +15;
				document.all("_alt").style.visibility="visible";
				}
		}
	}
 
	
	
	function getStrLength(sValue)
	{
		var j=0; 
   		 for (i = 0; i< sValue.length; i++) {      
    			 if (sValue.charCodeAt(i) > 127 ) { 
       				 j=j+2;   
        		 } 	
     			else { 
       				 j=j+1 
     			} 
		}
 
		return j;  
    	 } 
    	 
    	  function formatStr(sValue,iLength)
    	 {
    	 	
    	 	if(getStrLength(sValue)>Number(iLength))
    	 		return sValue.substring(1,iLength-3) + "...";
    	 	else
    	 	return sValue;
    	 }
    	 
	function HidderLayer()
	{
		document.all("_alt").style.visibility="hidden";
	}
	
		function FormatStr(sValue,iLength)
		{
			if(iLength<sValue.length) return sValue.substring(0,iLength-3)+"...";
			else return sValue;
		}