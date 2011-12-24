package ch.epfl.psytest.web;

import ch.epfl.psytest.domain.Response;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "responses", formBackingObject = Response.class)
@RequestMapping("/responses")
@Controller
public class ResponseController {
}
