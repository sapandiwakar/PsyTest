package ch.epfl.psytest.web;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import ch.epfl.psytest.domain.Slide;

@RooWebScaffold(path = "slides", formBackingObject = Slide.class)
@RequestMapping("/slides")
@Controller
public class SlideController extends SimpleFormController{
	
	private String uploadedFilesDir = "uploadedFiles";

	@RequestMapping(method = RequestMethod.POST)
	public String create(@Valid Slide slide, BindingResult bindingResult,
			Model uiModel, HttpServletRequest httpServletRequest) {
//		System.out.println(getServletContext().getRealPath("/"));
		
		File outputDir = new File (getServletContext().getRealPath("/")+uploadedFilesDir);
		if (!outputDir.exists()) {
			outputDir.mkdirs();
		}
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)httpServletRequest;
		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
		for (MultipartFile f : fileMap.values()) {
			int dotPos = f.getOriginalFilename().lastIndexOf(".");
			String extension = f.getOriginalFilename().substring(dotPos + 1);
			slide.setFileName (new Date().getTime() + "." + extension);
			File outputFile = new File (getServletContext().getRealPath("/")+uploadedFilesDir+"/"+slide.getFileName());
			try {
				f.transferTo(outputFile);
			} catch (IllegalStateException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		
		if (bindingResult.hasErrors()) {
			uiModel.addAttribute("slide", slide);
			return "slides/create";
		}
		uiModel.asMap().clear();
		slide.persist();
		return "redirect:/slides/"
				+ encodeUrlPathSegment(slide.getId().toString(),
						httpServletRequest);
	}

	String encodeUrlPathSegment(String pathSegment,
			HttpServletRequest httpServletRequest) {
		String enc = httpServletRequest.getCharacterEncoding();
		if (enc == null) {
			enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
		}
		try {
			pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
		} catch (UnsupportedEncodingException uee) {
		}
		return pathSegment;
	}
}
