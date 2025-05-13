using Common.CustAttributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
    //轻量级 ORM（对象关系映射）思想
    public static class AttributeHelper
    {


        // string tableName = typeof(T).GetTName();
        //语法糖-拓展方法  在编译时相当于AttributeHelper.GetTName(typeof(T));
        //这样调用仿佛是T类型的一个方法


        // 获取映射表名
        public static string GetTName(this Type type)
        {
            string tableName = "";
            TableAttribute attr = type.GetCustomAttribute<TableAttribute>();
            if (attr != null)
                tableName = attr.TableName;
            if (string.IsNullOrEmpty(tableName))
                tableName = type.Name;
            return tableName;
        }

        //Type 是 .NET 中的一个类，表示一个类型的信息
        //获取类名、命名空间等结构等信息获取该类有哪些属性、方法、字段等获取类上的特性（Attribute）
        //PropertyInfo 是 .NET 中的一个类，表示一个属性的信息
        //获取属性的名称、类型、访问修饰符等信息获取属性上的特性（Attribute）


        // 获取映射列名
        public static string GetColName(this PropertyInfo property)
        {
            string colName = "";
            ColumnAttribute attr=property.GetCustomAttribute<ColumnAttribute>();
            if (attr != null)
                colName= attr.ColumnName;
            if (string.IsNullOrEmpty(colName))
                colName = property.Name;
            return colName;
        }

        // 获取主键名
        public static string GetPrimaryName(this Type type)
        {
            string priName = "";
            PrimaryKeyAttribute attr = type.GetCustomAttribute<PrimaryKeyAttribute>();
            if (attr != null)
                priName = attr.KeyName;
            return priName;
        }


        //判断指定属性是否为主键
        public static bool IsPrimaryKey(this PropertyInfo property)
        {
            Type type = property.DeclaringType;
            string primaryKey = type.GetPrimaryName();//获取该类型的主键名
            string colName = property.GetColName();//获取该属性的映射列名
            return (primaryKey == colName);
        }


        // 判断主键是否自增
        public static bool IsAutoIncrement(this Type type)
        {
            PrimaryKeyAttribute attr = type.GetCustomAttribute<PrimaryKeyAttribute>();
            if (attr != null)
                return attr.autoIncrement;
             return false;
        }
    }
}
