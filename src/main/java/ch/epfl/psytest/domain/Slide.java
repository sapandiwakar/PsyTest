package ch.epfl.psytest.domain;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

import javax.persistence.Transient;

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

	// save file to disk ,save filename , file size to database
	public void setFile(CommonsMultipartFile file) {
		this.file = file;
		this.fileName = file.getOriginalFilename();
		this.size = file.getSize();
		System.out.println("this.fileName: " + this.fileName + " ,  "
				+ file.getClass().getName());

		int dotPos = this.fileName.lastIndexOf(".");
		String extension = this.fileName.substring(dotPos + 1);

		File outputFile = new File(pathToSave + +new Date().getTime() + "." + extension);
		if (outputFile == null || !outputFile.exists()) {
			new File(pathToSave).mkdirs();
		}
		
		System.out.println(outputFile.getPath());
		System.out.println(outputFile.getAbsolutePath());

		try {
			InputStream in = file.getInputStream();
			FileOutputStream f = new FileOutputStream(pathToSave
					+ new Date().getTime() + "." + extension);

			int ch = 0;
			while ((ch = in.read()) != -1) {
				f.write(ch);
			}
			f.flush();
			f.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
