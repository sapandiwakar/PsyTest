package ch.epfl.psytest.web;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ch.epfl.psytest.domain.Experiment;

@RooWebScaffold(path = "experiments", formBackingObject = Experiment.class)
@RequestMapping("/experiments")
@Controller
public class ExperimentController {
  
  @RequestMapping(method = RequestMethod.POST)
  public String create(@Valid Experiment experiment, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
      if (bindingResult.hasErrors()) {
          uiModel.addAttribute("experiment", experiment);
          return "experiments/create";
      }
      uiModel.asMap().clear();
      experiment.persist();
      experiment.getExperimentSession().incrementNumberOfExperiments();
      return "redirect:/experiments/" + encodeUrlPathSegment(experiment.getId().toString(), httpServletRequest);
  }
  
}
