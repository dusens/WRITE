package test;

import java.sql.Connection;

import utils.DataBaseUtils;

public class TestDataBaseUtils {

	public static void main(String[] args) {
		Connection conn = DataBaseUtils.getConnection();
		System.out.println(conn);
	}
}
