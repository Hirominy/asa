package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.CountDAO;
import model.dao.JudgeDAO;
import model.dao.LoginDAO;
import model.dao.UserDAO;
import model.entity.User;

/**
 * Servlet implementation class Servlet
 */
@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * ゲット
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		//リクエストからbranchを取り出す
		String branch = request.getParameter("branch");
		// 転送先の文字列用変数準備
		String url = null;
		// ログイン認証されているかの確認
		String login = (String) session.getAttribute("user_id");
		if (login != null) {
			if (branch == null) {
				branch = "non";
			}

			// ログイン認証されている場合
			// branchの内容によって振り分ける
			switch (branch) {

			case "Update":
				url = "/WEB-INF/Update.jsp";
				break;

			case "GetuserDetail":
				GetuserDetailLogic(request);
				url = "/WEB-INF/Mypage.jsp";
				break;

			case "Logout":
				session.invalidate();
				url = "logout.jsp";
				break;

			case "Judge":
				 int done =doneJudgeCheckLogic(request);
				if(done != 0){
					System.out.println("こいつすでにやったで！" + done);
				}else {
					System.out.println("こいつまだやってないで！");
				addJudgeLogic(request);
				}
				session.setAttribute("done", done);
				url = "/WEB-INF/JudgeResult.jsp";
				break;

			case "ResultShere":
				int doners =doneJudgeCheckLogic(request);
				ShowResultShere(request);
				url="/WEB-INF/ResultShare.jsp";
				break;

			case"SelectLogAll":
				SelectLogAllLogic(request);
				url="/WEB-INF/MyJudgeLog.jsp";
				break;

			case"DeliteLog":
				DeliteLogLogic(request);
				url="/WEB-INF/MyJudgeLogDeliteResult.jsp";
				break;

			default:
				doneJudgeCheckLogic(request);
				url = "/WEB-INF/Judge.jsp";
				break;
			}
			// ログイン認証されていない場合
		} else {
			session.invalidate();
			url = "login.jsp";
		}
		// それぞれの処理で指定したurl先へ転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}



	/**
	 * ポスト
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		//リクエストからbranchを取り出す
		String branch = request.getParameter("branch");
		// 転送先の文字列用変数準備
		String url = null;
		//branchがnullだったらdefault処理
		if (branch == null) {
			branch = "non";
		}

		// ログイン認証されているかの確認
		String login = (String) session.getAttribute("user_id");

		if (login != null) {

			// ログイン認証されている場合
			// branchの内容によって振り分ける
			switch (branch) {

			case "UpdateUser":
				UpdateUserLogic(request);
				url = "/WEB-INF/UpdateResult.jsp";
				break;

			default:
				doneJudgeCheckLogic(request);
				url = "/WEB-INF/Judge.jsp";
				break;
			}
			// ログイン認証されていない場合
		} else {

			switch (branch) {

			case "Login":
				session.invalidate();
				userLoginLogic(request);
				doneJudgeCheckLogic(request);
				url = "/WEB-INF/Judge.jsp";
				break;

			case "AddNewUser":
				AddNewUserLogic(request);
				url = "NewUserResult.jsp";
				break;

			default:
				session.invalidate();
				url = "error.jsp";
				break;
			}
		}
		// それぞれの処理で指定したurl先へ転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

/**
 *  朝活成功or失敗の値を受け取り、実行するメソッドを出しわけて結果を受け取る
 * @param request
 */
	private void addJudgeLogic(HttpServletRequest request) {
		String judge = request.getParameter("judge");
        HttpSession session = request.getSession();
        String id =(String) session.getAttribute("user_id");
        request.setAttribute ( "user_id", id );
		JudgeDAO dao = new JudgeDAO();
		int addcount = 0;

		if (judge.equals("s")) {
			try {
				addcount = dao.addJudges(id,judge);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		} else {
			try {
				addcount = dao.addJudgef(id,judge);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}
		session.setAttribute("addcount", addcount);
		session.setAttribute("judge", judge);
	}

	/**
	 * ユーザーの成功回数の合計と総試行回数をカウントして返す
	 * @param request
	 */
	private void ShowResultShere(HttpServletRequest request) {
		System.out.println("ShowResultShere");
		String id = request.getParameter("user_id");
		System.out.println("Servlet-count処理　" + id);
		CountDAO dao = new CountDAO();
		try {
			int count = dao.countAll(id);
			System.out.println("Servlet-countAll処理後　" + count);
			HttpSession session = request.getSession();
			session.setAttribute("count", count);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		try {
			int sc = dao.countSuccess(id);
			System.out.println("Servlet-countSc処理後　" + sc);
			HttpSession session = request.getSession();
			session.setAttribute("sc", sc);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		try {
			int fc = dao.countFailure(id);
			System.out.println("Servlet-Fc処理後　" + fc);
			HttpSession session = request.getSession();
			session.setAttribute("fc", fc);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * マイページの表示処理
	 * @param request
	 */
	private void GetuserDetailLogic(HttpServletRequest request) {
		System.out.println("UserDetail");
		String id = request.getParameter("user_id");

		System.out.println("Servlet-select処理　" + id);

		UserDAO dao = new UserDAO();
		try {
			User user = dao.select(id);

			System.out.println("Servlet-select処理後　" + id);
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		CountDAO cdao = new CountDAO();
		try {
			int sc = cdao.countSuccess(id);
			System.out.println("Servlet-countSc処理後　" + sc);
			HttpSession session = request.getSession();
			session.setAttribute("sc", sc);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		try {
			int fc = cdao.countFailure(id);
			System.out.println("Servlet-Fc処理後　" + fc);
			HttpSession session = request.getSession();
			session.setAttribute("fc", fc);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 *朝活ログ表示
	 * @param request
	 */
	private void SelectLogAllLogic(HttpServletRequest request) {
		System.out.println("SelectLogAllLogic");
		String id = request.getParameter("user_id");
		System.out.println("SSelectLogAllLogic処理　" + id);
		UserDAO dao = new UserDAO();
		List<User> JudgeLog = null;
		try {
			JudgeLog = dao.selectLogAll(id);
			System.out.println("SelectLogAllLogic処理後　" + id);
			HttpSession session = request.getSession();
			session.setAttribute("JudgeLog", JudgeLog);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * ログイン処理　login.jsp→Judge.jsp
	 * @param request
	 */
	private void userLoginLogic(HttpServletRequest request) {
		// formの内容取り出し
		String id = request.getParameter("user_id");
		String pass = request.getParameter("user_pass");

		System.out.println("Servlet-login処理　" + id);
		System.out.println("Servlet-login処理　" + pass);

		LoginDAO dao = new LoginDAO();
		// ログイン
		boolean login = dao.login(id, pass);
		if (login == true) {
			HttpSession session = request.getSession();
			session.setAttribute("user_id", id);
		}
	}//LoginLogic

	/**
	 * ログイン後、本日は朝活済みかをチェックして返す
	 * @param request
	 */
	private int doneJudgeCheckLogic(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id =(String) session.getAttribute("user_id");
		request.setAttribute ( "user_id", id );
        JudgeDAO dao = new JudgeDAO();
        User user = new User();
        int addcount =0;
        try {
			user = dao.doneJudgeCheck(id);
			if (user.getSuccess_count() ==1  || user.getFailure_count() ==1 ) {
				addcount = 1;
			}
			} catch (Exception e) {
			e.printStackTrace();
		}
        request.setAttribute("user", user);
        return addcount;
	}

	/**
	 * ユーザーの新規登録ロジック
	 * @param request
	 */
	private void AddNewUserLogic(HttpServletRequest request) {
		System.out.println(" AddNewUserLogic");

		String id = request.getParameter("user_id");
		String name = request.getParameter("user_name");
		String pass = request.getParameter("user_pass");
		HttpSession session = request.getSession();

		System.out.println("Servlet-newuser処理　" + id);
		System.out.println("Servlet-newuser処理　" + name);
		System.out.println("Servlet-newuser処理　" + pass);

		LoginDAO dao = new LoginDAO();
		int addcount = 0;
		try {
			addcount = dao.addNewUser(id,name,pass);
			System.out.println("Servlet-addUser処理後　" + id + name + pass + addcount);

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		session.setAttribute("addcount", addcount);
	}
	/**
	 * ユーザーのJudgeログをcount_idを指定して削除
	 * @param request
	 */
	private void DeliteLogLogic(HttpServletRequest request) {
		System.out.println("DeliteLogLogic");
		String id = request.getParameter("count_id");
		int delitedone = 0;

		UserDAO dao = new UserDAO();
		try {
			delitedone = dao.LogDelite(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("delitedone", delitedone);
	}
	private void UpdateUserLogic(HttpServletRequest request) {
		System.out.println("UpdateUserLogic");

		String id = request.getParameter("user_id");
		String name = request.getParameter("user_name");
		String pass = request.getParameter("user_pass");

		System.out.println("Servlet-UpdateUser " + id);
		System.out.println("Servlet-UpdateUser " + name);
		System.out.println("Servlet-UpdateUser " + pass);

		UserDAO dao = new UserDAO();
		User updateuser = new User(id,name,pass);
		int updatecount = 0;
		try {
			updatecount = dao.UpdateUser(updateuser);
			System.out.println("Servlet-UpdateUser" + id + name + pass + updatecount);
			request.setAttribute("updateuser", updateuser);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("updatecount", updatecount);
	}
}