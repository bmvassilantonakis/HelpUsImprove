<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Answers.ascx.cs" Inherits="PWGR.Modules.HelpUsImprove.Answers" %>

<script src="https://www.google.com/recaptcha/api.js" async defer></script>

<div class="container">
    <div class="row">
        <div class="col-12 text-white" style="background-color: #6095C7;">
            <h6 class="text-white">
                <asp:Label ID="ImprovementSuggestionsLabel" runat="server" Text="Improvement Suggestions"></asp:Label>
            </h6>
        </div>
    </div>
    <br />
    <br />
    <div class="row">
        <div id="SuggestionsData" class="col-12"></div>
    </div>
</div>

<script>
    var portalId = <%= PortalId %>;
    var tabId = <%= TabId %>;
    var moduleId = <%= ModuleId %>;
    var tabModuleId = <%= TabModuleId %>;
    var userInfoUserID = <%= UserInfo.UserID %>;
    var userInfoUsername = '<%= UserInfo.Username %>';
    var serviceID = 0;
    var returnURL;
    var sf = $.ServicesFramework(<%:ModuleContext.ModuleId%>);
</script>

<script type="text/javascript">
    //https://developers.google.com/recaptcha/docs/display?refresh=1
    //<div class="g-recaptcha" data-sitekey="6LfOF7IUAAAAAKHpsN18BkrhDH8p6xWH-rXLwCzF"></div>
    //<div class="g-recaptcha" data-sitekey="6Le4QLIUAAAAAIjhlIUDbUvDUESvX_sdLSl4WoAe"></div>

    $(function () {
        getHuIData()
    });
</script>

<script>

</script>

