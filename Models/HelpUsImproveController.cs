using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text.RegularExpressions;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Data;
using DotNetNuke.Entities;
using DotNetNuke.Services.Mail;

namespace PWGR.Modules.HelpUsImprove.Models
{
    public class HelpUsImproveController
    {
        #region Help Us Improve

        public HelpUsImproveItem GetHUIItem(int HelpUsImproveID)
        {
            SqlParameter pHelpUsImproveID = new SqlParameter();
            pHelpUsImproveID.ParameterName = "@HelpUsImproveID";
            pHelpUsImproveID.Value = HelpUsImproveID;

            HelpUsImproveItem huiItem = CBO.FillObject<HelpUsImproveItem>(DataProvider.Instance().ExecuteReader("HUI_GetHUIData", pHelpUsImproveID));

            return huiItem;
        }

        public IList<HelpUsImproveItem> GetHUIData()
        {
            IList<HelpUsImproveItem> huiList = CBO.FillCollection<HelpUsImproveItem>(DataProvider.Instance().ExecuteReader("HUI_GetHUIData"));

            return huiList;
        }

        public void InsertHUIItem(HelpUsImproveItem newHuI)
        {
            DateTime dt = DateTime.Now;

            newHuI.HelpUsImproveID = DataProvider.Instance().ExecuteScalar<int>("HUI_InsertHUIData",
                newHuI.Found,
                newHuI.LookingFor,
                newHuI.Suggestions,
                dt,
                newHuI.CreatedBy,
                newHuI.CreatedUserID
            );

            if (newHuI.MailTo != "")
            {
                System.Collections.Generic.Dictionary<string, string> hostSettings = DotNetNuke.Entities.Controllers.HostController.Instance.GetSettingsDictionary();
                string strSMTP = hostSettings["SMTPServer"];

                string strFrom = hostSettings["HostEmail"];
                if ((newHuI.MailFrom != "") && (newHuI.MailFrom != null))
                {
                    strFrom = newHuI.MailFrom;
                }

                string foundLookingFor = "No";
                string suggestionTitle = "";
                string suggestionBody = "";

                if (newHuI.Found)
                {
                    foundLookingFor = "Yes";
                }
                else
                {
                    suggestionTitle = "<br/><br/><b>Looking for:</b> " + newHuI.LookingFor;
                    suggestionBody = "<br/><br/><b>Suggestions:</b> " + newHuI.Suggestions;
                }

                string pURL = "";
                if (newHuI.PortalURL != "")
                {
                    pURL = "<br/><br/>For more information visit: <a href='" + newHuI.PortalURL + "'>" + newHuI.PortalURL + "</a> and login with a proper account.";
                }

                string strSubject = "Help Us Improve New Suggestion";
                string strBody = "Someone posted a new Suggestion<br/><br/>" +
                    "<b>Found what you were looking for?</b> " +
                    foundLookingFor +
                    suggestionTitle +
                    suggestionBody +
                    "<br/><br/>Suggestion submited on: " +
                    dt.ToShortDateString() +
                    dt.ToShortTimeString() +
                    pURL +
                    "<br/><br/>Message send by<br/><br/>EU SSTPA Administrator";

                //DotNetNuke.Services.Mail.Mail.SendEmail("fromAddress", "senderAddress", "toAddress", "subject", "body", "Attachments");
                DotNetNuke.Services.Mail.Mail.SendEmail(strFrom, strFrom, newHuI.MailTo, strSubject, strBody);

                //DotNetNuke.Services.Mail.Mail.SendMail(strFrom,
                //    EMailID,
                //    strCC,
                //    strBCC,
                //    DotNetNuke.Services.Mail.MailPriority.Normal,
                //    Subject,
                //    DotNetNuke.Services.Mail.MailFormat.Html,
                //    System.Text.Encoding.UTF8,
                //    strBody,
                //    String.Empty,
                //    strSMTP,
                //    hostSettings["SMTPAuthentication"],
                //    hostSettings["SMTPUsername"],
                //    hostSettings["SMTPPassword"]);

                ////DotNetNuke.Services.Mail.Mail.SendMail("MailFrom", "MailTo", "BCC", "Subject", "Body", "Attachments", "BodyType html", "SMTP Server", "SMTP Username", "SMTP Password", String.Empty);
                ////DotNetNuke.Services.Mail.Mail.SendMail("mail@gmail.com", "mail@ymail.com", String.Empty, "URL Test", "this is a test of dnnmail: <a href='http://www.dotnetnuke.com'>DotNetNuke</a>", String.Empty, "html", String.Empty, String.Empty, String.Empty, String.Empty);
            }
        }

        public void UpdateHUIItem(HelpUsImproveItem newHuI)
        {
            DateTime dt = DateTime.Now;

            newHuI.HelpUsImproveID = DataProvider.Instance().ExecuteScalar<int>("HUI_UpdateHUIData",
                newHuI.HelpUsImproveID,
                newHuI.Found,
                newHuI.LookingFor,
                newHuI.Suggestions,
                dt,
                newHuI.CreatedBy,
                newHuI.CreatedUserID
            );
        }

        public void DeleteHUIItem(int HelpUsImproveID)
        {
            SqlParameter pHelpUsImproveID = new SqlParameter();
            pHelpUsImproveID.ParameterName = "@HelpUsImproveID";
            pHelpUsImproveID.Value = HelpUsImproveID;

            DataProvider.Instance().ExecuteNonQuery("HUI_DeleteHUIData", pHelpUsImproveID);
        }

        #endregion
    }
}