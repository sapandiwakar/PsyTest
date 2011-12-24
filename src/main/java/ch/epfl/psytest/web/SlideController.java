package ch.epfl.psytest.web;

import ch.epfl.psytest.domain.Slide;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "slides", formBackingObject = Slide.class)
@RequestMapping("/slides")
@Controller
public class SlideController {
}
