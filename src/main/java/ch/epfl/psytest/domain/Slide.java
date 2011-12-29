package ch.epfl.psytest.domain;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.persistence.Transient;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@RooJavaBean
@RooToString
@RooEntity
public class Slide {

	private String description;

	private static String pathToSave = "tempDir/";

	@Transient
	private CommonsMultipartFile file; // added

	private String fileName; // added
	private long size; // added

	public CommonsMultipartFile getFile() {
		return file;
	}

	// save file to disk ,save filename, file size to database
	public void setFile(CommonsMultipartFile file) {
//		this.file = file;		
//		String tempFileName = file.getOriginalFilename();
//		this.size = file.getSize();
////		System.out.println("this.fileName: " + this.fileName + " ,  "
////				+ file.getClass().getName());
//
//		int dotPos = tempFileName.lastIndexOf(".");
//		String extension = tempFileName.substring(dotPos + 1);
//		this.fileName = new Date().getTime() + "." + extension; 
//
//		File outputFile = new File(pathToSave + fileName);
//		if (outputFile == null || !outputFile.exists()) {
//			new File(pathToSave).mkdirs();
//		}
//		try {
//			file.transferTo(outputFile);
//		} catch (IllegalStateException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		} catch (IOException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
////		System.out.println(outputFile.getPath());
////	System.out.println(outputFile.getAbsolutePath());
////
////		try {
////			InputStream in = file.getInputStream();
////			FileOutputStream f = new FileOutputStream(pathToSave
////					+ fileName);
////
////			int ch = 0;
////			while ((ch = in.read()) != -1) {
////				f.write(ch);
////			}
////			f.flush();
////			f.close();
////		} catch (FileNotFoundException e) {
////			// TODO Auto-generated catch block
////			e.printStackTrace();
////		} catch (IOException e) {
////			// TODO Auto-generated catch block
////			e.printStackTrace();
////		}
//		this.fileName = outputFile.getAbsolutePath();
	}
}
