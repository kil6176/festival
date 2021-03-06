package com.spring.board.form;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class MvbBoardForm extends CommonForm {

	List<MultipartFile> files;
	int board_num;
	int mvb_parent_seq;
	int mvb_group_num;
	int mvb_answer_deep;
	int mvb_answer_order;
	String m_nickname;
	String mvb_title;
	String mvb_content;
	int mvb_hits;
	String mvb_versus_delete_yn;
	String m_id;
	Date mvb_insert_date;
	Date mvb_update_date;
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
	public int getMvb_parent_seq() {
		return mvb_parent_seq;
	}
	public void setMvb_parent_seq(int mvb_parent_seq) {
		this.mvb_parent_seq = mvb_parent_seq;
	}
	public int getMvb_group_num() {
		return mvb_group_num;
	}
	public void setMvb_group_num(int mvb_group_num) {
		this.mvb_group_num = mvb_group_num;
	}
	public int getMvb_answer_deep() {
		return mvb_answer_deep;
	}
	public void setMvb_answer_deep(int mvb_answer_deep) {
		this.mvb_answer_deep = mvb_answer_deep;
	}
	public int getMvb_answer_order() {
		return mvb_answer_order;
	}
	public void setMvb_answer_order(int mvb_answer_order) {
		this.mvb_answer_order = mvb_answer_order;
	}
	public String getM_nickname() {
		return m_nickname;
	}
	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}
	public String getMvb_title() {
		return mvb_title;
	}
	public void setMvb_title(String mvb_title) {
		this.mvb_title = mvb_title;
	}
	public String getMvb_content() {
		return mvb_content;
	}
	public void setMvb_content(String mvb_content) {
		this.mvb_content = mvb_content;
	}
	public int getMvb_hits() {
		return mvb_hits;
	}
	public void setMvb_hits(int mvb_hits) {
		this.mvb_hits = mvb_hits;
	}
	
	public String getMvb_versus_delete_yn() {
		return mvb_versus_delete_yn;
	}
	public void setMvb_versus_delete_yn(String mvb_versus_delete_yn) {
		this.mvb_versus_delete_yn = mvb_versus_delete_yn;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public Date getMvb_insert_date() {
		return mvb_insert_date;
	}
	public void setMvb_insert_date(Date mvb_insert_date) {
		this.mvb_insert_date = mvb_insert_date;
	}
	public Date getMvb_update_date() {
		return mvb_update_date;
	}
	public void setMvb_update_date(Date mvb_update_date) {
		this.mvb_update_date = mvb_update_date;
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
