package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.entity.User;

public class UserDAO {
	/**
	 * 引数で指定したコードのユーザオブジェクトを返します。
	 * @return ユーザオブジェクト
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public User select(String user_id)
			throws SQLException, ClassNotFoundException {

		User user = new User();

		String sql = "SELECT * FROM m_login WHERE user_id = ?";
		// データベースへの接続の取得、PreparedStatementの取得
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);) {

			// プレースホルダへの値の設定
			pstmt.setString(1, user_id);

			System.out.println("userDAO1 " + user_id);

			// SQLステートメントの実行
			ResultSet res = pstmt.executeQuery();

			// 結果の操作
			while (res.next()) {
				user.setUser_id(res.getString("user_id"));
				user.setUser_pass(res.getString("user_pass"));
				user.setUser_name(res.getString("user_name"));
			}
			System.out.println("userDAO1 " + user.getUser_name());
		}
		return user;
	}

	/**
	 * ログをすべて取得して表示
	 * @param user_id
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public List<User> selectLogAll(String user_id)
			throws SQLException, ClassNotFoundException {
		List<User> JudgeLog = new ArrayList<>();
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 hh時mm分");

		String sql = "SELECT * FROM m_count WHERE user_id = ? order by timedata DESC";
		// データベースへの接続の取得、PreparedStatementの取得
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);) {

			// プレースホルダへの値の設定
			pstmt.setString(1, user_id);

			System.out.println("ログ見せて" + user_id);

			// SQLステートメントの実行
			ResultSet res = pstmt.executeQuery();

			// 結果の操作
			while (res.next()) {
				int id = res.getInt("count_id");
				String name = res.getString("user_id");
				int s = res.getInt("success_count");
				int f = res.getInt("failure_count");
				String d = res.getString("timedata");

				User user = new User();
				user.setCount_id(id);
				user.setUser_name(name);
				user.setSuccess_count(s);
				user.setFailure_count(f);
				user.setDatetime(d);
				JudgeLog.add(user);
			}
			System.out.println("ログ見せて結果" + res);
		}
		return JudgeLog;
	}

	public int LogDelite(String count_id) throws SQLException, ClassNotFoundException {
		System.out.println("LogDelite");

		String id = count_id;
		int delcount = 0;//処理

		System.out.println("delite1 " + id);

		String sql = "DELETE FROM m_count WHERE count_id = ?;";

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1,  id);

			System.out.println("delite2 " + id);

			delcount = pstmt.executeUpdate();

		} catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		System.out.println("delite3 " + delcount);
		return delcount;
	}

	public int UpdateUser(User updateuser)
			throws SQLException, ClassNotFoundException {
				int updatecount = 0;

				String sql = "UPDATE m_login SET user_name = ? , user_pass = ?  WHERE user_id = ?";

				try (Connection con = ConnectionManager.getConnection();
						PreparedStatement pstmt = con.prepareStatement(sql)) {

					// DTOからのデータの取り出し
					String id = updateuser.getUser_id();
					String name =  updateuser.getUser_name();
					String pass = updateuser.getUser_pass();

					pstmt.setString(1, name);
					pstmt.setString(2, pass);
					pstmt.setString(3, id);
					updatecount = pstmt.executeUpdate();

			} catch(SQLException | ClassNotFoundException e) {
				e.printStackTrace();
			}
			return updatecount;
		}
}
