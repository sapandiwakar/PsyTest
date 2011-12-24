package ch.epfl.psytest.web;

import ch.epfl.psytest.domain.Question;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "questions", formBackingObject = Question.class)
@RequestMapping("/questions")
@Controller
public class QuestionController {
}
