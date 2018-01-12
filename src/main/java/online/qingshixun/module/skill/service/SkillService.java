package online.qingshixun.module.skill.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import online.qingshixun.dto.SkillDTO;
import online.qingshixun.module.skill.dao.SkillDaoMyBatis;

@Service
public class SkillService {

	@Autowired
	private SkillDaoMyBatis skillDao;
	
	/**
	 * 获取专业技能的信息
	 * @return List<SkillDTO>
	 */
	public List<SkillDTO> getSkills() {
		return skillDao.getSkills();
	}
	
	/**
	 * 根据id获取专业技能的信息
	 * @return List<SkillDTO>
	 */
	public List<SkillDTO> getSkill(String skillIds) {
		return skillDao.getSkill(skillIds);
	}

	/**
	 * 新增或更新专业技能的信息,并填充id
	 * 
	 * @param SkillDTO
	 */
	public void saveOrUpdate(List<SkillDTO> skillDTOs) {
		for (SkillDTO skillDTO : skillDTOs) {
			skillDao.saveOrUpdate(skillDTO);
		}
			
	}
}
