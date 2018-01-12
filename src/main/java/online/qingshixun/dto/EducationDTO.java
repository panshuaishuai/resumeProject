package online.qingshixun.dto;

public class EducationDTO extends BaseDTO {
	
	// 周期
	private String period;
	
	// 标题
	private String title;
	
	// 简介
	private String brief;

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBrief() {
		return brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}
}