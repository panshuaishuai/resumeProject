package online.qingshixun.module.hobby.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hobby")
public class HobbyController {

	/**
	 * 加载爱好的编辑窗口
	 * @return
	 */
	@RequestMapping("/edit")
	public String editHobby(Model model) {
		return "/hobby/hobby";
	}
}
