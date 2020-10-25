package net.xupypr.myrentcar.controller;

import net.xupypr.myrentcar.domain.*;
import net.xupypr.myrentcar.service.CarModelService;
import net.xupypr.myrentcar.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Scope("prototype")
@RequestMapping(value= "/cars")
public class CarController {

    @Autowired
    private CarService carService;

    @Autowired
    private CarModelService carModelService;

    @GetMapping("/list")
    public String findAllForManager(Model model) {
        Iterable<Car> carsList = carService.findAll();
        model.addAttribute("carsList", carsList);
        return "/cars/list";
    }

    @GetMapping("/lists")
    public String findAll(Model model) {
        Iterable<Car> carsList = carService.findAll();
        model.addAttribute("carsList", carsList);
        return "/cars/lists";
    }

    @GetMapping("/edit")
    public String edit(Model model, @RequestParam(required = false, value = "id") Long id) {
        if(id != null) {
            Car car = carService.findById(id);
            if(car != null) {
                model.addAttribute("car", car);
            } else {
                throw new ObjectValidationException("Ошибка БД");
            }
        }
        Iterable<CarModel> carModels = carModelService.findAll();
        model.addAttribute("carModels", carModels);
        return "/cars/edit";
    }

    @PostMapping("/delete")
    public String delete(@RequestParam(required = true, defaultValue = "" ) Long carId) {
        carService.delete(carId);
        return "redirect:/cars/list";
    }

    @PostMapping("/save")
    public String save(@RequestParam(required = false, value = "id") String id,
                       @RequestParam("carModel") String carModel,
                       @RequestParam("regNumberAuto") String regNumberAuto,
                       @RequestParam("yearOfIssue") String yearOfIssue,
                       @RequestParam("color") String color,
                       @RequestParam(required = false, value = "airCond") String airCond,
                       @RequestParam(required = false, value = "powerWindows") String powerWindows,
                       @RequestParam(required = false, value = "seatHeating") String seatHeating,
                       @RequestParam(required = false, value = "wheelHeating") String wheelHeating,
                       @RequestParam(required = false, value = "parkingSensors") String parkingSensors,
                       @RequestParam(required = false, value = "cruiseControl") String cruiseControl,
                       @RequestParam(required = false, value = "media") String media,
                       @RequestParam(required = false, value = "bluetooth") String bluetooth,
                       @RequestParam(required = false, value = "leather") String leather) {
        Car car = new Car();
        if(id != null) {
            try {
                car.setId(Long.valueOf(id));
            } catch(NumberFormatException e) {
                throw new ObjectValidationException("Неверный формат идентификатора", e);
            }
        }
        try {
            car.setModel(new CarModel());
            car.getModel().setId(Long.valueOf(carModel));
            car.setDescription(car.getModel().getBrandCar() + " " + car.getModel().getModelCar());

        } catch(NumberFormatException e) {
            throw new ObjectValidationException("Неверный формат идентификатора модели", e);
        }
        car.setRegNumberAuto(regNumberAuto);
        car.setColor(color);
        try {
            car.setYearOfIssue(Integer.valueOf(yearOfIssue));
        } catch(NumberFormatException e) {
            throw new ObjectValidationException("Неверный формат года выпуска", e);
        }
        try {
            if (airCond == null) {
                airCond = "false";
            }
            car.setAirCond(Boolean.parseBoolean(airCond));
        } catch(NumberFormatException e) {
            throw new ObjectValidationException("Неверный формат кондиционера", e);
        }
        try {
            if (powerWindows == null) {
                powerWindows = "false";
            }
            car.setPowerWindows(Boolean.parseBoolean(powerWindows));
        } catch(NumberFormatException e) {
            throw new ObjectValidationException("Неверный формат электропакета", e);
        }
        try {
            if (bluetooth == null) {
                bluetooth = "false";
            }
            car.setBluetooth(Boolean.parseBoolean(bluetooth));
        } catch(NumberFormatException e) {
            throw new ObjectValidationException("Неверный формат bluetooth", e);
        }
        try {
            if (cruiseControl == null) {
                cruiseControl = "false";
            }
            car.setCruiseControl(Boolean.parseBoolean(cruiseControl));
        } catch(NumberFormatException e) {
            throw new ObjectValidationException("Неверный формат круиз-контроля", e);
        }
        try {
            if (media == null) {
                media = "false";
            }
            car.setMedia(Boolean.parseBoolean(media));
        } catch(NumberFormatException e) {
            throw new ObjectValidationException("Неверный формат медиа", e);
        }
        try {
            if (leather == null) {
                leather = "false";
            }
            car.setLeather(Boolean.parseBoolean(leather));
        } catch(NumberFormatException e) {
            throw new ObjectValidationException("Неверный формат кожанного салона", e);
        }
        try {
            if (seatHeating == null) {
                seatHeating = "false";
            }
            car.setSeatHeating(Boolean.parseBoolean(seatHeating));
        } catch(NumberFormatException e) {
            throw new ObjectValidationException("Неверный формат подогрева сидений", e);
        }
        try {
            if (wheelHeating == null) {
                wheelHeating = "false";
            }
            car.setWheelHeating(Boolean.parseBoolean(wheelHeating));
        } catch(NumberFormatException e) {
            throw new ObjectValidationException("Неверный формат обогрева зеркал", e);
        }
        try {
            if (parkingSensors == null) {
                parkingSensors = "false";
            }
            car.setParkingSensors(Boolean.parseBoolean(parkingSensors));
        } catch(NumberFormatException e) {
            throw new ObjectValidationException("Неверный формат парктроника", e);
        }
        carService.save(car);
        return "redirect:/cars/list";
    }
}
