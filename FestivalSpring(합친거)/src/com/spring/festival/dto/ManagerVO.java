package com.spring.festival.dto;

public class ManagerVO extends CommonDTO
{
	private String m_id;
	private String m_authority;
	private int t_id;
	private double x;
	private double y;
	private int fc_num;
	private double t_can_height;
	private int t_height;
	private String fc_name;
	private int trash_persent;
	private int trashCanCount;
	
	public int getTrash_persent()
	{
		return trash_persent;
	}

	public void setTrash_persent(int trash_persent)
	{
		this.trash_persent = trash_persent;
	}

	public int getTrashCanCount() {
		return trashCanCount;
	}

	public void setTrashCanCount(int trashCanCount) {
		this.trashCanCount = trashCanCount;
	}

	public String getM_id()
	{
		return m_id;
	}

	public void setM_id(String m_id)
	{
		this.m_id = m_id;
	}

	public String getM_authority()
	{
		return m_authority;
	}

	public void setM_authority(String m_authority)
	{
		this.m_authority = m_authority;
	}

	public int getT_id()
	{
		return t_id;
	}

	public void setT_id(int t_id)
	{
		this.t_id = t_id;
	}

	public double getX()
	{
		return x;
	}

	public void setX(double x)
	{
		this.x = x;
	}

	public double getY()
	{
		return y;
	}

	public void setY(double y)
	{
		this.y = y;
	}

	public int getFc_num()
	{
		return fc_num;
	}

	public void setFc_num(int fc_num)
	{
		this.fc_num = fc_num;
	}

	public double getT_can_height()
	{
		return t_can_height;
	}

	public void setT_can_height(double t_can_height)
	{
		this.t_can_height = t_can_height;
	}

	public int getT_height()
	{
		return t_height;
	}

	public void setT_height(int t_height)
	{
		this.t_height = t_height;
	}

	public String getFc_name()
	{
		return fc_name;
	}

	public void setFc_name(String fc_name)
	{
		this.fc_name = fc_name;
	}

}
