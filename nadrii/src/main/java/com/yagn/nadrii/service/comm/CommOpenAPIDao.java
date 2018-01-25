package com.yagn.nadrii.service.comm;

import java.io.PrintStream;

import org.json.simple.JSONObject;

public interface CommOpenAPIDao {
	public String getImageResult(String filename, PrintStream out) throws Exception;
	public JSONObject getTranslatedResult(String result) throws Exception;
}
