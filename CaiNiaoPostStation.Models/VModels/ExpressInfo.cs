using Common.CustAttributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CaiNiaoPostStation.Models.VModels
{
    [Table("ExpressInfos")]
    [PrimaryKey("ExpId", autoIncrement = true)]
    class ExpressInfo
    {
        public int ExpId { get; set; }
        // 快递单号
        public string ExpNumber { get; set; }
        public int StationId { get; set; }
        public int ShelfId { get; set; }
        // 寄件人
        public string Sender { get; set; }
        public string SenderAddress { get; set; }
        public string SenderPhone { get; set; }
        //收件人
        public string Receiver { get; set; }
        public string ReceiveAddress { get; set; }
        public string ReceiverPhone { get; set; }
        // 快递描述
        public string ExpRemark { get; set; }
        // 快递状态
        public string ExpState { get; set; }
        public string ExpType { get; set; }
        // 录入人
        public string EnterPerson { get; set; }
        // 录入时间
        public DateTime EnterTime { get; set; }
        // 取件方式
        public string PickWay { get; set; }
    }
}
