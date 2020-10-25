package net.xupypr.myrentcar.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import net.xupypr.myrentcar.domain.Car;
import net.xupypr.myrentcar.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Controller
@Scope("prototype")
@RequestMapping(value= "/")
public class SearchController {

    @Autowired
    private CarService carService;

    @GetMapping("/search")
    public String search(Model model, @RequestParam(name = "query", required = false) String query) {
        if(query != null && query.length() >= 3) {
            Set<Car> carsList = carService.findBySearchRequest(query);
            model.addAttribute("carsList", carsList);
            return "/cars/lists";
        }
        return "redirect:/";
    }

    @GetMapping("/searchCars")
    public void searchNames(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String search = req.getQueryString();
        if(search != null) {
            search = URLDecoder.decode(search, "UTF-8");
            try {
                Set<Car> carsLists = carService.findBySearchRequest(search);
                List<Car>carsList = new ArrayList<>();
                carsList.addAll(carsLists);
                resp.setContentType("application/json");
                resp.setCharacterEncoding("UTF-8");
                ObjectMapper objectMapper = new ObjectMapper();
                objectMapper.writeValue(resp.getOutputStream(), carsList);
            } catch(IOException e) {
                resp.sendError(500);
            }
        } else {
            resp.sendError(400);
        }
    }

}
