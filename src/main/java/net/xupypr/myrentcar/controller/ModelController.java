package net.xupypr.myrentcar.controller;

import net.xupypr.myrentcar.domain.*;
import net.xupypr.myrentcar.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Scope("prototype")
@RequestMapping(value= "/models")
public class ModelController {

    @Autowired
    private CarModelService carModelService;

    @Autowired
    private CarClassService carClassService;

    @Autowired
    private TypeService typeService;

    @Autowired
    private TransmissionService transmissionService;

    @Autowired
    private FuelService fuelService;

    @GetMapping("/list")
    public String findAll(Model model) {
        Iterable<CarModel> modelsList = carModelService.findAll();
        model.addAttribute("modelsList", modelsList);
        return "/models/list";
    }

    @GetMapping("/edit")
    public String edit(Model model, @RequestParam(required = false, value = "id") Long id) {
        if(id != null) {
            CarModel carModel = carModelService.findById(id);
            if(carModel != null) {
                model.addAttribute("carModel", carModel);
            } else {
                throw new ObjectValidationException("Ошибка БД");
            }
        }
        Iterable<CarClass> carClasses = carClassService.findAll();
        model.addAttribute("carClasses", carClasses);
        Iterable<Type> types = typeService.findAll();
        model.addAttribute("types", types);
        Iterable<Transmission> transmissions = transmissionService.findAll();
        model.addAttribute("transmissions", transmissions);
        Iterable<Fuel> fuels = fuelService.findAll();
        model.addAttribute("fuels", fuels);
        return "/models/edit";
    }
}
