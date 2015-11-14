/**
 * 
 */
package com.commoncoupon.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SuppressWarnings("serial")
public class ImageServlet extends HttpServlet {
	
	private static final Logger logger = LoggerFactory.getLogger(ImageServlet.class);
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		serveImage(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		serveImage(request, response);	
	}
	
	public void serveImage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		OutputStream outStream = response.getOutputStream();
		FileInputStream fin = null;
		try {
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setContentType("image/gif");
			outStream = response.getOutputStream();
			File file = null;//new File(Configuration.Images_Dir_Path, URLDecoder.decode((request.getRequestURI().split("\\/", 3))[2], "UTF-8"));
			if(file.exists()){
				fin = new FileInputStream(file);
				byte b[] = new byte[1024];
				while(fin.available() > 0){
					int len = fin.read(b);
					outStream.write(b, 0, len);
				}
			}
		} catch(Exception e){
			logger.error("Exception in image servlet for uri - :"+request.getRequestURI(), e);
		} finally {
			if(outStream != null){
				outStream.flush();
				outStream.close();
			}
			if(fin != null) {
				fin.close();
			}
		}
	}

}
