package online.qingshixun.dto;

public class SkillDTO extends BaseDTO {

	// 名称
	private String name;
	
	// 简介
	private int level;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

}