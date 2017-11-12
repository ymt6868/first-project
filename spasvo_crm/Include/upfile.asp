<%OPTION EXPLICIT%>
<%Server.ScriptTimeOut=5000%>
<!--#include FILE="upload_5xsoft.inc"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>文件上传</title>
</head>
<body>
<%
''将当前的日期和时间转为文件名
function makefilename()
  dim fname
  fname = now()
  fname = trim(fname)
  fname = replace(fname,"-","")
  fname = replace(fname,"/","")
  fname = replace(fname," ","") 
  fname = replace(fname,":","")
  fname = replace(fname,"PM","")
  fname = replace(fname,"AM","")
  fname = replace(fname,"上午","")
  fname = replace(fname,"下午","")
  makefilename=fname
end function 

dim upload,file,formName,formPath
dim i,l,fileType,newfilename,filenamelist
'创建新文件名称
newfilename = makefilename()
'建立上传对象
set upload=new upload_5xsoft 
'上传文件目录
formPath = Server.mappath("../ClientFile/uploadfile")&"/"
'列出所有上传了的文件
for each formName in upload.File
 '生成一个文件对象
 set file=upload.file(formName)  
 '如果 FileSize > 0 说明有文件数据
 if file.FileSize>0 then
  '取得文件扩展名      
  fileType = file.FileName '文件名以及扩展名
  i = instr(fileType,".")  '是否存在“.”
  l = Len(fileType)  
  if i>0 then
    fileType = Right(fileType,l-i+1) '得到扩展名
  end if
  if file.FileSize>(1024*1024*5) then
  	response.write"<SCRIPT language=JavaScript>alert('文件太大!不能大于1M');"
	response.write"this.location.href='upload.htm';</SCRIPT>" 
  else
	newfilename = newfilename & fileType
	filenamelist = formPath&newfilename  '新文件绝对地址和名称
	file.SaveAs filenamelist
  end if 
 end if
 set file=nothing
next
%>
<script language="javascript">
	parent.AddItem("<%=newfilename%>"); 
</script>
<%
set upload=nothing  ''删除此对象
response.Write("<script language='javascript'>this.location.href='upload.htm';</script>")
%>
</body>
</html>