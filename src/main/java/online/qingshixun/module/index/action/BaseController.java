package online.qingshixun.module.index.action;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

public abstract class BaseController {

	// 注入request
	@Autowired
	protected HttpServletRequest request;

	/**
	 * 获取webapp路径的地址
	 * 
	 * @return
	 */
	protected String getRealPath() {
		return request.getServletContext().getRealPath("/");
	}
}
