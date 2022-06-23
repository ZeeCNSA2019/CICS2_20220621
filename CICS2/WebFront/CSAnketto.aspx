<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CSAnketto.aspx.cs" Inherits="CICS2.WebFront.CSAnketto" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
    <script src="../Scripts/jquery-3.5.1.min.js"></script>
    <link href="../lib/font-awesome/css/all.css" rel="stylesheet" />
    <link href="../Content/font-awesome.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.3.1.js"></script>
    <title></title>
    
    <style>
        .BlueBackgroundButton {
            /*text-align: center;
            border: none;
            font-size: 14px;
            border-radius: 3px;
            /*color: black;*/
            /*letter-spacing: 1px;
            background-color: rgb(232,232,232);*/
            box-sizing: border-box;
            /* Auto layout */
            display: flex;
            flex-direction: row;
            align-items: center;
            padding: 6.5px 32px 6.5px 32px;
            width: 160px;
            height: 32px;
            /* グレー */
            background-color: #A4A4A4;
            /* グレー */
            border: 1px solid #A4A4A4;
            border-radius: 10px;
        }
        @font-face{
            font-family: 'Inter';
            src:url('../fonts/Inter-Regular.ttf')format('truetype')
        }
        .font{
            font-family:Inter;
            font-size:16px;
        }
        .btn_shime {
            text-align: center;
            border: 0.5px solid rgb(232,232,232);
            border-radius: 10px;
            font-size: 14px;
            border-radius: 3px;
            /*color: black;*/
            letter-spacing: 1px;
            padding: 6px 12px 6px 12px;
            background-color: #EFFBFB;
        }

        .modal-dialog {
            width: 400px;
        }

        .tbl_anketto {
            width: 700px;
            border-bottom: 1px solid;
        }

            .tbl_anketto thead, th {
                border-bottom: 1px solid;
            }

            .tbl_anketto tr, td {
                border-bottom: 1px solid rgb(232,232,232);
            }

        .quen {
            display: none;
        }

        .anketocss {
            justify-content: flex-end;
        }

        .checkcenter {
            text-align: left;
        }

        .gv_headers {
            border-bottom: 1px solid black;
        }

        .gv_items {
            vertical-align:middle;
            border-bottom: 1px solid rgb(232,232,232);
        }

        .btngroup {
            height: 50px;
        }

        .btngps {
            text-align: center;
            border: none;
            font-size: 14px;
            border-radius: 8px;
            letter-spacing: 1px;
            /*padding: 6px 12px 6px 12px;*/
            font-size: 10px;
            width: 100px;
            height: 25px;
        }

        .btngpss {
            text-align: center;
            border: none;
            border-radius: 8px;
            letter-spacing: 1px;
            padding: 6px 12px 6px 12px;
            font-weight: bold;
            width: 150px;
            height: 40px;
        }

        .rankRd {
            accent-color: green;
        }

            .rankRd:hover {
                accent-color: yellowgreen;
            }

        .lbl_Hiderankcss {
            display: none;
        }

        .rankcss {
            justify-content: flex-start;
        }

        .rowadd {
            margin-top: 30px;
        }

        .txt_sonotaclass {
            width: 600px;
            height: 200px;
        }

        .gv_footer {
            border-bottom: 0px;
        }

        .jiyutext {
            width: 100%;
        }
        .gv_ankettoclass{
            width:65%;
        }
        .headlabel{
            color: #6E6E6E;
            font-weight:normal;
            line-height:19.36px;
        }
        .ansStyle{
            width:180px;
            height:19px;
            margin-left:13px;
        }
        .categoryClass {
            width: 72px;
            height: 15px;
            font-family: 'Inter';
            font-style: normal;
            font-weight: 400;
            font-size: 12px;
            line-height: 15px;
            /* identical to box height */
            display: flex;
            align-items: center;
            /* グレーブラック */
            color: #6E6E6E;
            border: 0.5px solid #6E6E6E;
            border-radius: 6px;
            padding:8.5px 16px 8.5px 16px;
        }
        .ddclass{
            margin-left:5px;
        }
        @media only screen and (max-width: 768px) {
            .anketocss {
                /*float:unset;*/
                /*justify-content:center;*/
            }

            .rankcss {
                display: flex;
                justify-content: center;
            }

            .lbl_Hiderankcss {
                display: none;
            }
            .gv_ankettoclass {
                width: 100%;
            }
        }
        /*@import url('https://rsms.me/inter/inter.css');
        html {
            font-family: 'Inter', sans-serif;
        }
        @supports (font-variation-settings: normal) {
            html {
                font-family: 'Inter var', sans-serif;
            }
        }*/
        
        @media only screen and (max-width: 500px) {
            .checkcenter {
                text-align: left;
            }

            .qued {
                display: none;
            }

            .quen {
                display: block;
            }

            .modal-dialog {
                width: 300px;
            }

            .tbl_anketto {
                width: 400px;
            }

            .gv_headers {
                display: none;
                border-bottom:0px;
            }

            .lbl_Hiderankcss {
                display: block;
            }

            .txt_sonotaclass {
                width: 250px;
                height: 100px;
            }
            .gv_ankettoclass {
                width: 100%;
            }
        }
    </style>
    <style>
        .rankRd {
            /*-ms-transform: scale(1.5);*/ /* IE 9 
            -webkit-transform: scale(1.5);  Chrome, Safari, Opera 
            transform: scale(1.5);
            background-color: #6E6E6E;*/
            width:25.6%;
            height:25.6%;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#MybtnModal').click(function () {
                $('#Mymodal').modal('show')
            });

            $("[id*=gv_anketto] td").click(function (event) {
                if (event.target.id == "rd1") {
                    $(this).find("input[type=radio]").prop('checked', false);
                    $(this).find("input[id*=rdo_1]").prop('checked', true);
                }
                else if (event.target.id == "rd2") {
                    $(this).find("input[type=radio]").prop('checked', false);
                    $(this).find("input[id*=rdo_2]").prop('checked', true);
                }
                else if (event.target.id == "rd3") {
                    $(this).find("input[type=radio]").prop('checked', false);
                    $(this).find("input[id*=rdo_3]").prop('checked', true);
                }
                else if (event.target.id == "rd4") {
                    $(this).find("input[type=radio]").prop('checked', false);
                    $(this).find("input[id*=rdo_4]").prop('checked', true);
                }
                else if (event.target.id == "rd5") {
                    $(this).find("input[type=radio]").prop('checked', false);
                    $(this).find("input[id*=rdo_5]").prop('checked', true);
                }

            });

            //var type = $("#hdntype").val();
            //if (type == "2") {
            //    $('.type').css("display", "none");
            //} 
            //$('.callhideclass').ready(function () {
            //    function RadioBtnText(x) {
            //        if (x.matches) { // If media query matches                   
            //            document.getElementById("lbl_rak").classList.remove("lbl_Hiderankcss");
            //            //document.getElementsByClassName("unshow")[0].classList.add("lbl_Hiderankcss");

            //        } else {
            //            document.getElementById("lbl_rak").classList.add("lbl_Hiderankcss");
            //            //document.getElementsByClassName("unshow")[0].classList.remove("lbl_Hiderankcss");
            //        }
            //    }
            //    var x = window.matchMedia("(max-width: 400px)")
            //    RadioBtnText(x)
            //    x.addListener(RadioBtnText)
            //});
            //$(function () {
            //    hideclass('.callhideclass');
            //});
            //function hideclass(selector) {
            //    $(selector).fadeIn(function () {
            //        $("#gv_anketto tr td").each(function () {
            //        function RadioBtnText(x) {
            //            if (x.matches) { // If media query matches  
            //                document.getElementById("lbl_rak").classList.remove("lbl_Hiderankcss");
            //                //document.getElementsByClassName("unshow")[0].classList.add("lbl_Hiderankcss");

            //            } else {
            //                document.getElementById("lbl_rak").classList.add("lbl_Hiderankcss");
            //                //document.getElementsByClassName("unshow")[0].classList.remove("lbl_Hiderankcss");
            //            }
            //        }
            //        var x = window.matchMedia("(max-width: 400px)")
            //        RadioBtnText(x)
            //        x.addListener(RadioBtnText)

            //    });
            //    });

            //}
        });

        function rdoans1(chb) {
            $(chb).closest("table tr").find("input:radio").prop("checked", false);
            $(chb).prop("checked", true);
        }
        function rdoans2(chb) {
            $(chb).closest("table tr").find("input:radio").prop("checked", false);
            $(chb).prop("checked", true);
        }
        function rdoans3(chb) {
            $(chb).closest("table tr").find("input:radio").prop("checked", false);
            $(chb).prop("checked", true);
        }
        function rdoans4(chb) {
            $(chb).closest("table tr").find("input:radio").prop("checked", false);
            $(chb).prop("checked", true);
        }
        function rdoans5(chb) {
            $(chb).closest("table tr").find("input:radio").prop("checked", false);
            $(chb).prop("checked", true);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>
        <div class="container-fluid" style="margin-top: 30px;width:1720px;height:232px;background-color:#FFFFFF;">
            <div class="row">
                <div class="col-lg-8">
                    <div class="container-fluid">
                        <div class="row">
                            <nav>
                                <ul class="navbar-nav">
                                    <li class="nav-item" style="list-style-type: none;">
                                        <a class="nav-link" href="#" style="font-weight: bold; color: black; text-decoration: none; margin-left: 20px; font-size: 16px;">アンケート</a>
                                    </li>
                                </ul>
                            </nav>
                            <hr />
                        </div>
                    </div>
                </div>
                <div class="col-lg-4"></div>
            </div>
            <div class="container-fluid">
                            <div class="row ms-0">
                                <label for="inputPassword" class="col-auto col-form-label text-center mt-0 headlabel font">年度</label>
                                <div class="col-auto" style="margin:0px;padding-left:5px;" >
                                    <button id="btn_left" style="font-size: 12px; border: none; background-color: white;width:16px;height:8px;">
                                        <i class="fa fa-angle-left fa-2x" style="border-color:#6E6E6E"></i>
                                    </button>
                                    <asp:DropDownList runat="server" ID="DDL_nendou" CssClass="dropdown-toggle rounded-3 ddclass" Width="80px" Height="30px"></asp:DropDownList>
                                    
                                    <button id="btn_right" style="font-size: 12px; border: none; background-color: white;width:16px;height:8px;">
                                        <i class="fa fa-angle-right fa-2x" style="border-color:#6E6E6E"></i>
                                    </button>
                                </div>
                                <div class="col-auto" style="margin:0px;padding-left:5px;">
                                    <button id="btn_kaileft" style="font-size: 12px; border: none; background-color: white;">
                                        <i class="fa fa-angle-left fa-2x"></i>
                                    </button>
                                    <asp:DropDownList runat="server" ID="DDL_Kai" CssClass="dropdown-toggle rounded-3" Width="80px" Height="30px"></asp:DropDownList>
                                    <button id="btn_kairight" style="font-size: 12px; border: none; background-color: white;">
                                        <i class="fa fa-angle-right fa-2x"></i>
                                    </button>
                                </div>
                                <label for="inputPassword" class="col-auto col-form-label text-center mt-0 headlabel font" style="margin:0px;">回目</label>
                                <label for="date" class="col-auto col-form-label text-center mt-0 headlabel font">(実地日：20220531)</label>
                                <asp:Button ID="btn_copy" runat="server" Text="前回の目をコピー" CssClass="BlueBackgroundButton btn " style="margin-left:15px;" />
                                <%--<asp:Button runat="server" ID="btn_copy" Text="前回の目をコピー" CssClass="BlueBackgroundButton" />--%>
                            </div>
            </div>
            <div class="container-fluid qued">
                <div class="row ms-0 mt-3 mb-3">
                    <label id="lbl_title" class="col-auto headlabel font">採点標準</label>
                </div>
                <label id="lbl_ans1" class="headlabel font ansStyle">1.全く当てはまらない</label>
                    <label id="lbl_ans2" class="headlabel font ansStyle">2.あまり当てはまらない</label>
                    <label id="lbl_ans3" class="headlabel font ansStyle">3.どちらとも言えない</label>
                    <label id="lbl_ans4" class="headlabel font ansStyle">4.おおむね当てはまる</label>
                    <label id="lbl_ans5" class="headlabel font ansStyle">5.大いに当てはまる</label>
            </div>
            
            <div class="container-fluid quen mt-2">
                <%--<asp:Button ID="btn_answer" runat="server" Text="会社への信頼" CssClass="BlueBackgroundButton" data-toggle="modal" data-target="#Mymodal"  />--%>
                <button type="button" id="MybtnModal" class="BlueBackgroundButton">評価基準</button>
                <div class="modal fade" id="Mymodal">
                    <div class="modal-dialog" style="margin-top: 230px; margin-left: 35px;">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="row" style="margin-left: 70px; margin-right: 30px;">
                                            <label id="lbl_ansb1" style="font-size: 12px;">5.大いに当てはまる</label>
                                            <label id="lbl_ansb2" style="font-size: 12px;">4.おおむね当てはまる</label>
                                            <label id="lbl_ansb3" style="font-size: 12px;">3.どちらとも言えない</label>
                                            <label id="lbl_ansb4" style="font-size: 12px;">2.あまり当てはまらない</label>
                                            <label id="lbl_ansb5" style="font-size: 12px;">1.全く当てはまらない</label>
                                        </div>
                                        <div class="row" style="margin-left: 80px; margin-right: 30px; margin-top: 30px;">
                                            <button type="button" style="color: lightgreen; width: 100px;" class="btn_shime" data-bs-dismiss="modal">閉じる</button>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="margin: 25px 20px 10px 30px; overflow: auto;">
            <%--<table id="tb_anketto" runat="server" class="tbl_anketto">
                <thead>
                    <tr>
                        <th>
                            <div class="row">
                                <div class="col-9 col-xs-12 col-sm-12 col-md-8 col-lg-9" ></div>
                                <div class="col-4 col-xs-12 col-sm-12 col-md-4 col-lg-3 d-flex anketocss" >
                                    <asp:Label ID="lbl_h1" runat="server" style="margin:0px 7px 0px 11px">1</asp:Label>
                                    <asp:Label ID="lbl_h2" runat="server" style="margin:0px 7px 0px 11px">2</asp:Label>
                                    <asp:Label ID="lbl_h3" runat="server" style="margin:0px 7px 0px 11px">3</asp:Label>
                                    <asp:Label ID="lbl_h4" runat="server" style="margin:0px 7px 0px 11px">4</asp:Label>
                                    <asp:Label ID="lbl_h5" runat="server" style="margin:0px 7px 0px 11px">5</asp:Label>
                                    
                                </div>
                            </div>
                        </th>
                    </tr>
                    
                </thead>
                <tbody>
                    
                    <tr>
                        <td><asp:Button ID="btn_cat1" runat="server" Text="Category1" CssClass=" BlueBackgroundButton" style="border-radius:8px;margin:4px;padding:2px;" /></td>
                    </tr>
                    <tr>
                        <td>
                            
                        <div class="row" >
                                <div class="col-9 col-xs-12 col-sm-12 col-md-8 col-lg-9" >
                                      この会社では
                                </div>
                                 <div class="col-4 col-xs-12 col-sm-12 col-md-4 col-lg-3 d-flex anketocss text-center" >
                                      <asp:RadioButton ID="RadioButton6" runat="server" style="margin:0px 7px 0px 7px" Text=""/>
                                       <asp:RadioButton ID="RadioButton7" runat="server" style="margin:0px 7px 0px 7px" Text=""/>
                                     <asp:RadioButton ID="RadioButton8" runat="server" style="margin:0px 7px 0px 7px" Text=""/>
                                     <asp:RadioButton ID="RadioButton9" runat="server" style="margin:0px 7px 0px 7px" Text=""/>
                                     <asp:RadioButton ID="RadioButton10" runat="server" style="margin:0px 7px 0px 7px" Text=""/>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:auto">
                            <div class="row" >
                                <div class="col-9 col-xs-12 col-sm-12 col-md-8 col-lg-9" >
                                      この会社ではテスト１２３４５６７８９０１２３４５６７８９０
                                </div>
                                 <div class="col-4 col-xs-12 col-sm-12 col-md-4 col-lg-3 d-flex anketocss" >
                                      <asp:RadioButton ID="rdo_test1" runat="server" style="margin:0px 7px 0px 7px" Text=""/>
                                       <asp:RadioButton ID="rdo_test2" runat="server" style="margin:0px 7px 0px 7px" Text=""/>
                                     <asp:RadioButton ID="rdo_test3" runat="server" style="margin:0px 7px 0px 7px" Text=""/>
                                     <asp:RadioButton ID="rdo_test4" runat="server" style="margin:0px 7px 0px 7px" Text=""/>
                                     <asp:RadioButton ID="rdo_test5" runat="server" style="margin:0px 7px 0px 7px" Text=""/>
                                </div>
                            </div>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="row">
                                <div class="col-9 col-xs-12 col-sm-12 col-md-8 col-lg-9" >
                                </div>
                                <div class="col-4 col-xs-12 col-sm-12 col-md-4 col-lg-3 d-flex anketocss" >
                                      <asp:Label ID="Label1" runat="server" style="margin:0px 7px 0px 11px">1</asp:Label>
                                    <asp:Label ID="Label2" runat="server" style="margin:0px 7px 0px 11px">2</asp:Label>
                                    <asp:Label ID="Label3" runat="server" style="margin:0px 7px 0px 11px">3</asp:Label>
                                    <asp:Label ID="Label4" runat="server" style="margin:0px 7px 0px 11px">4</asp:Label>
                                    <asp:Label ID="Label5" runat="server" style="margin:0px 7px 0px 11px">5</asp:Label>
                                </div>
                            </div>
                            <div class="row" >
                              
                                <div class="col-9 col-xs-12 col-sm-12 col-md-8 col-lg-9" >
                                      この会社ではテスト１２３４５６７８９０
                                </div>
                                
                                 <div class="col-4 col-xs-12 col-sm-12 col-md-4 col-lg-3 d-flex anketocss" >
                                      <asp:RadioButton ID="RadioButton1" runat="server" style="margin:0px 7px 0px 7px" Text=""/>
                                       <asp:RadioButton ID="RadioButton2" runat="server" style="margin:0px 7px 0px 7px" Text=""/>
                                     <asp:RadioButton ID="RadioButton3" runat="server" style="margin:0px 7px 0px 7px" Text=""/>
                                     <asp:RadioButton ID="RadioButton4" runat="server" style="margin:0px 7px 0px 7px" Text=""/>
                                     <asp:RadioButton ID="RadioButton5" runat="server" style="margin:0px 7px 0px 7px" Text=""/>
                                </div>
                            </div>

                        </td>
                    </tr>
                </tbody>
            </table>--%>
            <asp:UpdatePanel runat="server" ID="upd_gvanketto" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:GridView ID="gv_anketto" runat="server" CssClass="gv_ankettoclass" AutoGenerateColumns="false" BorderColor="Transparent" OnDataBound="OnDataBound" OnRowDataBound="gv_anketto_RowDataBound" CellPadding="5">
                        <RowStyle Height="40px"  HorizontalAlign="Center" VerticalAlign="Middle" />
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <div class="row">
                                        <div class="col-9 col-xs-12 col-sm-12 col-md-8 col-lg-9">
                                            <asp:Label ID="lbl_shitsumonsettei" runat="server" CssClass="headlabel font">設問確認</asp:Label>
                                        </div>
                                        <div class="col-4 col-xs-12 col-sm-12 col-md-4 col-lg-3 d-flex ">
                                            <asp:Label ID="lbl_h1" runat="server" CssClass="headlabel font" Style="margin: 0px 18px 0px 0px">1</asp:Label>
                                            <asp:Label ID="lbl_h2" runat="server" CssClass="headlabel font" Style="margin: 0px 15px 0px 14px">2</asp:Label>
                                            <asp:Label ID="lbl_h3" runat="server" CssClass="headlabel font" Style="margin: 0px 10px 0px 16px">3</asp:Label>
                                            <asp:Label ID="lbl_h4" runat="server" CssClass="headlabel font" Style="margin: 0px 10px 0px 18px">4</asp:Label>
                                            <asp:Label ID="lbl_h5" runat="server" CssClass="headlabel font" Style="margin: 0px 11px 0px 20px">5</asp:Label>
                                        </div>
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div class="row checkcenter">
                                        <asp:HiddenField ID="hdntype" Value='<%# Bind("type") %>' runat="server" />
                                        <asp:HiddenField ID="hdnchange" Value='<%# Bind("fchange") %>' runat="server" />
                                        <div class="col-9 col-xs-12 col-sm-12 col-md-8 col-lg-9">
                                            <div class="row">
                                                <div class="col-12">
                                                    <asp:Label ID="lbl_Question" runat="server" CssClass="font" Text='<%# Bind("name") %>' />
                                                </div>
                                                <%--<div class="col-12">
                                            <asp:TextBox runat="server" CssClass="txt_sonotaclass" ID="txt_sonota" Text="テキスト" TextMode="MultiLine"></asp:TextBox>
                                        </div>--%>
                                            </div>

                                        </div>
                                        <div class="col-10 col-xs-12 col-sm-12 col-md-4 col-lg-3 d-flex ">
                                            <div class="row type">
                                                <div class="col-12 rankcss lbl_Hiderankcss text-center" id="lbl_rak">
                                                    <asp:Label ID="Label6" runat="server" CssClass="headlabel font" Style="margin: 0px 0px 0px 28px">1</asp:Label>
                                                    <asp:Label ID="Label7" runat="server" CssClass="headlabel font" Style="margin: 0px 0px 0px 25px">2</asp:Label>
                                                    <asp:Label ID="Label8" runat="server" CssClass="headlabel font" Style="margin: 0px 24px 0px 24px">3</asp:Label>
                                                    <asp:Label ID="Label9" runat="server" CssClass="headlabel font" Style="margin: 0px 25px 0px 0px">4</asp:Label>
                                                    <asp:Label ID="Label10" runat="server" CssClass="headlabel font" Style="margin: 0px 28px 0px 0px">5</asp:Label>

                                                </div>
                                                <div class="col-12 rankcss">
                                                    <div class="row">
                                                        <div id="rd1" class="col-auto" style="padding: 0px 10px 0px 10px!important; width: 36px;height:40px;  background-color: pink;">
                                                            <asp:RadioButton ID="rdo_1" CssClass="rankRd" runat="server" Style="margin: 0px 0px 0px 0px;" Checked='<%# Eval("ans1").ToString() != "1" ? false : true  %>' onclick="rdoans1(this);" />
                                                        </div>
                                                        <div id="rd2" class="col-auto" style="padding: 0 3px 0px 3px!important;">
                                                            <asp:RadioButton ID="rdo_2" CssClass="rankRd" runat="server" Style="margin: 0px 10px 0px 10px;" Checked='<%# Eval("ans1").ToString() != "2" ? false : true  %>' onclick="rdoans2(this);" />
                                                        </div>
                                                        <div id="rd3" class="col-auto" style="padding: 0 3px 0px 3px!important;">
                                                            <asp:RadioButton ID="rdo_3" CssClass="rankRd" runat="server" Style="margin: 0px 10px 0px 10px;" Checked='<%# Eval("ans1").ToString() != "3" ? false : true  %>' onclick="rdoans3(this);" />
                                                        </div>
                                                        <div id="rd4" class="col-auto" style="padding: 0 3px 0px 3px!important;">
                                                            <asp:RadioButton ID="rdo_4" CssClass="rankRd" runat="server" Style="margin: 0px 10px 0px 10px;" Checked='<%# Eval("ans1").ToString() != "4" ? false : true  %>' onclick="rdoans4(this);" />
                                                        </div>
                                                        <div id="rd5" class="col-auto" style="padding: 0 3px 0px 3px!important;">
                                                            <asp:RadioButton ID="rdo_5" CssClass="rankRd" runat="server" Style="margin: 0px 10px 0px 10px;" Checked='<%# Eval("ans1").ToString() != "5" ? false : true  %>' onclick="rdoans5(this);" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <ItemStyle CssClass="gv_items" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <HeaderStyle CssClass="gv_headers" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                </ContentTemplate>
            </asp:UpdatePanel>

        </div>

        <div class="container-fluid">
            <div class="row btngroup" style="background-color: #F3F3F3; margin-top: 20px;">
                <div class="col-auto">
                    <asp:Button ID="btn_cancel" runat="server" Text="キャンセル" CssClass="btngps" Style="background-color: white; color: limegreen; margin-top: 15px;" />
                </div>
                <div class="col-auto">
                    <asp:Button ID="btn_save" runat="server" OnClick="btn_save_Click" CssClass="btngps" Style="background-color: limegreen; color: white; margin-top: 15px;" Text="一時保存" />
                </div>
                <div class="col-sm-4">
                    <asp:Button ID="btn_soushin" runat="server" Text="回答の送信" CssClass="btngpss" OnClick="btn_soushin_Click" Style="background-color: limegreen; color: white; margin-top: 5px;" />
                </div>
            </div>
        </div>
    </form>

</body>
</html>
