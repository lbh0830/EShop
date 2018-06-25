package com.shop.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;
import com.shop.model.CommodityBean;
import com.shop.service.CommodityService;

@WebServlet("/CommodityAdd")
public class CommodityAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CommodityAdd() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CommodityService commodityService = (CommodityService) getServletContext().getAttribute("commodityService");
		CommodityBean cb = new CommodityBean();
		cb.setName(req.getParameter("valName"));
		cb.setCategory(req.getParameter("valCategory"));
		cb.setPrice(Integer.parseInt(req.getParameter("valPrice")));
		cb.setQuantity(Integer.parseInt(req.getParameter("valQuantity")));
		cb.setDetail(req.getParameter("valDetail"));
		cb.setSpec(req.getParameter("valSpec"));
		SmartUpload su = new SmartUpload();
		su.initialize(getServletConfig(), req, resp);
		su.setAllowedFilesList("png,jpg,bmp,gif");
		try {  
//            su.setDeniedFilesList("exe,jsp,bat,html,,");  
            su.upload();  
            Long time=new Date().getTime();  
            String ext=su.getFiles().getFile(0).getFileExt();//获取文件后缀   
            String filename=time+"."+ext;  
            //smart.getFiles().getFile(0).saveAs( "/img/ "+filename);//保存在容器目录下  
//            String pa=this.getServletContext().getRealPath("/")+"images"+java.io.File.separator+filename;  
//            System.out.println(pa);  
              
            su.getFiles().getFile(0).saveAs("/images"+filename);  
            //          smart.save("img");  
//            Request smartReq  =su.getRequest();  
//            String name=smartReq.getParameter("name");  
//            resp.getWriter().println(name);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
		cb.setImage("filename");
		commodityService.add(cb);
		resp.sendRedirect("Commodity?do=admin");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
