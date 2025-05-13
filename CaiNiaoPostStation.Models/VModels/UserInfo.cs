using Common.CustAttributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CaiNiaoPostStation.Models.VModels
{
    [Table("UserInfos")]
    [PrimaryKey("UserId", autoIncrement = true)]
    class UserInfo
    {
        public int UserId { get; set; }
 
        public string UserName { get; set; }
    
        public string UserPwd { get; set; }
        //账号状态
        public bool UserState { get; set; }
    }
}
