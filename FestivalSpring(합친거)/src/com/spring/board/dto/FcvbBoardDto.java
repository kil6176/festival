package com.spring.board.dto;

import java.util.List;

public class FcvbBoardDto extends CommonDto {

	int board_num;
	int fcvb_group_num;
	int fcvb_answer_deep;
	int fcvb_answer_order;
	String m_nickname;
	String fcvb_title;
	String fcvb_content;
	int fcvb_hits;
	String fcvb_delete_yn;
	String m_id;
	String fcvb_insert_date;
	String fcvb_update_date;
	String result;

	List<BoardFileDto> files;

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public int getFcvb_group_num() {
		return fcvb_group_num;
	}

	public void setFcvb_group_num(int fcvb_group_num) {
		this.fcvb_group_num = fcvb_group_num;
	}

	public int getFcvb_answer_deep() {
		return fcvb_answer_deep;
	}

	public void setFcvb_answer_deep(int fcvb_answer_deep) {
		this.fcvb_answer_deep = fcvb_answer_deep;
	}

	public int getFcvb_answer_order() {
		return fcvb_answer_order;
	}

	public void setFcvb_answer_order(int fcvb_answer_order) {
		this.fcvb_answer_order = fcvb_answer_order;
	}

	public String getM_nickname() {
		return m_nickname;
	}

	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}

	public String getFcvb_title() {
		return fcvb_title;
	}

	public void setFcvb_title(String fcvb_title) {
		this.fcvb_title = fcvb_title;
	}

	public String getFcvb_content() {
		return fcvb_content;
	}

	public void setFcvb_content(String fcvb_content) {
		this.fcvb_content = fcvb_content;
	}

	public int getFcvb_hits() {
		return fcvb_hits;
	}

	public void setFcvb_hits(int fcvb_hits) {
		this.fcvb_hits = fcvb_hits;
	}

	public String getFcvb_delete_yn() {
		return fcvb_delete_yn;
	}

	public void setFcvb_delete_yn(String fcvb_delete_yn) {
		this.fcvb_delete_yn = fcvb_delete_yn;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getFcvb_insert_date() {
		return fcvb_insert_date;
	}

	public void setFcvb_insert_date(String fcvb_insert_date) {
		this.fcvb_insert_date = fcvb_insert_date;
	}

	public String getFcvb_update_date() {
		return fcvb_update_date;
	}

	public void setFcvb_update_date(String fcvb_update_date) {
		this.fcvb_update_date = fcvb_update_date;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public List<BoardFileDto> getFiles() {
		return files;
	}

	public void setFiles(List<BoardFileDto> files) {
		this.files = files;
	}

	
	
	

}
