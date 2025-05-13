using Common.CustAttributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CaiNiaoPostStation.Models.VModels
{
    [Table("ShelfInfos")]
    [PrimaryKey("ShelfId", autoIncrement = true)]
    class ShelfInfo
    {
        public int ShelfId { get; set; }
        // 货架号
        public string ShelfNo { get; set; }
        // 货架名称
        public string ShelfName { get; set; }
        // 所属站点编号
        public int StationId { get; set; }
        // 货架位置
        public string Address { get; set; }
        public string Remark { get; set; }
    
}
}
