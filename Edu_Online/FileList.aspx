<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileList.aspx.cs" Inherits="Edu_Online.FileList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">    
        <div>
            <asp:GridView ID="gvFile" runat="server" AutoGenerateColumns="False" DataKeyNames="FileTitle" OnRowDeleting="gvFile_RowDeleting" ShowHeader="False" ShowHeaderWhenEmpty="True">
                <Columns>
                    <asp:BoundField DataField="FileId" HeaderText="FileId" SortExpression="FileId" />
                    <asp:BoundField DataField="FileName" HeaderText="FileName" SortExpression="FileName" />
                    <asp:BoundField DataField="FileTitle" HeaderText="FileTitle" SortExpression="FileTitle" />
                    <asp:BoundField DataField="FileOfCourseType" HeaderText="FileOfCourseType" SortExpression="FileOfCourseType" />
                    <asp:TemplateField HeaderText="Download">  
                    <ItemTemplate>  
                        <asp:Button ID="btnDownload" runat="server" Text="Download" OnClick="btnDownload_Click" />  
                    </ItemTemplate>  
                </asp:TemplateField>
                    <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EduString %>" SelectCommand="SELECT * FROM [FileInfo]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
