package com.yagn.nadrii.service.odsay.impl;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.yagn.nadrii.service.domain.odsay.outside.OBJ;
import com.yagn.nadrii.service.odsay.OdsayDao;
import com.yagn.nadrii.service.odsay.OdsayService;

@Service("odsayServiceImpl")
public class OdsayServiceImpl implements OdsayService{

	@Autowired
	@Qualifier("odsayDaoImpl")
	private OdsayDao odsayDao;
	public void setOdsayDao(OdsayDao odsayDao) {
		this.odsayDao = odsayDao;
	}

	public OdsayServiceImpl() {
		System.out.println(this.getClass());
	}
	
	public OBJ getOutTerminal(double sx, double sy, double ex, double ey) throws Exception {
		
		System.out.println("@@sx@@"+sx);
		System.out.println("@@sx@@"+sy);
		System.out.println("@@sx@@"+ex);
		System.out.println("@@sx@@"+ey);
		
		HttpClient httpclient = new DefaultHttpClient();
		
		String url = "https://api.odsay.com/api/searchPubTransPath?apiKey=0ObaGjz7q8kLrzbsVutNT0qpRKpduNy7cnS9HDogmsk&lang=0";
		if(sx != 0 && sy != 0 && ex != 0 && ey != 0) {
			url+="&SX="+sx+"&SY="+sy+"&EX="+ex+"&EY="+ey;
		}
		
		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Content-Type", "application/json;charset=utf-8");
		
		HttpResponse res = httpclient.execute(httpGet);
		
		System.out.println(res);
		System.out.println();
		
		HttpEntity httpEntity = res.getEntity();
		System.out.println("1");
		InputStream is = httpEntity.getContent();
		System.out.println("1");
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "utf-8"));
		System.out.println("1");
		List list = new ArrayList();
		System.out.println("1");
		JSONObject jsonobj = (JSONObject)JSONValue.parse(br);
		JSONObject result = (JSONObject)jsonobj.get("result");
		JSONObject trainRequest = (JSONObject)result.get("outBusRequest");
		JSONArray OBJArray = (JSONArray)trainRequest.get("OBJ");
//		for (int i = 0; i < OBJArray.size(); i++) {
//			JSONObject Object = (JSONObject)OBJArray.get(i);
//			System.out.println("[4] Object["+i+"] : "+Object);
		
		System.out.println("1");
		
		
		JSONObject Object = (JSONObject)OBJArray.get(0);
		System.out.println("[4] Object["+0+"] : "+Object);
		OBJ obj = new OBJ();
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(Object.toString());
		String startSTN = element.getAsJsonObject().get("startSTN").getAsString();
		String startID = element.getAsJsonObject().get("startID").getAsString();
		String SX = element.getAsJsonObject().get("SX").getAsString();
		String SY = element.getAsJsonObject().get("SY").getAsString();
		String endSTN = element.getAsJsonObject().get("endSTN").getAsString();
		String endID = element.getAsJsonObject().get("endID").getAsString();
		String EX = element.getAsJsonObject().get("EX").getAsString();
		String EY = element.getAsJsonObject().get("EY").getAsString();
		String time = element.getAsJsonObject().get("time").getAsString();
		String payment = element.getAsJsonObject().get("payment").getAsString();
		String mapOBJ = element.getAsJsonObject().get("mapOBJ").getAsString();

		System.out.println("2");
		
		obj.setStartSTN(startSTN);
		obj.setStartID(Integer.parseInt(startID));
		obj.setSX(Double.parseDouble(SX));
		obj.setSY(Double.parseDouble(SY));
		obj.setEndSTN(endSTN);
		obj.setEndID(Integer.parseInt(endID));
		obj.setEX(Double.parseDouble(EX));
		obj.setEY(Double.parseDouble(EY));
		obj.setTime(Integer.parseInt(time));
		obj.setPayment(Integer.parseInt(payment));
		obj.setMapOBJ(mapOBJ);

		System.out.println("3");
		
		// trainRequestÀÏ¶§¸¸
		if (element.getAsJsonObject().get("trainType") != null) {
			String trainType = element.getAsJsonObject().get("trainType").getAsString();
			obj.setTrainType(trainType);
		}
		if (element.getAsJsonObject().get("trainCode") != null) {
			String trainCode = element.getAsJsonObject().get("trainCode").getAsString();
			obj.setTrainCode(trainCode);
		}

		System.out.println("///////////");
		System.out.println(obj);
		return obj;
	}
		
}
