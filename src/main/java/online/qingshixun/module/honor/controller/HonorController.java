package online.qingshixun.module.honor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/honor")
public class HonorController {

	/**
	 * 加载荣誉证书的编辑窗口
	 * @return
	 */
	@RequestMapping("/edit")
	public String editHonor(Model model) {
		return "/honor/honor";
	}
}
