package model.entity;

import java.io.Serializable;

public class User implements Serializable {

	/**
	 * コンストラクタ群
	 */
	public User() {
	}

	public User(String id) {
	}

	public User(String user_id, String user_name,String user_pass) {
		this.user_id = user_id;
		this.user_name= user_name;
		this.user_pass = user_pass;
	}



	public User(String user_name, String user_id, int success_count, int failure_count, String datetime) {
		this.user_name = user_name;
		this.user_id = user_id;
		this.success_count = success_count;
		this.failure_count = failure_count;
		this.datetime = datetime;
	}

	public User( String user_id, int success_count, int failure_count) {
		this.user_id = user_id;
		this.success_count = success_count;
		this.failure_count = failure_count;
	}

	/**
	 * フィールド群
	 */

	private String user_name; //ユーザーの名前
	private String user_id;     //ユーザーid
	private String user_pass; //ユーザーのパスワード

	private boolean judge; //判定

	private int success_count; //成功回数の合計
	private int failure_count; //失敗回数の合計

	private int count_id; //総試行回数

	private String datetime; //時間


	public String getDatetime() {
		return datetime;
	}

	public void setDatetime(String string) {
		this.datetime = string;
	}

	public void setJudge(boolean judge) {
		this.judge = judge;
	}

	/**
	 * getter setter群
	 * @return
	 */
	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pass() {
		return user_pass;
	}

	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}
	public boolean isJudge() {
        return judge;
    }

    public void setBool(boolean judge) {
        this.judge = judge;
    }

    @Override
    public String toString() {
        return "Test [bool=" + judge + "]";
    }

	public int getSuccess_count() {
		return success_count;
	}

	public void setSuccess_count(int success_count) {
		this.success_count = success_count;
	}

	public int getFailure_count() {
		return failure_count;
	}

	public void setFailure_count(int failure_count) {
		this.failure_count = failure_count;
	}

	public int getCount_id() {
		return count_id;
	}

	public void setCount_id(int count_id) {
		this.count_id = count_id;
	}

}
