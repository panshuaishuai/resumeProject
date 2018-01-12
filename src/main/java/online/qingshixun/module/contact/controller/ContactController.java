package online.qingshixun.module.contact.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/contact")
public class ContactController {

	/**
	 * 加载联系我的编辑窗口
	 * @return
	 */
	@RequestMapping("/edit")
	public String editContact(Model model) {
		return "/contact/contact";
	}
}
