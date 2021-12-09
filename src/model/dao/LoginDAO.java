package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {

	/**
	 * ログイン処理
	 * @param user_id
	 * @param user_pass
	 * @return
	 */
	public boolean login (String id,String pass) {

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement("SELECT * "
						+ "FROM m_login WHERE user_id = ? and user_pass = ?;")) {

			pstmt.setString(1, id);
			pstmt.setString(2, pass);

			System.out.println("loginDAO1" + id);
			System.out.println("loginDAO1" + pass);

			ResultSet res = pstmt.executeQuery();
			if (res.next()) {
				return true;
			} else {
				return false;
			}
		} catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return false;
	}

	public int addNewUser(String id, String name, String pass)
			throws SQLException, ClassNotFoundException {
		int addCount = 0;

		String sql = "INSERT INTO m_login  (user_id,user_name,user_pass) VALUES ( ? , ? , ?);";

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, pass);

			addCount = pstmt.executeUpdate();

	} catch(SQLException | ClassNotFoundException e) {
		e.printStackTrace();
	}
		return addCount;
	}

}
