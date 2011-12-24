package ch.epfl.psytest.web;

import ch.epfl.psytest.domain.ExperimentSession;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "experimentsessions", formBackingObject = ExperimentSession.class)
@RequestMapping("/experimentsessions")
@Controller
public class ExperimentSessionController {
}
