using Common.CustAttributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CaiNiaoPostStation.Models.VModels
{
    [Table("ExpSelfPickInfos")]
    [PrimaryKey("PickUpId", autoIncrement = true)]
    class ExpSelfPickInfo
    {
        public int PickUpId { get; set; }
        public int ExpId { get; set; }
        // 取件码
        public string PickCode { get; set; }
        public bool IsPickUp { get; set; }
        // 取件时间(可为空)
        public DateTime? PickingTime { get; set; }
        public DateTime InsertTime { get; set; }
    }
}
