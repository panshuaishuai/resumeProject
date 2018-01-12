package online.qingshixun.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AboutMeDTO extends BaseDTO {

	// 姓名
	private String name;

	// 性别
	private String gender;

	// 生日
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;

	// 人生格言
	private String motto;

	// 学历
	private EducationDegreeDTO educationDegree = new EducationDegreeDTO();

	// 工作年限
	private String workingYears;

	// 工作状态
	private WorkingStatusDTO workingStatus = new WorkingStatusDTO();

	// 居住地
	private String residence;

	// 邮件
	private String email;

	// 手机
	private String mobile;

	// 简历文件
	private String resumeFile;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public String getBirthdayStr() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = formatter.format(birthday);
		return dateString;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getMotto() {
		return motto;
	}

	public void setMotto(String motto) {
		this.motto = motto;
	}

	public EducationDegreeDTO getEducationDegree() {
		return educationDegree;
	}

	public void setEducationDegree(EducationDegreeDTO educationDegree) {
		this.educationDegree = educationDegree;
	}

	public String getWorkingYears() {
		return workingYears;
	}

	public void setWorkingYears(String workingYears) {
		this.workingYears = workingYears;
	}

	public WorkingStatusDTO getWorkingStatus() {
		return workingStatus;
	}

	public void setWorkingStatus(WorkingStatusDTO workingStatus) {
		this.workingStatus = workingStatus;
	}

	public String getResidence() {
		return residence;
	}

	public void setResidence(String residence) {
		this.residence = residence;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getResumeFile() {
		return resumeFile;
	}

	public void setResumeFile(String resumeFile) {
		this.resumeFile = resumeFile;
	}

}
