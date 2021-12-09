package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.entity.User;

public class JudgeDAO {

	/**
	 * user_idに紐づいたその日のレコードがあればそのレコードのsc(0or1)とfc(0or1)をUserに入れて返す
	 * @param user_id
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public User doneJudgeCheck (String user_id) throws SQLException, ClassNotFoundException {
		System.out.println("donecheck");
		User user = new User();
		int sc = 0;
		int fc = 0;
		String sql ="SELECT user_id id,success_count sc,failure_count fc,timedata FROM m_count" +
				" WHERE user_id=? AND DATE_ADD(timedata, INTERVAL 10 HOUR) >= NOW();";

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, user_id);
			int count = 0;

			ResultSet check = pstmt.executeQuery();

			while ( check.next() ) {
				sc = check.getInt("sc");
				fc = check.getInt("fc");
				count++ ;
				System.out.println("sc=" + sc +"fc=" +  fc);
			}
				if (count == 1) {
					user.setSuccess_count(sc);
					user.setFailure_count(fc);
				}
			} catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return user;
	}

	/**
	 * //successカウントしてデータベースに追加するメソッド
	 * @param user_id
	 * @param user_comment
	 * @return
	 */

	public int addJudges (String user_id,String judge)
			throws SQLException, ClassNotFoundException {
		System.out.println("addJudges");

		String id = user_id;
		//judgeをboolean型に変換
		judge = "true";
		boolean sc = Boolean.valueOf( judge );

		int addcount = 0;//処理

		System.out.println("adds1 " + id + sc);

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"INSERT INTO m_count (user_id,success_count,failure_count,timedata) VALUES ( ? , ? , false,now());")) {

			pstmt.setString(1,  id);
			pstmt.setBoolean(2, sc);

			System.out.println("adds2 " + id + sc);

			addcount = pstmt.executeUpdate();

		} catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return addcount;
	}



	/**
	 * 	//falseカウントしてデータベースに追加するメソッド
	 * @param user_id
	 * @param judge
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public int addJudgef (String user_id,String judge)
			throws SQLException, ClassNotFoundException {
		System.out.println("addJudgef");

		String id = user_id;
		//judgeをboolean型に変換
		judge = "true";
		boolean fc = Boolean.valueOf( judge );

		int addcount = 0;//処理

		System.out.println("addf1 " + id + fc);

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"INSERT INTO m_count (user_id,success_count,failure_count,timedata) VALUES ( ? ,  false, ?, now());")) {

			pstmt.setString(1,  id);
			pstmt.setBoolean(2, fc);

			System.out.println("addf2 " + id + fc);

			addcount = pstmt.executeUpdate();

		} catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return addcount;
	}
}
