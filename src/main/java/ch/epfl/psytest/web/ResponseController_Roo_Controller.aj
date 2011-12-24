// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ch.epfl.psytest.web;

import ch.epfl.psytest.domain.Experiment;
import ch.epfl.psytest.domain.Question;
import ch.epfl.psytest.domain.Response;
import ch.epfl.psytest.domain.Slide;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ResponseController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String ResponseController.create(@Valid Response response, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("response", response);
            return "responses/create";
        }
        uiModel.asMap().clear();
        response.persist();
        return "redirect:/responses/" + encodeUrlPathSegment(response.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String ResponseController.createForm(Model uiModel) {
        uiModel.addAttribute("response", new Response());
        return "responses/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String ResponseController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("response", Response.findResponse(id));
        uiModel.addAttribute("itemId", id);
        return "responses/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String ResponseController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("responses", Response.findResponseEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Response.countResponses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("responses", Response.findAllResponses());
        }
        return "responses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String ResponseController.update(@Valid Response response, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("response", response);
            return "responses/update";
        }
        uiModel.asMap().clear();
        response.merge();
        return "redirect:/responses/" + encodeUrlPathSegment(response.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String ResponseController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("response", Response.findResponse(id));
        return "responses/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String ResponseController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Response.findResponse(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/responses";
    }
    
    @ModelAttribute("experiments")
    public Collection<Experiment> ResponseController.populateExperiments() {
        return Experiment.findAllExperiments();
    }
    
    @ModelAttribute("questions")
    public Collection<Question> ResponseController.populateQuestions() {
        return Question.findAllQuestions();
    }
    
    @ModelAttribute("responses")
    public Collection<Response> ResponseController.populateResponses() {
        return Response.findAllResponses();
    }
    
    @ModelAttribute("slides")
    public Collection<Slide> ResponseController.populateSlides() {
        return Slide.findAllSlides();
    }
    
    String ResponseController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
