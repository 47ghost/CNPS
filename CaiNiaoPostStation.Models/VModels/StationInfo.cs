using Common.CustAttributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CaiNiaoPostStation.Models.VModels
{
    [Table("StationInfos")]
    [PrimaryKey("StationId", autoIncrement = true)]
    class StationInfo
    {

        public int StationId { get; set; }
        // 站点编码
        public string StationNo { get; set; }
        public string StationName { get; set; }
        // 站点拼音码
        public string StationPYNo { get; set; }
        public string Address { get; set; }
        public string Manager { get; set; }
        public string Phone { get; set; }
        public string Remark { get; set; }
        // 是否运营中
        public bool IsRunning { get; set; }
    }
}
