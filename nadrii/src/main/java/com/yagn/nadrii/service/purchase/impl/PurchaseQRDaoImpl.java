package com.yagn.nadrii.service.purchase.impl;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;

import org.springframework.stereotype.Repository;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.yagn.nadrii.service.domain.KakaoPayRequest;
import com.yagn.nadrii.service.domain.KakaoPayResponse;
import com.yagn.nadrii.service.domain.Purchase;
import com.yagn.nadrii.service.purchase.PurchaseDao;

@Repository("purchaseQRDaoImpl")
public class PurchaseQRDaoImpl implements PurchaseDao {

	/// Field
	
	/// Constructor
	public PurchaseQRDaoImpl() {
		System.out.println(this.getClass());
	}


	@Override
	public String getQRCode(Purchase purchase) {
		
		System.out.println("\n[purchaseQRDaoImpl.java]::getQRCode");
		System.out.println("\n[Purchase Domain Check]==>" + purchase.toString());
		
		String returnQRCode = "";
		
		try {
			
			File file = null;
			// 큐알이미지를 저장할 디렉토리 지정
			file = new File("C:\\Users\\bitcamp\\git\\NadriProject\\nadrii\\WebContent\\resources\\qrcode");
			
			if (!file.exists()) {
				file.mkdirs();
			}
			
			// 코드인식시 보여질 티켓의 정보입력
			
			String ticketInfo = "티켓명 : " 
//					+ purchase.getTicketTitle() 
//				+ " / 회원이름 : " + purchase.getBuyerName() 
//				+ " / 아이디 : " + purchase.getBuyerId()
//				+ " / 예매일자 : " + purchase.getBookingDate()
				;
			
			String codeurl = new String(ticketInfo.getBytes("UTF-8"), "ISO-8859-1");
			// 큐알코드 바코드 생상값
			int qrcodeColor = 0xff000000;
			// 큐알코드 배경색상값
			int backgroundColor = 0xFFFFFFFF;

			QRCodeWriter qrCodeWriter = new QRCodeWriter();
			// 3,4번째 parameter값 : width/height값 지정
			BitMatrix bitMatrix = qrCodeWriter.encode(codeurl, BarcodeFormat.QR_CODE, 150, 150);
			//
			MatrixToImageConfig matrixToImageConfig = new MatrixToImageConfig(qrcodeColor, backgroundColor);
			BufferedImage bufferedImage = MatrixToImageWriter.toBufferedImage(bitMatrix, matrixToImageConfig);
			// ImageIO를 사용한 바코드 파일쓰기
			
			String userId = purchase.getBuyerId();
			ImageIO.write(bufferedImage, "png", new File("C:\\Users\\bitcamp\\git\\NadriProject\\nadrii\\WebContent\\resources\\qrcode\\QRCode&" + userId + ".jpg"));
			// QRCode&userID :: 의 형태로 QR코드 파일 생성됨
			
			returnQRCode = "QRCode&" + userId + ".jpg";
			
			System.out.println("\n[returnQRCode Check]==>" + returnQRCode);
			
			System.out.println("[QR코드 생성 완료]");
			System.out.println("[QR코드 확인 폴더 경로] :: " + file);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return returnQRCode;
	}
	
	////////////////////////////////////////////////////////////////////////////////////
	@Override
	public KakaoPayResponse addKakaoPayment(KakaoPayRequest kakaoPayRequest) {
		return null;
	}
	
	@Override
	public KakaoPayResponse addKakaoPayComplete(KakaoPayRequest kakaoPayRequest) {
		return null;
	}
	
	@Override
	public void addPurchase(Purchase purchase) throws Exception {
	}
	
	@Override
	public List<Purchase> getBasketList(Map<String, Object> map) throws Exception {
		return null;
	}
	
	@Override
	public int getTotalCount(String buyerId) throws Exception {
		return 0;
	}
	
	@Override
	public List<Purchase> addBasketTicket(List<Integer> sendPostNo) throws Exception {
		return null;
	}
	
	@Override
	public void updateBasketPurchase(List<Integer> postNo) throws Exception {
	}
	
	@Override
	public void deleteBasketList(List<Integer> postNo) throws Exception {
	}
	
	@Override
	public List<Purchase> getPurchaseList(Map<String, Object> map) throws Exception {
		return null;
	}
	
	
	
} // end of class
