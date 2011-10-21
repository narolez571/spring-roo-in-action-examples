// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.rooinaction.coursemanager.web.scaffold;

import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Arrays;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.rooinaction.coursemanager.model.Course;
import org.rooinaction.coursemanager.model.CourseTypeEnum;
import org.rooinaction.coursemanager.model.Offering;
import org.rooinaction.coursemanager.model.Tag;
import org.rooinaction.coursemanager.model.TrainingProgram;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect CourseController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String CourseController.create(@Valid Course course, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("course", course);
            return "courses/create";
        }
        uiModel.asMap().clear();
        course.persist();
        return "redirect:/courses/" + encodeUrlPathSegment(course.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String CourseController.createForm(Model uiModel) {
        uiModel.addAttribute("course", new Course());
        return "courses/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String CourseController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("course", Course.findCourse(id));
        uiModel.addAttribute("itemId", id);
        return "courses/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String CourseController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("courses", Course.findCourseEntries(firstResult, sizeNo));
            float nrOfPages = (float) Course.countCourses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("courses", Course.findAllCourses());
        }
        return "courses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String CourseController.update(@Valid Course course, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("course", course);
            return "courses/update";
        }
        uiModel.asMap().clear();
        course.merge();
        return "redirect:/courses/" + encodeUrlPathSegment(course.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String CourseController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("course", Course.findCourse(id));
        return "courses/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String CourseController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Course course = Course.findCourse(id);
        course.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/courses";
    }
    
    @ModelAttribute("courses")
    public Collection<Course> CourseController.populateCourses() {
        return Course.findAllCourses();
    }
    
    @ModelAttribute("coursetypeenums")
    public Collection<CourseTypeEnum> CourseController.populateCourseTypeEnums() {
        return Arrays.asList(CourseTypeEnum.class.getEnumConstants());
    }
    
    @ModelAttribute("offerings")
    public Collection<Offering> CourseController.populateOfferings() {
        return Offering.findAllOfferings();
    }
    
    @ModelAttribute("tags")
    public Collection<Tag> CourseController.populateTags() {
        return Tag.findAllTags();
    }
    
    @ModelAttribute("trainingprograms")
    public Collection<TrainingProgram> CourseController.populateTrainingPrograms() {
        return TrainingProgram.findAllTrainingPrograms();
    }
    
    String CourseController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
