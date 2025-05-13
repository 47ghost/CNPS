using Common.CustAttributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CaiNiaoPostStation.Models.VModels
{
    [Table("ExpressTypeInfos")]
    [PrimaryKey("ExpTypeId", autoIncrement = true)]
    class ExpressTypeInfo
    {
        public int ExpTypeId { get; set; }
        public string ExpTypeName { get; set; }
        public string ExpTypePYNo { get; set; }
        public int ParentId { get; set; }
        // 同级排序号
        public int OrderNum { get; set; }
        public string Remark { get; set; }
    }
}
