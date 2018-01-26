package com.yagn.nadrii.service.comm.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.comm.CommDao;
import com.yagn.nadrii.service.comm.CommOpenAPIDao;
import com.yagn.nadrii.service.comm.CommService;
import com.yagn.nadrii.service.domain.Community;

@Service("commServiceImpl")
public class CommServiceImpl implements CommService {
	
	@Autowired
	@Qualifier("commDaoImpl")
	private CommDao commDao;
	@Autowired
	@Qualifier("commOpenAPIDaoImpl")
	private CommOpenAPIDao openAPIDao;

	@Override
	public int addComm(Community community) {
		return commDao.addComm(community);
	}

	@Override
	public Community getComm(int postNo) {
		return commDao.getComm(postNo);
	}

	@Override
	public Map<String, Object> listComm(Search search) {
		List<Community> list = commDao.listComm(search);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int totalCount = commDao.getTotalCount(search);
		resultMap.put("listComm", list);
		resultMap.put("search", search);
		resultMap.put("totalCount", totalCount);
		return resultMap;
	}

	@Override
	public void updateComm(Community community) {
		commDao.updateComm(community);
	}

	@Override
	public void deleteComm(int postNo) {
		commDao.deleteComm(postNo);
	}

	@Override
	public List<String> listHasgTag(String filePath) throws Exception{
		String cloudVisionResult = openAPIDao.getImageResult(filePath);
		String translatedResult = openAPIDao.getTranslatedResult(cloudVisionResult).toString();	
		String[] temp = translatedResult.split(",");
		List<String> result = new ArrayList<>();
		for(int i=0; i<temp.length;i++) {
			result.add(temp[i]);
		}
		return result;
	}

}
