package com.yagn.nadrii.service.comm.impl;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.JavaType;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Repository;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.ImageSource;
import com.google.cloud.vision.v1.LocationInfo;
import com.google.cloud.vision.v1.WebDetection;
import com.google.cloud.vision.v1.WebDetection.WebEntity;
import com.google.cloud.vision.v1.WebDetection.WebImage;
import com.google.cloud.vision.v1.WebDetection.WebPage;
import com.yagn.nadrii.service.comm.CommOpenAPIDao;
        
@Repository("commOpenAPIDaoImpl")
public class CommOpenAPIDaoImpl implements CommOpenAPIDao {

	@Override
	public String getImageResult(String filename, PrintStream out) throws Exception {
		HttpClient httpClient = new DefaultHttpClient();
		String url = "https://vision.googleapis.com/v1/images:annotate?key=AIzaSyDn7y8YBw6t2udCzfFw5HiuiMJNTyZlIk8";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type","application/json");

		AnnotateImageRequest annotateImageRequest = AnnotateImageRequest.getDefaultInstance();
		Feature feature1 = Feature.newBuilder().setType(Type.LANDMARK_DETECTION).build();
		Feature feature2 = Feature.newBuilder().setType(Type.LABEL_DETECTION).build();
		Feature feature3 = Feature.newBuilder().setType(Type.WEB_DETECTION).build();		
		ImageSource imageSource = ImageSource.newBuilder().setImageUri("../resources/images/16700442525_688f48b58b_b.jpg").build();

		Image image = Image.newBuilder().setSource(imageSource).build();
		List<AnnotateImageRequest> requests = new ArrayList<AnnotateImageRequest>();
		requests.add(annotateImageRequest);
		annotateImageRequest = annotateImageRequest.newBuilder().setImage(image).addFeatures(feature2).build();
		System.out.println("55");
		try(ImageAnnotatorClient client = ImageAnnotatorClient.create()){
			BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
			System.out.println("66");
			List<AnnotateImageResponse> responses = response.getResponsesList();
			System.out.println("77");
			for(AnnotateImageResponse res : responses) {
				if(res.hasError()) {
					out.printf("Error: %s\n", res.getError().getMessage());
					return null;
				}
				WebDetection annotation = res.getWebDetection();
				out.println("Entity:Id:Scorce");
				for (WebEntity entity : annotation.getWebEntitiesList()) {
			        out.println(entity.getDescription() + " : " + entity.getEntityId() + " : "
			            + entity.getScore());
			    }
			    out.println("\nPages with matching images: Score\n==");
			    for (WebPage page : annotation.getPagesWithMatchingImagesList()) {
			    	out.println(page.getUrl() + " : " + page.getScore());
			    }
			    out.println("\nPages with partially matching images: Score\n==");
			    for (WebImage image1 : annotation.getPartialMatchingImagesList()) {
			    	out.println(image1.getUrl() + " : " + image1.getScore());
			    }
			    out.println("\nPages with fully matching images: Score\n==");
			    for (WebImage image1 : annotation.getFullMatchingImagesList()) {
			    	out.println(image1.getUrl() + " : " + image1.getScore());
			    }
			}
			return "¼º°ø";
		}
}
//		ObjectMapper mapper = new ObjectMapper();
//		System.out.println(annotateImageRequest);
//		String jsonValue = mapper.writeValueAsString(requests);		
//		HttpEntity httpEntity = new StringEntity(jsonValue.toString());
//		System.out.println(jsonValue.toString());
//		
//		httpPost.setEntity(httpEntity);
//		HttpResponse httpResponse = httpClient.execute(httpPost);
//		
//		System.out.println(httpResponse);
//		
//		httpEntity = httpResponse.getEntity();
//		
//		InputStream is = httpEntity.getContent();
//		BufferedReader br = new BufferedReader(new InputStreamReader(is, "utf-8"));
//		
//		JSONObject jsonobj = (JSONObject)JSONValue.parse(br);
//		

	@Override
	public JSONObject getTranslatedResult(String result) throws Exception {
		HttpClient httpClient = new DefaultHttpClient();
		String url="https://openapi.naver.com/v1/papago/n2mt";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("X-Naver-Client-Id","hkuEu0FBgOT1dsQixJU3");
		httpPost.setHeader("X-Naver-Client-Secret", "dm1JX0XXqi");
		httpPost.setHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
		httpPost.setHeader("Accept", "application/json");
		
		String request = "source=en&target=ko&text="+result;
		
		HttpEntity httpEntity = new ByteArrayEntity(request.getBytes());
		httpPost.setEntity(httpEntity);
		HttpResponse response = httpClient.execute(httpPost);
		httpEntity = response.getEntity();
		
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "utf-8"));
		
		JSONObject object = (JSONObject)JSONValue.parse(br);
		
		return object;
	}

}
