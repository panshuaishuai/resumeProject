package online.qingshixun.module.aboutme.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import online.qingshixun.dto.AboutMeDTO;
import online.qingshixun.dto.EducationDegreeDTO;
import online.qingshixun.dto.WorkingStatusDTO;
import online.qingshixun.module.aboutme.dao.AboutMeDaoMyBatis;

@Service
public class AboutMeService {

	@Autowired
	private AboutMeDaoMyBatis aboutMeDao;
	
	/**
	 * 获取学历信息
	 * @return List<EducationDegreeDTO>
	 */
	public List<EducationDegreeDTO> getEducationDegree() {
		return aboutMeDao.getEducationDegree();
	}
	
	/**
	 * 获取工作状态信息
	 * @return List<EducationDegreeDTO>
	 */
	public List<WorkingStatusDTO> getWorkingStatus() {
		return aboutMeDao.getWorkingStatus();
	}
	
	/**
	 * 获取关于我的信息列表
	 * @return List<AboutMeDTO>
	 */
	public AboutMeDTO getAboutMes() {
		return aboutMeDao.getAboutMes();
	}
	
	/**
	 * 根据id获取关于我的信息
	 * 
	 * @param aboutMeId
	 * @return AboutMeDTO
	 */
	public AboutMeDTO getAboutMe(Long aboutMeId) {
		return aboutMeDao.getAboutMe(aboutMeId);
	}
	
	/**
	 * 新增或更新关于我的信息，并填充id
	 * @param aboutMeDTO
	 */
	public void saveOrUpdate(AboutMeDTO aboutMeDTO) {
		aboutMeDao.saveOrUpdate(aboutMeDTO);
	}
}
