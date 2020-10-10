package net.xupypr.myrentcar.controller;

import net.xupypr.myrentcar.domain.Car;
import net.xupypr.myrentcar.domain.Price;
import net.xupypr.myrentcar.service.CarService;
import net.xupypr.myrentcar.service.PriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@Scope("prototype")
@RequestMapping(value= "/price")
public class PriceController {

    @Autowired
    private PriceService priceService;

    @GetMapping ("list")
    public String findAll(Model model) {
        Iterable<Price> priceList = priceService.findAll();
        model.addAttribute("priceList", priceList);
        return "/price/list";
    }
}
