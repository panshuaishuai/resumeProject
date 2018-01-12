package online.qingshixun.module.index.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import online.qingshixun.core.ResponseData;

/**
 * 上传文件 Controller 类
 */
@Controller
@RequestMapping("/file")
public class FileUploadController extends BaseController {

	/**
	 * 上传图片
	 *
	 * @param request
	 * @param response
	 * @param image
	 *            批量上传图片数组
	 * @return
	 */
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	@ResponseBody
	public ResponseData doUploadImage(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("files") MultipartFile files) throws Exception {
		// 数据返回给jsp页面
		ResponseData responseData = new ResponseData();
		try {
			// 保存上传图片
			saveUploadFile(files, getRealPath() + "/image/");
		} catch (Exception e) {
			// 异常处理
			responseData.setError(e.getMessage());
		}
		return responseData;
	}

	/**
	 * 保存上传图片
	 * 
	 * @param files
	 * @param imageFilePath
	 *            文件上传路径
	 */
	public void saveUploadFile(MultipartFile files, String imageFilePath) throws IOException {
		String filePath = imageFilePath + files.getOriginalFilename();
		File uploadFile = new File(filePath);
		File dir = uploadFile.getParentFile();
		// 如果父级文件夹不存在则创建文件夹
		if (!dir.exists()) {
			dir.mkdirs();
		}
		FileCopyUtils.copy(files.getBytes(), uploadFile);
	}
}
