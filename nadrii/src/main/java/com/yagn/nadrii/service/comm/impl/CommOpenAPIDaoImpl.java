package com.yagn.nadrii.service.comm.impl;

import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.springframework.stereotype.Repository;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.yagn.nadrii.service.comm.CommOpenAPIDao;

@Repository("commOpenAPIDaoImpl")
public class CommOpenAPIDaoImpl implements CommOpenAPIDao {

	@Override
	public String getImageResult(String filename){
		HttpClient httpClient = new DefaultHttpClient();
		
		String url="https://vision.googleapis.com/v1/images:annotate?key=AIzaSyDn7y8YBw6t2udCzfFw5HiuiMJNTyZlIk8";
		HttpPost httpPost = new HttpPost();
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		
		return null;
	}
	

	@Override
	public String getTranslatedResult(String result) {
		return null;
	}

}
