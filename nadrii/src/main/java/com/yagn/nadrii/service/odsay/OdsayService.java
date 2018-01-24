package com.yagn.nadrii.service.odsay;

import com.yagn.nadrii.service.domain.odsay.outside.OBJ;

public interface OdsayService {

	public OBJ getOutTerminal(double sx, double sy, double ex, double ey) throws Exception;
}
