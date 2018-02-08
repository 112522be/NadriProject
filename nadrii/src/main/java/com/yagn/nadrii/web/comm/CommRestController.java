package com.yagn.nadrii.web.comm;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping("uploadImage")
	public JSONObject uploadImage(HttpServletRequest request) {
		String uploadPath ="C:\\Users\\"+System.getProperty("user.name")+"\\git\\NadriiProject\\nadrii\\WebContent\\resources\\images\\uploadedImages\\";
		String fileName = "";
		
		int size = 10 * 1024 * 1024;
		try {
			MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
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

	@RequestMapping("listHashTag")
	public List<String> listHashTag(@RequestParam String filePath) throws Exception {
		
		List<String> hashTags = commService.listHasgTag(filePath);
		return hashTags;
		
	}
	
	@RequestMapping("getHashtags")
	public List<String> getHashTags(@RequestParam String keyword) throws Exception{
		return commService.getHashtags(keyword);
	}
}
