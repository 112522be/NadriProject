package com.yagn.nadrii.service.purchase.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import com.yagn.nadrii.common.OpenApiSearch;
import com.yagn.nadrii.service.domain.KakaoPayRequest;
import com.yagn.nadrii.service.domain.KakaoPayResponse;
import com.yagn.nadrii.service.domain.Purchase;
import com.yagn.nadrii.service.purchase.PurchaseDao;

@Repository("purchaseDaoImpl")
public class PurchaseDaoImpl implements PurchaseDao {

	/// Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	/// Constructor
	public PurchaseDaoImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public void addPurchase(Purchase purchase) throws Exception {
		sqlSession.insert("PurchaseMapper.addPurchase", purchase);
	}
	
	@Override
	public List<Purchase> getBasketList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("PurchaseMapper.getBasketList", map);
	}
	
	@Override
	public int getTotalCount(String buyerId) throws Exception {
		return sqlSession.selectOne("PurchaseMapper.getTotalCount", buyerId);
	}
	
	@Override
	public List<Purchase> addBasketTicket(List<Integer> sendPostNo) throws Exception {
		return sqlSession.selectList("PurchaseMapper.getBasketTicket", sendPostNo);
	}
	
	/////////////////////////////////////////////////////////////////////////////
	@Override
	public KakaoPayResponse addKakaoPayment(KakaoPayRequest kakaoPayRequest) {
		return null;
	}
	@Override
	public KakaoPayResponse addKakaoPayComplete(KakaoPayRequest kakaoPayRequest) {
		return null;
	}
	
	
} // end of class
