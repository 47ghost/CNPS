﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
using NPOI.HSSF.UserModel;
using System.IO;
using System.Data;
using System.Reflection;

namespace Common
{
    public class ExcelHelper
    {

        /// <summary>
        /// 将DataTable数据导入到excel中
        /// </summary>
        /// <param name="data">要导入的数据</param>
        /// <param name="fileName">写入的目标Excel的完整名称</param>
        /// <param name="isColumnWritten">DataTable的列名是否要导入</param>
        /// <param name="sheetName">要导入的excel的sheet的名称</param>
        /// <returns>导入数据行数(包含列名那一行)</returns>
        public static int DataTableToExcel(DataTable data, string fileName, string sheetName, bool isColumnWritten)
        {
            int i = 0;
            int j = 0;
            int count = 0;
            ISheet sheet = null;
            IWorkbook workbook = null;

            if (fileName.IndexOf(".xlsx") > 0) // 2007版本
                workbook = new XSSFWorkbook();
            else if (fileName.IndexOf(".xls") > 0) // 2003版本
                workbook = new HSSFWorkbook();

            try
            {
                using (FileStream fs = new FileStream(fileName, FileMode.OpenOrCreate, FileAccess.ReadWrite))
                {
                    if (workbook != null)
                    {
                        sheet = workbook.CreateSheet(sheetName);
                    }
                    else
                    {
                        return -1;
                    }

                    if (isColumnWritten == true) //写入DataTable的列名
                    {
                        IRow row = sheet.CreateRow(0);
                        for (j = 0; j < data.Columns.Count; ++j)
                        {
                            row.CreateCell(j).SetCellValue(data.Columns[j].ColumnName);
                        }
                        count = 1;
                    }
                    else
                    {
                        count = 0;
                    }
                    for (i = 0; i < data.Rows.Count; ++i)
                    {
                        IRow row = sheet.CreateRow(count);
                        for (j = 0; j < data.Columns.Count; ++j)
                        {
                            row.CreateCell(j).SetCellValue(data.Rows[i][j].ToString());
                        }
                        ++count;
                    }
                    workbook.Write(fs); //写入到excel
                    return count;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception: " + ex.Message);
                return -1;
            }

        }

        /// <summary>
        /// 将excel中的数据导入到DataTable中
        /// </summary>
        /// <param name="fileName">读取的Excel的完整名称</param>
        /// <param name="sheetName">excel工作薄sheet的名称</param>
        /// <param name="isFirstRowColumn">第一行是否是DataTable的列名</param>
        /// <returns>返回的DataTable</returns>
        public static DataTable ExcelToDataTable(string fileName, string sheetName, bool isFirstRowColumn)
        {
            ISheet sheet = null;
            DataTable data = new DataTable();
            int startRow = 0;
            try
            {
                IWorkbook workbook = null;
                using (FileStream fs = new FileStream(fileName, FileMode.Open, FileAccess.Read))
                {
                    if (fileName.IndexOf(".xlsx") > 0) // 2007版本
                        workbook = new XSSFWorkbook(fs);
                    else if (fileName.IndexOf(".xls") > 0) // 2003版本
                        workbook = new HSSFWorkbook(fs);

                    if (sheetName != null)
                    {
                        sheet = workbook.GetSheet(sheetName);
                        if (sheet == null) //如果没有找到指定的sheetName对应的sheet，则尝试获取第一个sheet
                        {
                            sheet = workbook.GetSheetAt(0);
                        }
                    }
                    else
                    {
                        sheet = workbook.GetSheetAt(0);
                    }
                    if (sheet != null)
                    {
                        IRow firstRow = sheet.GetRow(0);
                        int cellCount = firstRow.LastCellNum; //一行最后一个cell的编号 即总的列数

                        if (isFirstRowColumn)
                        {
                            for (int i = firstRow.FirstCellNum; i < cellCount; ++i)
                            {
                                ICell cell = firstRow.GetCell(i);
                                if (cell != null)
                                {
                                    string cellValue = cell.StringCellValue;
                                    if (cellValue != null)
                                    {
                                        DataColumn column = new DataColumn(cellValue);
                                        data.Columns.Add(column);
                                    }
                                }
                            }
                            startRow = sheet.FirstRowNum + 1;
                        }
                        else
                        {
                            startRow = sheet.FirstRowNum;
                        }

                        //最后一列的标号
                        int rowCount = sheet.LastRowNum;
                        for (int i = startRow; i <= rowCount; ++i)
                        {
                            IRow row = sheet.GetRow(i);
                            if (row == null) continue; //没有数据的行默认是null　　　　　　　

                            DataRow dataRow = data.NewRow();
                            for (int j = row.FirstCellNum; j < cellCount; ++j)
                            {
                                if (row.GetCell(j) != null) //同理，没有数据的单元格都默认是null
                                {
                                    ICell cell = row.GetCell(j);
                                    if (cell.CellType == CellType.Numeric && DateUtil.IsCellDateFormatted(cell))
                                    {
                                        dataRow[j] = cell.DateCellValue.ToString();
                                    }
                                    else
                                    {
                                        dataRow[j] = cell.ToString();
                                    }
                                }
                            }
                            data.Rows.Add(dataRow);
                        }
                    }

                    return data;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception: " + ex.Message);
                return null;
            }
        }

        /// <summary>
        /// 把Excel的stream导入到表
        /// </summary>
        /// <param name="fs"></param>
        /// <param name="fileName"></param>
        /// <param name="sheetName"></param>
        /// <param name="isFirstRowColumn"></param>
        /// <returns></returns>
        public static DataTable ExcelToDataTable(Stream fs, string fileName, string sheetName, bool isFirstRowColumn)
        {
            ISheet sheet = null;
            DataTable data = new DataTable();
            int startRow = 0;
            try
            {
                IWorkbook workbook = null;
                if (fileName.IndexOf(".xlsx") > 0) // 2007版本
                    workbook = new XSSFWorkbook(fs);
                else if (fileName.IndexOf(".xls") > 0) // 2003版本
                    workbook = new HSSFWorkbook(fs);

                if (sheetName != null)
                {
                    sheet = workbook.GetSheet(sheetName);
                    if (sheet == null) //如果没有找到指定的sheetName对应的sheet，则尝试获取第一个sheet
                    {
                        sheet = workbook.GetSheetAt(0);
                    }
                }
                else
                {
                    sheet = workbook.GetSheetAt(0);
                }
                if (sheet != null)
                {
                    IRow firstRow = sheet.GetRow(0);
                    int cellCount = firstRow.LastCellNum; //一行最后一个cell的编号 即总的列数

                    if (isFirstRowColumn)
                    {
                        for (int i = firstRow.FirstCellNum; i < cellCount; ++i)
                        {
                            ICell cell = firstRow.GetCell(i);
                            if (cell != null)
                            {
                                string cellValue = cell.StringCellValue;
                                if (cellValue != null)
                                {
                                    DataColumn column = new DataColumn(cellValue);
                                    data.Columns.Add(column);
                                }
                            }
                        }
                        startRow = sheet.FirstRowNum + 1;
                    }
                    else
                    {
                        startRow = sheet.FirstRowNum;
                    }

                    //最后一列的标号
                    int rowCount = sheet.LastRowNum;
                    for (int i = startRow; i <= rowCount; ++i)
                    {
                        IRow row = sheet.GetRow(i);
                        if (row == null) continue; //没有数据的行默认是null　　　　　　　

                        DataRow dataRow = data.NewRow();
                        for (int j = row.FirstCellNum; j < cellCount; ++j)
                        {
                            if (row.GetCell(j) != null) //同理，没有数据的单元格都默认是null
                                dataRow[j] = row.GetCell(j).ToString();
                        }
                        data.Rows.Add(dataRow);
                    }
                }

                return data;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception: " + ex.Message);
                return null;
            }
        }

        /// <summary>
        /// 将List<T>列表数据导出到Excel
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="list"></param>
        /// <param name="fileName"></param>
        /// <param name="sheetName"></param>
        /// <param name="colNames"></param>
        /// <returns></returns>
        public static int ListToExcel<T>(List<T> list, string fileName, string sheetName, Dictionary<string, string> colNames)
        {
            int i = 0;
            int j = 0;
            int count = 0;
            ISheet sheet = null;
            IWorkbook workbook = null;
            Type type = typeof(T);

            if (fileName.IndexOf(".xlsx") > 0) // 2007版本
                workbook = new XSSFWorkbook();
            else if (fileName.IndexOf(".xls") > 0) // 2003版本
                workbook = new HSSFWorkbook();

            try
            {
                using (FileStream fs = new FileStream(fileName, FileMode.OpenOrCreate, FileAccess.ReadWrite))
                {
                    if (workbook != null)
                    {
                        sheet = workbook.CreateSheet(sheetName);
                    }
                    else
                    {
                        return -1;
                    }
                    List<string> keys = new List<string>(colNames.Keys);
                    if (colNames.Count > 0) //写入列名
                    {
                        IRow row = sheet.CreateRow(0);
                        for (j = 0; j < keys.Count; ++j)
                        {
                            row.CreateCell(j).SetCellValue(colNames[keys[j]]);
                        }
                        count = 1;
                    }
                    else
                    {
                        count = 0;
                    }
                    IRow firstRow = sheet.GetRow(0);
                    int cellCount = firstRow.LastCellNum;
                    PropertyInfo[] props = type.GetProperties();
                    for (i = 0; i < list.Count; ++i)
                    {
                        IRow row = sheet.CreateRow(count);
                        for (j = firstRow.FirstCellNum; j < cellCount; ++j)
                        {
                            var p = type.GetProperty(keys[j]);
                            object val = p.GetValue(list[i]);
                            if (val == null)
                                val = "";
                            row.CreateCell(j).SetCellValue(val.ToString());
                        }
                        ++count;
                    }
                    workbook.Write(fs); //写入到excel
                    return count;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception: " + ex.Message);
                return -1;
            }
        }

        /// <summary>
        /// 创建IWorkbook实例
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        public static IWorkbook CreateWorkBook(string exName)
        {
            IWorkbook workbook = null;
            if (exName==".xlsx") // 2007版本
                workbook = new XSSFWorkbook();
            else if (exName == ".xls") // 2003版本
                workbook = new HSSFWorkbook();
            return workbook;
        }

        /// <summary>
        /// 创建ISheet实例
        /// </summary>
        /// <param name="workbook"></param>
        /// <param name="sheetName"></param>
        /// <returns></returns>
        public static ISheet CreateSheet(IWorkbook workbook, string sheetName)
        {
            ISheet sheet = null;
            if (workbook != null)
            {
                sheet = workbook.CreateSheet(sheetName);
            }
            return sheet;
        }
        
    }
}