<script>
    function getHuIData() {
        //"/DesktopModules/CERTHHITEvents/API/HITEventsWS/GetEvents?ModuleID=" + moduleId, GetEventsByModule
        $.getJSON(
            "/DesktopModules/HelpUsImprove/API/HelpUsImproveWS/GetHUIData",
            function (result) {
                huiJSONObject = jQuery.parseJSON(result);

                //console.log(huiJSONObject);

                LoadSuggestions(huiJSONObject);
            }
        );
    }

    function IntToString(intValue) {
        var rValue = intValue.toString();

        if (intValue < 10) {
            rValue = '0' + intValue.toString();
        }

        return rValue;
    }

    function formatJSONDate(jsonDate, returnTime) {
        var newDate = new Date(parseInt(jsonDate.replace('/Date(', '').replace(')/', '')));//new Date(parseInt(jsonDate)); //dateFormat(jsonDate, "mm/dd/yyyy");

        var rDate = IntToString(newDate.getDate()) + '/' + IntToString(newDate.getMonth() + 1) + '/' + newDate.getFullYear();

        if (returnTime == true) {
            rDate = rDate + ' ' + IntToString(newDate.getHours()) + ":" + IntToString(newDate.getMinutes()) + ":" + '00';
        }

        return rDate;
    }

    function DateToString(cdate, returnTime) {
        var y = cdate.getFullYear();
        var m = intToString(cdate.getMonth() + 1);
        var d = intToString(cdate.getDate());
        var hh = intToString(cdate.getHours());
        var mm = intToString(cdate.getMinutes());
        var ss = intToString(cdate.getSeconds());

        var cdt = d + '.' + m + '.' + y;

        if (returnTime == true) {
            var cdt = d + '.' + m + '.' + y + ' | ' + hh + ":" + mm + ":" + '00';
        }

        return cdt;
    }

    function LoadSuggestions(HUIData) {
        $('#SuggestionsData').html('');

        if (HUIData.length > 0) {
            var tableGroup = document.createElement("table");
            tableGroup.id = "tableGroup";
            tableGroup.setAttribute("class", "table table-hovered table-stripe");

            var tableTHead = document.createElement("thead");
            tableTHead.id = "tableTHead";

            var tableTHeadTR = document.createElement("tr");
            tableTHeadTR.id = "tableTHeadTR";

            var tableTHeadTRTH1 = document.createElement("th");
            tableTHeadTRTH1.id = "tableTHeadTRTH1";
            tableTHeadTRTH1.setAttribute("class", "text-center align-middle");
            tableTHeadTRTH1.innerHTML = '#';
            tableTHeadTR.appendChild(tableTHeadTRTH1);

            var tableTHeadTRTH2 = document.createElement("th");
            tableTHeadTRTH2.id = "tableTHeadTRTH2";
            tableTHeadTRTH2.setAttribute("class", "text-center align-middle");
            tableTHeadTRTH2.innerHTML = 'Found';
            tableTHeadTR.appendChild(tableTHeadTRTH2);

            var tableTHeadTRTH3 = document.createElement("th");
            tableTHeadTRTH3.id = "tableTHeadTRTH3";
            tableTHeadTRTH3.innerHTML = 'Looking for';
            tableTHeadTR.appendChild(tableTHeadTRTH3);

            var tableTHeadTRTH4 = document.createElement("th");
            tableTHeadTRTH4.id = "tableTHeadTRTH4";
            tableTHeadTRTH4.setAttribute("class", "text-center");
            tableTHeadTRTH4.innerHTML = 'Suggestions';
            tableTHeadTR.appendChild(tableTHeadTRTH4);

            var tableTHeadTRTH5 = document.createElement("th");
            tableTHeadTRTH5.id = "tableTHeadTRTH5";
            tableTHeadTRTH5.setAttribute("class", "text-center align-middle");
            tableTHeadTRTH5.innerHTML = 'Date & Time';
            tableTHeadTR.appendChild(tableTHeadTRTH5);

            tableTHead.appendChild(tableTHeadTR);

            tableGroup.appendChild(tableTHead);

            var tableTBody = document.createElement("tbody");
            tableTBody.id = "tableTBody";

            for (var i = 0; i < HUIData.length; i++) {
                var tableTBodyTR = document.createElement("tr");
                tableTBodyTR.id = "tableTBodyTR" + i;

                var tableTBodyTRTD1 = document.createElement("td");
                tableTBodyTRTD1.id = "tableTBodyTRTD1" + i;
                tableTBodyTRTD1.innerHTML = (i + 1);
                tableTBodyTRTD1.setAttribute("class", "text-center align-middle");
                tableTBodyTR.appendChild(tableTBodyTRTD1);

                var tableTBodyTRTD2 = document.createElement("td");
                tableTBodyTRTD2.id = "tableTBodyTRTD2" + i;
                tableTBodyTRTD2.setAttribute("class", "text-center align-middle");

                var DivCardBodyA = document.createElement("input");
                DivCardBodyA.id = "DivCardBodyP" + i;
                DivCardBodyA.setAttribute("type", "checkbox");
                DivCardBodyA.setAttribute("disabled", "disabled");
                if (HUIData[i].Found == true) {
                    DivCardBodyA.setAttribute("checked", "checked");
                }
                tableTBodyTRTD2.appendChild(DivCardBodyA);

                tableTBodyTR.appendChild(tableTBodyTRTD2);

                var tableTBodyTRTD3 = document.createElement("td");
                tableTBodyTRTD3.id = "tableTBodyTRTD3" + i;
                tableTBodyTRTD3.setAttribute("class", "align-middle");
                var lf = '';
                if (HUIData[i].LookingFor != '') { lf = HUIData[i].LookingFor; }
                tableTBodyTRTD3.innerHTML = lf;
                tableTBodyTR.appendChild(tableTBodyTRTD3);

                var tableTBodyTRTD4 = document.createElement("td");
                tableTBodyTRTD4.id = "tableTBodyTRTD4" + i;
                tableTBodyTRTD4.setAttribute("class", "text-center align-middle");
                var sg = '';
                if (HUIData[i].Suggestions != 'NULL') { sg = HUIData[i].Suggestions; }
                tableTBodyTRTD4.innerHTML = sg;
                tableTBodyTR.appendChild(tableTBodyTRTD4);

                var tableTBodyTRTD5 = document.createElement("td");
                tableTBodyTRTD5.id = "tableTBodyTRTD5" + i;
                tableTBodyTRTD5.setAttribute("class", "text-center align-middle");
                var dt = '';
                if (HUIData[i].HUIDateTime != 'NULL') { dt = formatJSONDate(HUIData[i].HUIDateTime, true); }
                tableTBodyTRTD5.innerHTML = dt;
                tableTBodyTR.appendChild(tableTBodyTRTD5);

                tableTBody.appendChild(tableTBodyTR);
            }

            tableGroup.appendChild(tableTBody);

            SuggestionsData.appendChild(tableGroup);
        }
    }
</script>
