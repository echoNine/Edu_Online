<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoingPage.aspx.cs" Inherits="Edu_Online.DoingPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <title>练习ing</title>
    <style>
        .content {
            width: 50%;
            background-color: #fbfbfb;
            margin: 2% auto;
            border: 2px solid #cccccc;
            border-radius: 8px;
            box-shadow: 2px 2px #cccccc;
            height: 590px;
            overflow: auto;
        }

        .Name {
            margin: 45%;
            line-height: 100px;
            font-size: 24px;
            font-weight: bold;
            color: #4c4c4c;
        }

        .SingleTitle, .JudgeTitle {
            margin-left: 6%;
            font-size: 16px;
            color: #464646;
            font-weight: bold;
            line-height: 40px;
        }

        .SingleItem, .JudgeItem {
            margin-left: 74px;
            margin-bottom: 10px;
        }

        .quesContent {
            line-height: 50px;
            border-left: 5px solid #3bb7ef;
            padding-bottom: 4px;
            padding-left: 10px;
        }

        .itemT {
            line-height: 30px;
        }

        .itemF {
            margin-left: 40px;
            line-height: 30px;
        }

        .submitBtn {
            padding: 8px 16px;
            font-size: 15px;
            color: white;
            border-radius: 5px;
            font-weight: bold;
            background-color: gray;
            position: absolute;
            right: 27%;
            bottom: 10%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="content" class="content">
            <asp:Label ID="Name" runat="server" CssClass="Name" />
            <asp:Label ID="SingleTitle" runat="server" CssClass="SingleTitle" Text="一、单选题" /><br />
            <asp:DataList ID="singleList" runat="server">
                <ItemTemplate>
                    <asp:Panel ID="SingleItem" runat="server" CssClass="SingleItem">
                        <asp:Label Text='<%# Eval("quesContent") %>' data-id='<%# Eval("quesId") %>' runat="server" ID="quesContent" CssClass="quesContent" /><br />
                        <input id="singleItemA" type="radio" runat="server" name="single" value='A' class="itemT" /><%# Eval("A") %>
                        <input id="singleItemB" type="radio" runat="server" name="single" value='B' class="itemF" /><%# Eval("B") %>
                        <input id="singleItemC" type="radio" runat="server" name="single" value='C' class="itemF" /><%# Eval("C") %>
                        <input id="singleItemD" type="radio" runat="server" name="single" value='D' class="itemF" /><%# Eval("D") %>
                    </asp:Panel>
                </ItemTemplate>
            </asp:DataList><br />
            <asp:Label ID="JudgeTitle" runat="server" CssClass="JudgeTitle" Text="二、判断题" /><br />
            <asp:DataList ID="judgeList" runat="server">
                <ItemTemplate>
                    <asp:Panel ID="JudgeItem" runat="server" CssClass="JudgeItem">
                        <asp:Label Text='<%# Eval("quesContent") %>' data-id='<%# Eval("quesId") %>' runat="server" ID="quesContent" CssClass="quesContent" /><br />
                        <input id="judgeItemT" type="radio" runat="server" name="judge" value="正确" class="itemT" />&nbsp;正确
                        <input id="judgeItemF" type="radio" runat="server" name="judge" value="错误" class="itemF" />&nbsp;错误
                    </asp:Panel>
                </ItemTemplate>
            </asp:DataList><br />
            <input id="submit" type="button" value="提交" onclick="Done()" class="submitBtn" />
        </div>
    </form>
</body>
<script>
    function Done() {
        var list = { single: [], judge: [] };
        var singleList = $("#singleList tbody").children();
        for (let i = 0; i < singleList.length; i++) {
            let quesId = singleList.children().children().children()[0].getAttribute("data-id");
            let answer = $(singleList[i]).find('input:checked').val();
            list.single.push({ "quesId": quesId, "answer": answer })
        }

        var judgeList = $("#judgeList tbody").children();
        for (let i = 0; i < judgeList.length; i++) {
            let quesId = judgeList.children().children().children()[0].getAttribute("data-id");
            let answer = $(judgeList[i]).children().find('input:checked').val();
            list.judge.push({ "quesId": quesId, "answer": answer })
        }

        $.ajax({
            type: "post",
            url: "DoingPage.aspx/SubmitResult",
            dataType: "json",
            contentType: "application/json",
            data: JSON.stringify(list),
            success: function (result) {
                alert("提交成功，您的得分为" + result.d + "分");
            }
        });
    }
</script>
</html>
