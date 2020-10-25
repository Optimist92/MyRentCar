package net.xupypr.myrentcar.controller;

import net.xupypr.myrentcar.domain.*;
import net.xupypr.myrentcar.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


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

    @PostMapping("/delete")
    public String deleteModel(@RequestParam(required = true, defaultValue = "" ) Long modelId) {
        carModelService.delete(modelId);
        return "redirect:/models/list";
    }

    @PostMapping("/save")
    public String save(@RequestParam(required = false, value = "id") String id,
                       @RequestParam("carClass") String carClass,
                       @RequestParam("brandCar") String brandCar,
                       @RequestParam("modelCar") String modelCar,
                       @RequestParam("type") String type,
                       @RequestParam("fuel") String fuel,
                       @RequestParam("transmission") String transmission,
                       @RequestParam("avgFuelCons") String avgFuelCons,
                       @RequestParam("power") String power,
                       @RequestParam("capacity") String capacity,
                       @RequestParam("yearsOfProduction") String yearsOfProduction,
                       @RequestParam("cost1") String cost1,
                       @RequestParam("cost4") String cost4,
                       @RequestParam("cost8") String cost8) {
        CarModel carModel = new CarModel();
        Price price = new Price();
        if(id != null) {
            try {
                price.setId(Long.valueOf(id));
                carModel.setId(Long.valueOf(id));
            } catch(NumberFormatException e) {
                throw new ObjectValidationException("Неверный формат идентификатора", e);
            }
        }
        try {
            carModel.setCarClass(new CarClass());
            carModel.getCarClass().setId(Long.valueOf(carClass));
        } catch(NumberFormatException e) {
            throw new ObjectValidationException("Неверный формат идентификатора класса", e);
        }
        carModel.setBrandCar(brandCar);
        carModel.setModelCar(modelCar);
        try {
            carModel.setType(new Type());
            carModel.getType().setId(Long.valueOf(type));
        } catch(NumberFormatException e) {
            throw new ObjectValidationException("Неверный формат идентификатора типа", e);
        }
        try {
            carModel.setFuel(new Fuel());
            carModel.getFuel().setId(Long.valueOf(fuel));
        } catch(NumberFormatException e) {
            throw new ObjectValidationException("Неверный формат идентификатора топлива", e);
        }
        try {
            carModel.setTransmission(new Transmission());
            carModel.getTransmission().setId(Long.valueOf(transmission));
        } catch(NumberFormatException e) {
            throw new ObjectValidationException("Неверный формат идентификатора трансмиссии", e);
        }
        try {
            carModel.setAvgFuelCons(Double.valueOf(avgFuelCons));
        } catch(NumberFormatException e) {
            throw new ObjectValidationException("Неверный формат расхода топлива", e);
        }
        try {
            carModel.setPower(Integer.valueOf(power));
        } catch(NumberFormatException e) {
            throw new ObjectValidationException("Неверный формат мощности", e);
        }
        try {
            carModel.setCapacity(Integer.valueOf(capacity));
        } catch(NumberFormatException e) {
            throw new ObjectValidationException("Неверный формат объема двигателя", e);
        }
        carModel.setYearsOfProduction(yearsOfProduction);
        try {
            price.setCost1(Long.valueOf(cost1));
            price.setCost4(Long.valueOf(cost4));
            price.setCost8(Long.valueOf(cost8));
        } catch(NumberFormatException e) {
            throw new ObjectValidationException("Неверный формат цены", e);
        }
        carModelService.save(carModel, price);
        return "redirect:/models/list";
    }
}
