package utils;



import java.lang.reflect.Field;

import annotation.Column;
import annotation.Table;

public class TableUtils {
	public static String getCreateTableSQl(Class<?> clazz) {
		StringBuilder sb = new StringBuilder();
		
		//获取表名
		Table table = (Table) clazz.getAnnotation(Table.class);
		String tableName = table.tableName();
		sb.append("create table ");
		sb.append(tableName).append("(\n");
		
		Field[] fileds = clazz.getDeclaredFields();
		String primaryKey = "";
		//遍历所有字段
		for(int i = 0; i < fileds.length; i++) {
			Column column = (Column) fileds[i].getAnnotations()[0];
			String filed = column.filed();
			String type = column.type();
			boolean defaultNull = column.defaultNull();
			
			sb.append("\t" + filed).append(" ").append(type);
			if(defaultNull) {
				if(type.toUpperCase().equals("TIMESTAMP")) {
					sb.append(",\n");
				}else {
					sb.append(" DEFAULT NULL,\n");
				}
			}else {
				sb.append("NOT NULL,\n");
				if(column.primaryKey()) {
					primaryKey = "PRIMARY KEY ("+filed+")";
				}
			}
			
		}
		if(!StringUtils.isEmpty(primaryKey)) {
			sb.append("\t").append(primaryKey);
		}
		sb.append("\n) DEFAULT CHARSET=utf8");
		return sb.toString();
	}
}