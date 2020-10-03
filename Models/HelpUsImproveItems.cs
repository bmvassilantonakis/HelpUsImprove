using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PWGR.Modules.HelpUsImprove.Models
{
    public class HelpUsImproveItem
    {
        public int HelpUsImproveID { get; set; }
        public bool Found { get; set; }
        public string LookingFor { get; set; }
        public string Suggestions { get; set; }
        public DateTime HUIDateTime { get; set; }
        public string CreatedBy { get; set; }
        public int CreatedUserID { get; set; }
        public string ModifiedBy { get; set; }
        public int ModifiedUserID { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }


        public string MailTo { get; set; }
        public string MailFrom { get; set; }
        public string PortalURL { get; set; }
    }
}