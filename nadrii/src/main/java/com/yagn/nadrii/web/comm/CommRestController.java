package com.yagn.nadrii.web.comm;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yagn.nadrii.service.comm.CommService;

@RestController
@RequestMapping("/comm/*")
public class CommRestController {

	@Autowired
	@Qualifier("commServiceImpl")
	private CommService commService;

	@RequestMapping("listHashTag")
	public JSONObject listHashTag(HttpServletRequest request) throws Exception {
		String uploadPath ="C:\\Users\\"+System.getProperty("user.name")+"\\git\\NadriiProject\\nadrii\\WebContent\\resources\\images\\uploadedImages\\";
		String fileName = "";
		
		int size = 10 * 1024 * 1024;
		try {
			MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
			Enumeration files = multi.getFileNames();
			String file = (String) files.nextElement();
			fileName = multi.getFilesystemName(file);
		} catch (Exception e) {
			e.printStackTrace();
		}

		uploadPath += fileName;
		List<String> hashTags = commService.listHasgTag(uploadPath);
		JSONObject jobj = new JSONObject();
		jobj.put("url", uploadPath);
		jobj.put("listHashTag", hashTags);


		return jobj;
	}
}
