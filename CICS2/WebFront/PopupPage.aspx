<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PopupPage.aspx.cs" Inherits="CICS2.WebFront.PopupPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
    <%--<link href="../lib/font-awesome/css/all.css" rel="stylesheet" />--%>
    <link href="../Content/font-awesome.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row align-content-center">
                <label id="lbl_ans1" class="col-auto">1.全く当てはまらない</label>
                <label id="lbl_ans2" class="col-auto">2.あまり当てはまらない</label>
                <label id="lbl_ans3" class="col-auto">3.どちらとも言えない</label>
                <label id="lbl_ans4" class="col-auto">4.おおむね当てはまる</label>
                <label id="lbl_ans5" class="col-auto">5.大いに当てはまる</label>
            </div>
        </div>
    </form>
</body>
</html>
