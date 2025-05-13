using Common.CustAttributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CaiNiaoPostStation.Models.VModels
{
    [Table("MenuInfos")]
    [PrimaryKey("MenuId", autoIncrement = true)]
    class MenuInfo
    {
        public int MenuId { get; set; }
        public string MenuName { get; set; }
        // 父菜单编号
        public int ParentId { get; set; }
        // 快捷键
        public string MKey { get; set; }
        // 页面名称
        public string FormURL { get; set; }
        // 排序号
        public string MOrder { get; set; }


    }
}
