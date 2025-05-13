using Common.CustAttributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CaiNiaoPostStation.Models.VModels
{
    [Table("ExpDistributeInfos")]
    [PrimaryKey("DistributeId", autoIncrement = true)]
    class ExpDistributeInfo
    {

        public int DistributeId { get; set; }
        public int ExpId { get; set; }
        // 派送员编号
        public int EmpId { get; set; }
        public bool IsSignFor { get; set; }
        // 签收时间(可为空)
        public DateTime? SignTime { get; set; }
        public DateTime DistributeTime { get; set; }
        // 入库时间
        public DateTime InsertTime { get; set; }
    }
}
