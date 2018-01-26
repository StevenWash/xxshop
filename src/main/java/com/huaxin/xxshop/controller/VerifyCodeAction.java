package com.huaxin.xxshop.controller;

import com.huaxin.xxshop.util.VerifyCodeUtil;
import org.apache.struts2.interceptor.SessionAware;

import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.util.Map;

public class VerifyCodeAction implements SessionAware {

	Map<String, Object> session;
	BufferedOutputStream outputStream;

	public String execute() {
		VerifyCodeUtil vc = new VerifyCodeUtil();
		BufferedImage image = vc.getImage();
		try {
			VerifyCodeUtil.output(image, outputStream);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		session.put("vCode", vc.getText());
		return "success";
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}

	public BufferedOutputStream getOutputStream() {
		return outputStream;
	}

	public void setOutputStream(BufferedOutputStream outputStream) {
		this.outputStream = outputStream;
	}

}
