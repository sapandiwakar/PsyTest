package ch.epfl.psytest.web;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import ch.epfl.psytest.domain.Slide;

@RooWebScaffold(path = "slides", formBackingObject = Slide.class)
@RequestMapping("/slides")
@Controller
public class SlideController extends SimpleFormController{
	
	@RequestMapping(method = RequestMethod.POST)
	public String create(@Valid Slide slide, BindingResult bindingResult,
			Model uiModel, HttpServletRequest httpServletRequest) {
		System.out.println("Pulkit");
		System.out.println(getServletContext().getRealPath("/"));
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
