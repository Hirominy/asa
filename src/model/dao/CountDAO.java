package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CountDAO {

	/**
	 * シェア用のテキスト吐き出し
	 * 対象ユーザーのID、名前、レコード合計数を返します。
	 * @param user_id
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public int countAll(String user_id)
			throws SQLException, ClassNotFoundException {

		System.out.println("CountAll");
		int count = 0;

		String sql = "select user_id,count(count_id) as count from m_count WHERE user_id=? GROUP BY user_id;";
		// データベースへの接続の取得、PreparedStatementの取得
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);) {

			// プレースホルダへの値の設定
			pstmt.setString(1, user_id);

			System.out.println("userDAOcount1 " + user_id);

			// SQLステートメントの実行
			ResultSet rs1 = pstmt.executeQuery();

			rs1.next();

			// 結果の操作
			count= rs1.getInt("count");
			System.out.println("userDAO1 " + count);
		}
		return count;
	}

/**
 * 成功回数を返します。
 * @param user_id
 * @return
 * @throws SQLException
 * @throws ClassNotFoundException
 */
public int countSuccess(String user_id)
		throws SQLException, ClassNotFoundException {
	System.out.println("CountSuccess");
	int sc = 0;

	String sql = "select user_id,count(success_count = true OR NULL) as sc from m_count WHERE user_id=? GROUP BY user_id;";
	// データベースへの接続の取得、PreparedStatementの取得
	try (Connection con = ConnectionManager.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);) {

		// プレースホルダへの値の設定
		pstmt.setString(1, user_id);

		System.out.println("userDAOsc1 " + user_id);

		// SQLステートメントの実行
		ResultSet rs2 = pstmt.executeQuery();

		rs2.next();

		// 結果の操作
		sc= rs2.getInt("sc");
		System.out.println("userDAO1 " + sc);
	}
			return sc;
}

/**
 * 失敗回数を返します。
 * @param user_id
 * @return
 * @throws SQLException
 * @throws ClassNotFoundException
 */
public int countFailure(String user_id)
		throws SQLException, ClassNotFoundException {
	System.out.println("CountFailure");
	int fc = 0;
	String sql = "select user_id,count(failure_count = true OR NULL) as fc from m_count WHERE user_id=? GROUP BY user_id;";
	try (Connection con = ConnectionManager.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);) {
		pstmt.setString(1, user_id);
		System.out.println("userDAOfc1 " + user_id);
		ResultSet rs3 = pstmt.executeQuery();
		rs3.next();
		fc= rs3.getInt("fc");
		System.out.println("userDAO1 " + fc);
	}
			return fc;
}


}