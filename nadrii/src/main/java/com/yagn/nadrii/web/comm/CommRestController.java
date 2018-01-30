package com.yagn.nadrii.web.comm;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.oreilly.servlet.MultipartRequest;
import com.yagn.nadrii.service.comm.CommService;

@RestController
@RequestMapping("/comm/*")
public class CommRestController {

	@Autowired
	@Qualifier("commServiceImpl")
	private CommService commService;

	@RequestMapping("listHashTag")
	public JSONObject listHashTag(@RequestParam String fileName, HttpServletRequest request) {
		String uploadPath = System.getProperty("user.dir") + "/resources/images/uploadedImages";

		int size = 10 * 1024 * 1024;
		try {
			MultipartRequest multi = new MultipartRequest(request, uploadPath, size);
			Enumeration files = multi.getFileNames();
			String file = (String) files.nextElement();
			fileName = multi.getFilesystemName(file);
		} catch (Exception e) {
			e.printStackTrace();
		}

		uploadPath += fileName;
		JSONObject jobj = new JSONObject();
		jobj.put("url", uploadPath);

		return jobj;
	}
}
