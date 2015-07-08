package com.quickHobby.weather;

/*
 * @name        : CityDTO
 * @date        : 2015. 7. 2.
 * @author      : 서인구
 * @description : 도시 정보에 대한 DTO
 */
public class CityDTO { 
	private String code = null; 
	private String name = null; 
	private String parentCode = null; 
	private String parentName = null; 
	private String gridX = null; 
	private String gridY = null; 

	public CityDTO(String code, String name, String gridX, String gridY, 
			String parentCode, String parentName) { 
		super(); 
		this.code = code; 
		this.name = name; 
		this.parentCode = parentCode; 
		this.parentName = parentName; 
		this.gridX = gridX; 
		this.gridY = gridY; 
	}

	public CityDTO(String code, String name, String parentCode, 
			String parentName) { 
		super(); 
		this.code = code; 
		this.name = name; 
		this.parentCode = parentCode; 
		this.parentName = parentName; 
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGridX() {
		return gridX;
	}

	public void setGridX(String gridX) {
		this.gridX = gridX;
	}

	public String getGridY() {
		return gridY;
	}

	public void setGridY(String gridY) {
		this.gridY = gridY;
	}
	public String getParentCode() {
		return parentCode;
	}

	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

}
