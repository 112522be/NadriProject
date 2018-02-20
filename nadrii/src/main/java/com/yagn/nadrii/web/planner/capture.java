package com.yagn.nadrii.web.planner;

import java.io.FileOutputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.portlet.ModelAndView;
@RestController
@RequestMapping("/planner/*")
public class capture {
	
	@RequestMapping(value="/capture")
    public ModelAndView createImage (HttpServletRequest request) throws Exception{
        System.out.println("capture controller 접속");
        String binaryData = request.getParameter("imgSrc");
        FileOutputStream stream = null;
        ModelAndView mav = new ModelAndView();
        mav.setViewName("jsonView");        
        try{
            System.out.println("binary file   "  + binaryData);
            if(binaryData == null || binaryData=="") {
            		System.out.println("데이터가 null");
                throw new Exception();    
            }
            System.out.println("11111111111");
            binaryData = binaryData.replaceAll("data:image/png;base64,", "");
            byte[] file = Base64.decodeBase64(binaryData);
            System.out.println("file  :::::::: " + file + " || " + file.length);
            String fileName=  UUID.randomUUID().toString();
            
            System.out.println("22222222222");
            stream = new FileOutputStream("/Users/hansangwoo/eclipse-workspace/nadrii2/WebContent/resources/images/planner/thumbnail"+fileName+".png");
            System.out.println("file이름 : "+fileName);
            stream.write(file);
            stream.close();
            System.out.println("파일 작성 완료");
            mav.addObject("msg","ok");
            
        }catch(Exception e){
            System.out.println("파일이 정상적으로 넘어오지 않았습니다");
            mav.addObject("msg","no");
            return mav;
        }finally {
        		stream.close();
        }
        return mav;
        
    }

}
