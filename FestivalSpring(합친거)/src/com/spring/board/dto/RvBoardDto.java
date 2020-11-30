package com.spring.board.dto;

import java.util.List;

public class RvBoardDto extends CommonDto {

	int board_num;
	int frb_group_num;
	String m_nickname;
	String frb_title;
	String frb_content;
	int frb_hits;
	String frb_delete_yn;
	String m_id;
	String frb_insert_date;
	String frb_update_date;
	String result;

	List<BoardFileDto> files;

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public int getFrb_group_num() {
		return frb_group_num;
	}

	public void setFrb_group_num(int frb_group_num) {
		this.frb_group_num = frb_group_num;
	}

	public String getM_nickname() {
		return m_nickname;
	}

	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}

	public String getFrb_title() {
		return frb_title;
	}

	public void setFrb_title(String frb_title) {
		this.frb_title = frb_title;
	}

	public String getFrb_content() {
		return frb_content;
	}

	public void setFrb_content(String frb_content) {
		this.frb_content = frb_content;
	}

	public int getFrb_hits() {
		return frb_hits;
	}

	public void setFrb_hits(int frb_hits) {
		this.frb_hits = frb_hits;
	}

	public String getFrb_delete_yn() {
		return frb_delete_yn;
	}

	public void setFrb_delete_yn(String frb_delete_yn) {
		this.frb_delete_yn = frb_delete_yn;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getFrb_insert_date() {
		return frb_insert_date;
	}

	public void setFrb_insert_date(String frb_insert_date) {
		this.frb_insert_date = frb_insert_date;
	}

	public String getFrb_update_date() {
		return frb_update_date;
	}

	public void setFrb_update_date(String frb_update_date) {
		this.frb_update_date = frb_update_date;
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
