package online.qingshixun.dto;

import java.sql.Timestamp;

public class BaseDTO {

	private Long id = 0L;
	
	private Timestamp createTime;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

}
