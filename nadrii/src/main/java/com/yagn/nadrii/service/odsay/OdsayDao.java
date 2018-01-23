package com.yagn.nadrii.service.odsay;

import java.util.List;

public interface OdsayDao {
	
	public List getPathStationsList(double sx, double sy, double ex, double ey) throws Exception;
	
	//public List get(double sx, double sy, double ex, double ey) throws Exception;

}
