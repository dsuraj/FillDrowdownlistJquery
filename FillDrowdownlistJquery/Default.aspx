<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FillDrowdownlistJquery.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="ddlRecords" runat="server" ClientIDMode="Static"></asp:DropDownList>
            <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
            <script type="text/javascript">
                $(document).ready(function () {

                    //fill dropdownlist
                    $.ajax({
                        type: "POST",
                        url: "Default.aspx/GetResultset",
                        data: "{}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            $.each(jQuery.parseJSON(data.d), function () {
                                $("#ddlRecords").append($("<option></option>").val(this['EmployeeID']).html(this['Name']));
                            });
                        },
                        error: function (msg) {
                            //error
                        }
                    });

                });
            </script>
        </div>
    </form>
</body>
</html>
