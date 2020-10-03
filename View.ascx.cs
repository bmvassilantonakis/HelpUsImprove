/*
' Copyright (c) 2020  Bartholomew-Michael G. Vassilantonakis
'  All rights reserved.
' 
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
' DEALINGS IN THE SOFTWARE.
' 
*/

using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using DotNetNuke.Security;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Modules.Actions;
using DotNetNuke.Services.Mail;
using DotNetNuke.Services.Localization;
using System.Threading;
using System.Globalization;

namespace PWGR.Modules.HelpUsImprove
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The View class displays the content
    /// 
    /// Typically your view control would be used to display content or functionality in your module.
    /// 
    /// View may be the only control you have in your project depending on the complexity of your module
    /// 
    /// Because the control inherits from HelpUsImproveModuleBase you have access to any custom properties
    /// defined there, as well as properties from DNN such as PortalId, ModuleId, TabId, UserId and many more.
    /// 
    /// </summary>
    /// -----------------------------------------------------------------------------
    public partial class View : HelpUsImproveModuleBase, IActionable
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string HUIMailTo = "";

                if (((string)Settings["HUIMailTo"] != null) && ((string)Settings["HUIMailTo"] != ""))
                {
                    HUIMailTo = (string)Settings["HUIMailTo"];
                }

                string HUIMailFrom = "";

                if (((string)Settings["HUIMailFrom"] != null) && ((string)Settings["HUIMailFrom"] != ""))
                {
                    HUIMailFrom = (string)Settings["HUIMailFrom"];
                }

                string HUIreCAPTCHASiteKey = "";

                if (((string)Settings["HUIreCAPTCHASiteKey"] != null) && ((string)Settings["HUIreCAPTCHASiteKey"] != ""))
                {
                    HUIreCAPTCHASiteKey = (string)Settings["HUIreCAPTCHASiteKey"];
                }

                string HUIreCAPTCHASecretKey = "";

                if (((string)Settings["HUIreCAPTCHASecretKey"] != null) && ((string)Settings["HUIreCAPTCHASecretKey"] != ""))
                {
                    HUIreCAPTCHASecretKey = (string)Settings["HUIreCAPTCHASecretKey"];
                }

                string PortalURL = DotNetNuke.Common.Globals.NavigateURL();

                ScriptManager.RegisterStartupScript(Page, typeof(string), Guid.NewGuid().ToString(), "HUIMailTo = '" + HUIMailTo + "'; HUIMailFrom = '" + HUIMailFrom + "'; HUIreCAPTCHASiteKey = '" + HUIreCAPTCHASiteKey + "'; HUIreCAPTCHASecretKey = '" + HUIreCAPTCHASecretKey + "'; PortalURL = '" + PortalURL + "';", true);
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        public ModuleActionCollection ModuleActions
        {
            get
            {
                var actions = new ModuleActionCollection
                    {
                        {
                            GetNextActionID(), Localization.GetString("EditModule", LocalResourceFile), "", "", "",
                            EditUrl(), false, SecurityAccessLevel.Edit, true, false
                        }
                    };
                return actions;
            }
        }
    }
}