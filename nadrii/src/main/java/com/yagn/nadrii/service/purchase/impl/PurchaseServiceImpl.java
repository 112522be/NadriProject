package com.yagn.nadrii.service.purchase.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.yagn.nadrii.service.domain.Purchase;
import com.yagn.nadrii.service.purchase.PurchaseDao;
import com.yagn.nadrii.service.purchase.PurchaseService;

@Service("purchaseServiceImpl")
public class PurchaseServiceImpl implements PurchaseService {
	
	/// Field
		@Autowired
		@Qualifier("purchaseDaoImpl")
		private PurchaseDao purchaseDao;
		
		public void setPurchaseDao(PurchaseDao purchaseDao) {
			this.purchaseDao = purchaseDao;
		}
		
		/// Constructor
		public PurchaseServiceImpl() {
			System.out.println(this.getClass());
		}

		@Override
		public void addPurchase(Purchase purchase) throws Exception {
			purchaseDao.addPurchase(purchase);
		}

}
