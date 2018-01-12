package online.qingshixun.module.aboutme.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import online.qingshixun.core.MyBatisRepository;
import online.qingshixun.dto.AboutMeDTO;
import online.qingshixun.dto.EducationDegreeDTO;
import online.qingshixun.dto.WorkingStatusDTO;

@MyBatisRepository
public interface AboutMeDaoMyBatis {
	
	/**
	 * 获取学历信息
	 * @return List<EducationDegreeDTO>
	 */
	List<EducationDegreeDTO> getEducationDegree();
	
	/**
	 * 获取工作状态信息
	 * @return List<EducationDegreeDTO>
	 */
	List<WorkingStatusDTO> getWorkingStatus();
	
	/**
	 * 获取关于我的信息
	 * @return AboutMeDTO
	 */
	AboutMeDTO getAboutMes();

	/**
	 * 根据id获取关于我的信息
	 * 
	 * @param aboutMeId
	 * @return AboutMeDTO
	 */
	AboutMeDTO getAboutMe(@Param("aboutMeId") Long aboutMeId);

	/**
	 * 新增或更新关于我的信息，并填充id
	 * 
	 * @param aboutMeDTO
	 */
	void saveOrUpdate(AboutMeDTO aboutMeDTO);
}
