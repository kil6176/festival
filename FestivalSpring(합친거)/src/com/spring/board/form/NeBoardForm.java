package com.spring.board.form;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class NeBoardForm extends CommonForm {

	List<MultipartFile> files;
	int board_num;
	int n_group_num;
	String m_nickname;
	String n_title;
	String n_content;
	int n_hits;
	String n_delete_yn;
	String m_id;
	Date n_insert_date;
	Date n_update_date;
	String search_type;
	String board_file;
	String delete_file;

	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}

	
	
	

	

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public int getN_group_num() {
		return n_group_num;
	}

	public void setN_group_num(int n_group_num) {
		this.n_group_num = n_group_num;
	}

	public String getM_nickname() {
		return m_nickname;
	}

	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public int getN_hits() {
		return n_hits;
	}

	public void setN_hits(int n_hits) {
		this.n_hits = n_hits;
	}

	public String getN_delete_yn() {
		return n_delete_yn;
	}

	public void setN_delete_yn(String n_delete_yn) {
		this.n_delete_yn = n_delete_yn;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public Date getN_insert_date() {
		return n_insert_date;
	}

	public void setN_insert_date(Date n_insert_date) {
		this.n_insert_date = n_insert_date;
	}

	public Date getN_update_date() {
		return n_update_date;
	}

	public void setN_update_date(Date n_update_date) {
		this.n_update_date = n_update_date;
	}

	public String getSearch_type() {
		return search_type;
	}

	public void setSearch_type(String search_type) {
		this.search_type = search_type;
	}

	public String getBoard_file() {
		return board_file;
	}

	public void setBoard_file(String board_file) {
		this.board_file = board_file;
	}

	public String getDelete_file() {
		return delete_file;
	}

	public void setDelete_file(String delete_file) {
		this.delete_file = delete_file;
	}
}
