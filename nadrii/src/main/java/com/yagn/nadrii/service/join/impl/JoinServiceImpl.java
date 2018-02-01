package com.yagn.nadrii.service.join.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.yagn.nadrii.common.Search;
import com.yagn.nadrii.service.domain.Join;
import com.yagn.nadrii.service.join.JoinDao;
import com.yagn.nadrii.service.join.JoinService;;


//==> ȸ������ ���� ����
@Service("joinServiceImpl")
public class JoinServiceImpl implements JoinService{
	
	///Field
	@Autowired
	@Qualifier("joinDaoImpl")
	private JoinDao joinDao;
	public void setJoinDao(JoinDao joinDao) {
		this.joinDao = joinDao;
	}
	
	///Constructor
	public JoinServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addJoin(Join join) throws Exception {
		joinDao.addJoin(join);
	}
	
	public String getGroupMaster(int groupNo) throws Exception{
		return joinDao.getGroupMaster(groupNo);
	}
	
	public Join getJoin(int joinNo) throws Exception {
		return joinDao.getJoin(joinNo);
	}

	public Map<String , Object > getJoinList(Search search) throws Exception {
		List<Join> list= joinDao.getJoinList(search);
		int totalCount = joinDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	public void updateJoin(Join join) throws Exception {
		joinDao.updateJoin(join);
	}
	
	public void deleteJoin(Join join) throws Exception {
		joinDao.deleteJoin(join);
	}
}