package online.qingshixun.module.experience.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/experience")
public class ExperienceController {

	/**
	 * 加载工作经验的编辑窗口
	 * @return
	 */
	@RequestMapping("/edit")
	public String editExperience(Model model) {
		return "/experience/experience";
	}
}
