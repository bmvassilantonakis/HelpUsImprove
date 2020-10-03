<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="PWGR.Modules.HelpUsImprove.View" %>

<script src="https://www.google.com/recaptcha/api.js" async defer></script>

<div class="container">
    <div class="row">
        <div class="col-12 text-white" style="background-color: #6095C7;">
            <h6 class="text-white">
                <asp:Label ID="HelpUsImproveTitleLabel" runat="server" Text="Help Us Improve !!!"></asp:Label>
            </h6>
        </div>
    </div>
    <br />
    <br />
    <div class="row">
        <div class="col-12">
            <b>
                <asp:Label ID="DidyoufindwhatyouwerelookingforLabel" runat="server" Text="Did you find what you were looking for?"></asp:Label> <span class="text-warning">*</span>
            </b>
        </div>
        <div class="col-12">
            <select id="FoundLookingForSelect" class="form-control" onchange="FoundLookingForChange(this);" required>
                <option value="-1"> - Select - </option>
                <option value="1">Yes</option>
                <option value="0">No</option>
            </select>
        </div>
    </div>
    <div id="DidntFoundLookingFor" class="row">
        <div class="col-12">
            <br />
            <b>
                <asp:Label ID="WhatwereyoulookingforLabel" runat="server" Text="What were you looking for?"></asp:Label> <span class="text-warning">*</span>
            </b>
            <input id="WhatWereYouLookingForTextBox" type="text" class="form-control" />
            <b>
                <asp:Label ID="SuggestionsLabel" runat="server" Text="Suggestions"></asp:Label>
            </b>
            <textarea id="SuggestionsTextBox" class="form-control" rows="12"></textarea>
            <br />
        </div>
    </div>
    <div class="row">
        <div id="CAPTCHASubmit" class="col-12">
            <br />
            <div id="GoogleReCAPTCHA" class="g-recaptcha" data-callback="recaptcha_callback"></div><%-- data-sitekey="6LfOF7IUAAAAAKHpsN18BkrhDH8p6xWH-rXLwCzF"--%>
            <br />
            <button id="btnAddItem" class="btn btn-info" disabled="disabled" style="background-color: #6095C7;" onclick="return btnAddItemClick();">
                <asp:Label ID="SubmitLabel" runat="server" Text="Submit"></asp:Label>                
            </button>
        </div>
    </div>
</div>

<script>
    var portalId = <%= PortalId %>;
    var tabId = <%= TabId %>;
    var moduleId = <%= ModuleId %>;
    var tabModuleId = <%= TabModuleId %>;
    var userInfoUserID = <%= UserInfo.UserID %>;
    var userInfoUsername = '<%= UserInfo.Username %>';
    var HUIMailTo;
    var HUIMailFrom;
    var HUIreCAPTCHASiteKey;
    var HUIreCAPTCHASecretKey;
    var PortalURL;
    var serviceID = 0;
    var returnURL;
    var sf = $.ServicesFramework(<%:ModuleContext.ModuleId%>);

</script>

<script type="text/javascript">
    //https://developers.google.com/recaptcha/docs/display?refresh=1
    //<div class="g-recaptcha" data-sitekey="6LfOF7IUAAAAAKHpsN18BkrhDH8p6xWH-rXLwCzF"></div>http://www.euparking.imet.gr
    //<div class="g-recaptcha" data-sitekey="6Le4QLIUAAAAAIjhlIUDbUvDUESvX_sdLSl4WoAe"></div>http://www.euparking.hitportal.eu

    $(function () {
        document.getElementById('DidntFoundLookingFor').style.display = 'none';

        document.getElementById('GoogleReCAPTCHA').setAttribute('data-sitekey', HUIreCAPTCHASiteKey);
    });

    var onloadCallback = function () {
        alert("grecaptcha is ready!");
    };

    function recaptcha_callback() {
        $('#btnAddItem').removeAttr('disabled');
    }; 

    function FoundLookingForChange(ctrl) {
        var act = ctrl.value;

        if (act == 0) {
            document.getElementById('DidntFoundLookingFor').style.display = 'block';
        } else {
            document.getElementById('DidntFoundLookingFor').style.display = 'none';
        }
    }
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
            }
        );
    }

    function btnAddItemClick() {
        if (document.getElementById('FoundLookingForSelect').value == -1) {
            alert('Please Select whether you found what you were lookinh for');
            return false;
        }

        var found = false;
        if (document.getElementById('FoundLookingForSelect').value == 1) {
            found = true
        }

        var foundLookingFor = found;//$('#FoundLookingForSelect').val();
        var whatWereYouLookingFor = $('#WhatWereYouLookingForTextBox').val();
        var suggestionsTextBox = $('#SuggestionsTextBox').val();

        var CreatedBy = '';
        var CreatedUserID = userInfoUserID;
        var ModifiedBy = '';
        var ModifiedUserID = userInfoUserID;

        if (userInfoUserID > -1) {
            CreatedBy = userInfoUsername;
            CreatedUserID = userInfoUserID;
            ModifiedBy = userInfoUsername;
            ModifiedUserID = userInfoUserID;
        }

        var newHuI = {
            Found: foundLookingFor,
            LookingFor: whatWereYouLookingFor,
            Suggestions: suggestionsTextBox,
            CreatedBy: CreatedBy,
            CreatedUserID: CreatedUserID,
            ModifiedBy: ModifiedBy,
            ModifiedUserID: ModifiedUserID,

            MailTo: HUIMailTo,
            MailFrom: HUIMailFrom,
            PortalURL: PortalURL
        };

        AddHUI(newHuI);
    }

    //$('#btnAddItem').click(function () {
    //});

    function AddHUI(newHuI) {
        $.ajax({
            url: "/DesktopModules/HelpUsImprove/API/HelpUsImproveWS/AddHUIItem",
            type: "POST",
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify(newHuI),
            beforeSend: sf.setModuleHeaders,
            success: function (result) {
                var pg = window.location.href;

                window.location.href = pg;
            },
            error: function (jqXHR, exception) {
                alert(jqXHR.url);
                alert(exception);
            }
        });
    }
</script>