using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.IO;
using System.Text.RegularExpressions;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Users;
using DotNetNuke.Web.Api;
using DotNetNuke.Security;

namespace PWGR.Modules.HelpUsImprove.Models
{
    public class HelpUsImproveWSController : DnnApiController
    {
        [AllowAnonymous]
        [HttpGet]
        public HttpResponseMessage HelloWorld()
        {
            return Request.CreateResponse(HttpStatusCode.OK, "Hello World!");
        }

        //Test URL
        //www.euparking.imet.gr/DesktopModules/HelpUsImprove/API/HelpUsImproveWS/HelloWorld
        //www.euparking.imet.gr/DesktopModules/EUCertifiedParkings/API/CertifiedParkingsWS/GetHUIData
        //www.euparking.imet.gr/DesktopModules/EUCertifiedParkings/API/CertifiedParkingsWS/GetHUIItem?HelpUsImproveID=1

        #region Help Us Improve

        [AllowAnonymous]
        [HttpGet]
        public HttpResponseMessage GetHUIItem(int HelpUsImproveID)
        {
            try
            {
                var huiItem = new HelpUsImproveController().GetHUIItem(HelpUsImproveID).ToJson();
                return Request.CreateResponse(HttpStatusCode.OK, huiItem);
            }
            catch (Exception exc)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, exc);
            }
        }

        [AllowAnonymous]
        [HttpGet]
        public HttpResponseMessage GetHUIData()
        {
            try
            {
                var HUIData = new HelpUsImproveController().GetHUIData().ToJson();
                return Request.CreateResponse(HttpStatusCode.OK, HUIData);
            }
            catch (Exception exc)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, exc);
            }
        }

        [DnnModuleAuthorize(AccessLevel = SecurityAccessLevel.View)]
        [ValidateAntiForgeryToken]
        [HttpPost]
        public HttpResponseMessage AddHUIItem(HelpUsImproveItem WSHUI)
        {
            try
            {
                var newHuI = new HelpUsImproveItem()
                {
                    Found = WSHUI.Found,
                    LookingFor = WSHUI.LookingFor,
                    Suggestions = WSHUI.Suggestions,
                    //HUIDateTime = WSHUI.HUIDateTime,
                    CreatedBy = WSHUI.CreatedBy,
                    CreatedUserID = WSHUI.CreatedUserID,

                    MailTo = WSHUI.MailTo,
                    MailFrom = WSHUI.MailFrom,
                    PortalURL = WSHUI.PortalURL
                };
                HelpUsImproveController cPC = new HelpUsImproveController();
                cPC.InsertHUIItem(newHuI);
                return Request.CreateResponse(HttpStatusCode.OK);
            }
            catch (Exception exc)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, exc);
            }
        }

        [DnnModuleAuthorize(AccessLevel = SecurityAccessLevel.View)]
        [ValidateAntiForgeryToken]
        [HttpPost]
        public HttpResponseMessage UpdateHUIItem(HelpUsImproveItem WSHUI)
        {
            try
            {
                var newHuI = new HelpUsImproveItem()
                {
                    HelpUsImproveID = WSHUI.HelpUsImproveID,
                    Found = WSHUI.Found,
                    LookingFor = WSHUI.LookingFor,
                    Suggestions = WSHUI.Suggestions,
                    //HUIDateTime = WSHUI.HUIDateTime,
                    ModifiedBy = WSHUI.ModifiedBy,
                    ModifiedUserID = WSHUI.ModifiedUserID
                };
                HelpUsImproveController cPC = new HelpUsImproveController();
                cPC.UpdateHUIItem(newHuI);
                return Request.CreateResponse(HttpStatusCode.OK);
            }
            catch (Exception exc)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, exc);
            }
        }

        [DnnModuleAuthorize(AccessLevel = SecurityAccessLevel.View)]
        [ValidateAntiForgeryToken]
        [HttpPost]
        public HttpResponseMessage DeleteHUIItem(int HelpUsImproveID)
        {
            try
            {
                HelpUsImproveController cPC = new HelpUsImproveController();
                cPC.DeleteHUIItem(HelpUsImproveID);
                return Request.CreateResponse(HttpStatusCode.OK);
            }
            catch (Exception exc)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, exc);
            }
        }

        #endregion
    }
}