package online.qingshixun.module.skill.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import online.qingshixun.core.MyBatisRepository;
import online.qingshixun.dto.SkillDTO;

@MyBatisRepository
public interface SkillDaoMyBatis {

	/**
	 * 获取专业技能的信息
	 * @return List<SkillDTO>
	 */
	List<SkillDTO> getSkills();
	
	/**
	 * 根据id获取专业技能的信息
	 * @return List<SkillDTO>
	 */
	List<SkillDTO> getSkill(@Param("skillIds") String skillIds);

	/**
	 * 新增或更新专业技能的信息,并填充id
	 * 
	 * @param SkillDTO
	 */
	void saveOrUpdate(SkillDTO skillDTO);
}
