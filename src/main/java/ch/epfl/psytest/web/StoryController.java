package ch.epfl.psytest.web;

import ch.epfl.psytest.domain.Story;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "storys", formBackingObject = Story.class)
@RequestMapping("/storys")
@Controller
public class StoryController {
}
