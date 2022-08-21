package com.ps18371.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


@Service
public class ParamService {
	
	@Autowired
	ServletContext app;
	
	@Autowired
	HttpServletRequest request;
	
	public String getString(String name, String defaultValue){
		String value = request.getParameter(name);
		return value != null ? value : defaultValue;
	}
	
	public int getInt(String name, int defaultValue){
		String value = getString(name, String.valueOf(defaultValue));
		return Integer.parseInt(value);
	}
	
	public double getDouble(String name, double defaultValue){
		String value = getString(name, String.valueOf(defaultValue));
		return Double.parseDouble(value);
	}
	
	public boolean getBoolean(String name, boolean defaultValue){
		String value = getString(name, String.valueOf(defaultValue));
		return Boolean.parseBoolean(value);
	}
	
	public Date getDate(String name, String pattern){
		String value = getString(name, "");
		try {
			return new SimpleDateFormat(pattern).parse(value);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	@Autowired
	HttpServletRequest req;
	public File save(MultipartFile file) {
		if (file == null ) {
			return null;
		}
		File dir = new File(req.getRealPath("/images/category/"));
		if (!dir.exists()) {
			dir.mkdirs();
		}
		File newFile = new File(dir, file.getOriginalFilename());
		
		try {
			System.out.println("File: " + file);
			file.transferTo(newFile);
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		return newFile;
	}
}
