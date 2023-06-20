package com.recipe.model;

import java.util.Date;

public class NotifyVO {
	private int notify_num;
	private String notify_title;
	private String notify_content;
	private String user_nickname;
	private int user_num;
	private Date insert_date;
	private String notify_filename;
	private String notify_realname;
	private String file_path;
	public int getNotify_num() {
		return notify_num;
	}
	public void setNotify_num(int notify_num) {
		this.notify_num = notify_num;
	}
	public String getNotify_title() {
		return notify_title;
	}
	public void setNotify_title(String notify_title) {
		this.notify_title = notify_title;
	}
	public String getNotify_content() {
		return notify_content;
	}
	public void setNotify_content(String notify_content) {
		this.notify_content = notify_content;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public Date getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(Date insert_date) {
		this.insert_date = insert_date;
	}
	public String getRecipe_filename() {
		return notify_filename;
	}
	public void setRecipe_filename(String recipe_filename) {
		this.notify_filename = recipe_filename;
	}
	public String getRecipe_realname() {
		return notify_realname;
	}
	public void setRecipe_realname(String recipe_realname) {
		this.notify_realname = recipe_realname;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	
}
