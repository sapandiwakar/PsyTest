package ch.epfl.psytest.web;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.dao.DataRetrievalFailureException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ch.epfl.psytest.domain.Experiment;
import ch.epfl.psytest.domain.ExperimentSession;
import ch.epfl.psytest.domain.Response;
import ch.epfl.psytest.domain.Story;

@RequestMapping("/exportdata/**")
@Controller
public class ExportDataController {

  @RequestMapping
  public ModelAndView get(ModelMap modelMap, HttpServletRequest request,
      HttpServletResponse response) {
    String dataCsv =
        new String(
            "ExperimentSessionId, ExperimentSessionDescription, ExperimentId, ExperimentSubjectName, ExperimentSubjectAge, StoryOrder(StoryId;StoryId;...), QuestionChoiceOrder(QuestionChoiceStory1:QuestionChoiceStory1:...;QestionChoiceStory2:...), StoryId, QuestionStatement, AnswerId, AnswerDescription, IsControlAnsweredCorrect, ...\n");

    List<Experiment> experiments = Experiment.findAllExperiments();
    for (Experiment e : experiments) {
      String dataRow = new String();
      dataRow += e.getExperimentSession().getId() + ",";
      dataRow += e.getExperimentSession().getDescription() + ",";
      dataRow += e.getId() + ",";
      dataRow += e.getSubjectName() + ",";
      dataRow += e.getSubjectAge() + ",";
      dataRow += e.getStoryOrder() + ",";
      dataRow += e.getQuestionChoicesOrder() + ",";
      Set<Story> storys = e.getExperimentSession().getStories();
      Set<Response> responses = e.getResponses();

      for (Story s : storys) {
        dataRow += s.getId() + ",";
        for (Response r : responses) {
          if (r.getStory() == s) {
            dataRow += r.getQuestion().getStatement() + ",";
            dataRow += r.getAnswer().getId() + ",";
            dataRow += r.getAnswer().getDescription() + ",";
            dataRow += r.getAnswer().getIsControlSlide() + ",";
            break;
          }
        }
      }

      dataCsv += dataRow + "\n";
    }

    try {
      File file = new File("exporteddata.csv");
      FileWriter fw = new FileWriter(file);
      fw.write(dataCsv);
      fw.flush();
      fw.close();
      response.setContentLength((int) file.length());
      response.setHeader("Connection", "Keep-Alive");
      response.setHeader("Content-type", "text/csv");
      response.setHeader("Content-Disposition", "attachment; filename=\"exporteddata.csv\"");
      response.setHeader("Pragma", "no-cache");
      response.setHeader("Cache-Control", "no-cache");

      InputStream is = new FileInputStream(file);
      IOUtils.copy(is, response.getOutputStream());
      response.flushBuffer();
    } catch (IOException e4) {
      // TODO Auto-generated catch block
      e4.printStackTrace();
    }

    return null;
  }

  @RequestMapping(method = RequestMethod.POST, value = "{id}")
  public void post(@PathVariable Long id, ModelMap modelMap, HttpServletRequest request,
      HttpServletResponse response) {
    System.out.println("Pulkit");
  }

  @RequestMapping
  public String index() {
    return "exportdata/index";
  }
}
