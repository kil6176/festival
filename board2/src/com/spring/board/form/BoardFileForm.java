package com.spring.board.form;

import java.util.Date;

public class BoardFileForm extends CommonForm {

	int board_num;
	int bf_num;
	String bf_name_key;
	String bf_name;
	String bf_path;
	String bf_size;
	String bf_delete_yn;
	String m_id;
	Date bf_insert_date;
	Date bf_update_date;
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getBf_num() {
		return bf_num;
	}
	public void setBf_num(int bf_num) {
		this.bf_num = bf_num;
	}
	public String getBf_name_key() {
		return bf_name_key;
	}
	public void setBf_name_key(String bf_name_key) {
		this.bf_name_key = bf_name_key;
	}
	public String getBf_name() {
		return bf_name;
	}
	public void setBf_name(String bf_name) {
		this.bf_name = bf_name;
	}
	public String getBf_path() {
		return bf_path;
	}
	public void setBf_path(String bf_path) {
		this.bf_path = bf_path;
	}
	public String getBf_size() {
		return bf_size;
	}
	public void setBf_size(String bf_size) {
		this.bf_size = bf_size;
	}
	public String getBf_delete_yn() {
		return bf_delete_yn;
	}
	public void setBf_delete_yn(String bf_delete_yn) {
		this.bf_delete_yn = bf_delete_yn;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public Date getBf_insert_date() {
		return bf_insert_date;
	}
	public void setBf_insert_date(Date bf_insert_date) {
		this.bf_insert_date = bf_insert_date;
	}
	public Date getBf_update_date() {
		return bf_update_date;
	}
	public void setBf_update_date(Date bf_update_date) {
		this.bf_update_date = bf_update_date;
	}

	
}
