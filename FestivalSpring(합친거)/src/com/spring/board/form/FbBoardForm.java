package com.spring.board.form;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FbBoardForm extends CommonForm {

	List<MultipartFile> files;
	int board_num;
	int fb_group_num;
	String m_nickname;
	String fb_title;
	String fb_content;
	int fb_hits;
	String fb_delete_yn;
	String m_id;
	Date fb_insert_date;
	Date fb_update_date;
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

	public int getFb_group_num() {
		return fb_group_num;
	}

	public void setFb_group_num(int fb_group_num) {
		this.fb_group_num = fb_group_num;
	}

	public String getM_nickname() {
		return m_nickname;
	}

	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}

	public String getFb_title() {
		return fb_title;
	}

	public void setFb_title(String fb_title) {
		this.fb_title = fb_title;
	}

	public String getFb_content() {
		return fb_content;
	}

	public void setFb_content(String fb_content) {
		this.fb_content = fb_content;
	}

	public int getFb_hits() {
		return fb_hits;
	}

	public void setFb_hits(int fb_hits) {
		this.fb_hits = fb_hits;
	}

	public String getFb_delete_yn() {
		return fb_delete_yn;
	}

	public void setFb_delete_yn(String fb_delete_yn) {
		this.fb_delete_yn = fb_delete_yn;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public Date getFb_insert_date() {
		return fb_insert_date;
	}

	public void setFb_insert_date(Date fb_insert_date) {
		this.fb_insert_date = fb_insert_date;
	}

	public Date getFb_update_date() {
		return fb_update_date;
	}

	public void setFb_update_date(Date fb_update_date) {
		this.fb_update_date = fb_update_date;
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
