package com.spring.board.dto;

import java.util.List;

public class NeBoardDto extends CommonDto {

	int board_num;
	int n_group_num;
	String m_nickname;
	String n_title;
	String n_content;
	int n_hits;
	String n_delete_yn;
	String m_id;
	String n_insert_date;
	String n_update_date;
	String result;

	List<BoardFileDto> files;

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

	public String getN_insert_date() {
		return n_insert_date;
	}

	public void setN_insert_date(String n_insert_date) {
		this.n_insert_date = n_insert_date;
	}

	public String getN_update_date() {
		return n_update_date;
	}

	public void setN_update_date(String n_update_date) {
		this.n_update_date = n_update_date;
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
