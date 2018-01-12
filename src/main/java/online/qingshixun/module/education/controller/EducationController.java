package online.qingshixun.module.education.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/education")
public class EducationController {

	/**
	 * 加载教育经历的编辑窗口
	 * @return
	 */
	@RequestMapping("/edit")
	public String editAboutMe(Model model) {
		return "/education/education";
	}
}
