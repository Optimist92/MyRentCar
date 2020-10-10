package net.xupypr.myrentcar.controller;

import net.xupypr.myrentcar.domain.Car;
import net.xupypr.myrentcar.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("prototype")
@RequestMapping(value= "/cars")
public class CarController {

    @Autowired
    private CarService carService;

    @GetMapping("/list")
    public String findAll(Model model) {
        Iterable<Car> carsList = carService.findAll();
        model.addAttribute("carsList", carsList);
        return "/cars/list";
    }
}
