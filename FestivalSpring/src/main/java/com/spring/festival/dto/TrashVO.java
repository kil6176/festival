package com.spring.festival.dto;

public class TrashVO  extends CommonDTO
{

	private int t_id;
	private double x;
	private double y;
	private int fc_num;
	private double t_can_height;
	private int t_height;
	private String fc_name;

	
	public String getFc_name()
	{
		return fc_name;
	}
	public void setFc_name(String fc_name)
	{
		this.fc_name = fc_name;
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
	
	
	
}
