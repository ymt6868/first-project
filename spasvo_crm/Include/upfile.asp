<%OPTION EXPLICIT%>
<%Server.ScriptTimeOut=5000%>
<!--#include FILE="upload_5xsoft.inc"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ļ��ϴ�</title>
</head>
<body>
<%
''����ǰ�����ں�ʱ��תΪ�ļ���
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
  fname = replace(fname,"����","")
  fname = replace(fname,"����","")
  makefilename=fname
end function 

dim upload,file,formName,formPath
dim i,l,fileType,newfilename,filenamelist
'�������ļ�����
newfilename = makefilename()
'�����ϴ�����
set upload=new upload_5xsoft 
'�ϴ��ļ�Ŀ¼
formPath = Server.mappath("../ClientFile/uploadfile")&"/"
'�г������ϴ��˵��ļ�
for each formName in upload.File
 '����һ���ļ�����
 set file=upload.file(formName)  
 '��� FileSize > 0 ˵�����ļ�����
 if file.FileSize>0 then
  'ȡ���ļ���չ��      
  fileType = file.FileName '�ļ����Լ���չ��
  i = instr(fileType,".")  '�Ƿ���ڡ�.��
  l = Len(fileType)  
  if i>0 then
    fileType = Right(fileType,l-i+1) '�õ���չ��
  end if
  if file.FileSize>(1024*1024*5) then
  	response.write"<SCRIPT language=JavaScript>alert('�ļ�̫��!���ܴ���1M');"
	response.write"this.location.href='upload.htm';</SCRIPT>" 
  else
	newfilename = newfilename & fileType
	filenamelist = formPath&newfilename  '���ļ����Ե�ַ������
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
set upload=nothing  ''ɾ���˶���
response.Write("<script language='javascript'>this.location.href='upload.htm';</script>")
%>
</body>
</html>