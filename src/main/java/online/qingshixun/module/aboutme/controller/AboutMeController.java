package online.qingshixun.module.aboutme.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import online.qingshixun.core.ResponseData;
import online.qingshixun.dto.AboutMeDTO;
import online.qingshixun.module.aboutme.service.AboutMeService;

@Controller
@RequestMapping("/about")
public class AboutMeController {
	
	@Autowired
	private AboutMeService aboutMeService;

	/**
	 * 加载关于我的编辑窗口
	 * @return
	 */
	@RequestMapping("/edit")
	public String editAboutMe(Model model, @RequestParam("aboutMeId") Long aboutMeId) {
		model.addAttribute("aboutMe", aboutMeService.getAboutMe(aboutMeId));
		model.addAttribute("educationDegree", aboutMeService.getEducationDegree());
		model.addAttribute("workingStatus", aboutMeService.getWorkingStatus());
		return "/aboutMe/AboutMe";
	}
	
	/**
	 * 新增或更新 关于我 的内容
	 * @return
	 */
	@RequestMapping(value = "/add")
	@ResponseBody
	public ResponseData saveOrUpdate(@ModelAttribute AboutMeDTO aboutMeDTO) {
		aboutMeService.saveOrUpdate(aboutMeDTO);
		return new ResponseData();
	}
}
