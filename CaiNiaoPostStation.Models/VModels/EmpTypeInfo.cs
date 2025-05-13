using Common.CustAttributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CaiNiaoPostStation.Models.VModels
{
    [Table("EmpTypeInfos")]
    [PrimaryKey("EmpTypeId", autoIncrement = true)]
    class EmpTypeInfo
    {

        public int EmpTypeId { get; set; }
        public string EmpTypeName { get; set; }
        public string Remark { get; set; }

    }
}
