package online.qingshixun.module.skill.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import online.qingshixun.core.ResponseData;
import online.qingshixun.dto.SkillDTO;
import online.qingshixun.module.skill.service.SkillService;

@Controller
@RequestMapping("/skill")
public class SkillController {

	@Autowired
	private SkillService skillService;
	
	/**
	 * 加载专业技能的编辑窗口
	 * @return
	 */
	@RequestMapping("/edit")
	public String editSkill(Model model, @RequestParam("skillIds") String skillIds) {
		model.addAttribute("skills", skillService.getSkill(skillIds));
		return "/skill/skill";
	}
	
	/**
	 * 新增或更新专业技能
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public ResponseData saveOrUpdate(Model model, @RequestBody List<SkillDTO> skillDTOs) {
		skillService.saveOrUpdate(skillDTOs);
	return new ResponseData();
	}
}
