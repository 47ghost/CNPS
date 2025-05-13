using Common.CustAttributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CaiNiaoPostStation.Models.VModels
{
    [Table("EmployeeInfos")]
    [PrimaryKey("EmpId", autoIncrement = true)]
    class EmployeeInfo
    {
        public int EmpId { get; set; }
        // 员工号
        public string EmpNo { get; set; }
        public string EmpName { get; set; }
        // 拼音码
        public string EmpPYNo { get; set; }
        public string Sex { get; set; }
        public int Age { get; set; }
        public string Phone { get; set; }
        public int StationId { get; set; }
        public int EmpTypeId { get; set; }
        public bool IsOn { get; set; }
        //员工类别
        public string Remark { get; set; }
    }
}
