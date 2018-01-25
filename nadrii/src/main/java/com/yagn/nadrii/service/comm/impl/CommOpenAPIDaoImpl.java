package com.yagn.nadrii.service.comm.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;

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
import com.yagn.nadrii.service.comm.CommOpenAPIDao;
                     
public class CommOpenAPIDaoImpl implements CommOpenAPIDao {
	
	public static void main(String[] args) throws Exception {
		System.out.println(CommOpenAPIDaoImpl.getImageResult(null));
	}

	public static String getImageResult(String filename) throws Exception {
		HttpClient httpClient = new DefaultHttpClient();
		String url = "https://vision.googleapis.com/v1/images:annotate?key=AIzaSyDn7y8YBw6t2udCzfFw5HiuiMJNTyZlIk8";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type","application/json");
		
		AnnotateImageRequest annotateImageRequest = AnnotateImageRequest.getDefaultInstance();
		Feature feature1 = Feature.newBuilder().setType(Type.LANDMARK_DETECTION).build();
		Feature feature2 = Feature.newBuilder().setType(Type.LABEL_DETECTION).build();
		Feature feature3 = Feature.newBuilder().setType(Type.WEB_DETECTION).build();		
		ImageSource imageSource = ImageSource.newBuilder().setImageUri("gs://nadlii/16700442525_688f48b58b_b.jpg").build();
		
		Image image = Image.newBuilder().setSource(imageSource).build();
		List<AnnotateImageRequest> requests = new ArrayList<AnnotateImageRequest>();
		requests.add(annotateImageRequest);
		annotateImageRequest = annotateImageRequest.newBuilder().setImage(image).addFeatures(feature2).build();
		
		ImageAnnotatorClient client = ImageAnnotatorClient.create();
		
		
		
		
		
		BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
		List<AnnotateImageResponse> responses = response.getResponsesList();
		
		for(AnnotateImageResponse res : responses) {
			if(res.hasError()) {
				return null;
			}
			for(EntityAnnotation annotation : res.getLandmarkAnnotationsList()) {
				LocationInfo info = annotation.getLocationsList().listIterator().next();
				System.out.println(annotation.getDescription()+info.getLatLng());
				
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
		return "";
	}

	@Override
	public String getTranslatedResult(String result) throws Exception {
		return null;
	}

}
