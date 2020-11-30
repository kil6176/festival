package com.spring.board.form;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FcbBoardForm extends CommonForm {

	List<MultipartFile> files;
	int board_num;
	int fcb_group_num;
	String m_nickname;
	String fcb_title;
	String fcb_content;
	int fcb_hits;
	String fcb_delete_yn;
	String m_id;
	Date fcb_insert_date;
	Date fcb_update_date;
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

	public int getFcb_group_num() {
		return fcb_group_num;
	}

	public void setFcb_group_num(int fcb_group_num) {
		this.fcb_group_num = fcb_group_num;
	}

	public String getM_nickname() {
		return m_nickname;
	}

	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}

	public String getFcb_title() {
		return fcb_title;
	}

	public void setFcb_title(String fcb_title) {
		this.fcb_title = fcb_title;
	}

	public String getFcb_content() {
		return fcb_content;
	}

	public void setFcb_content(String fcb_content) {
		this.fcb_content = fcb_content;
	}

	public int getFcb_hits() {
		return fcb_hits;
	}

	public void setFcb_hits(int fcb_hits) {
		this.fcb_hits = fcb_hits;
	}

	public String getFcb_delete_yn() {
		return fcb_delete_yn;
	}

	public void setFcb_delete_yn(String fcb_delete_yn) {
		this.fcb_delete_yn = fcb_delete_yn;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public Date getFcb_insert_date() {
		return fcb_insert_date;
	}

	public void setFcb_insert_date(Date fcb_insert_date) {
		this.fcb_insert_date = fcb_insert_date;
	}

	public Date getFcb_update_date() {
		return fcb_update_date;
	}

	public void setFcb_update_date(Date fcb_update_date) {
		this.fcb_update_date = fcb_update_date;
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
