package net.xupypr.myrentcar.controller;

import net.xupypr.myrentcar.domain.*;
import net.xupypr.myrentcar.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.text.ParseException;
import java.util.List;

@Controller
@Scope("prototype")
public class OrderController {
    @Autowired
    private OrderService orderService;

    @Autowired
    private CarService carService;

    @Autowired
    private ClientService clientService;

    @Autowired
    private StatusOrderService statusOrderService;

    @Autowired
    private UserService userService;


    @GetMapping("/orders/list")
    public String findAllByClient(Model model, Principal principal) {
        User user = userService.findUserByUsername(principal.getName());
        if (user != null) {
            Client client = new Client();

            for (Client client1 : user.getClients()) {
                client = client1;
            }
            if(client != null) {
                model.addAttribute("client", client);
            } else {
                throw new ObjectValidationException("Ошибка БД (client)");
            }
            List<Order> ordersList = orderService.findOrdersByClient(client.getId());
            model.addAttribute("ordersList", ordersList);
        } else {
            throw new ObjectValidationException("Ошибка БД (user)");
        }
        return "/orders/list";
    }

    @GetMapping("/orders/stat/list1")
    public String findAllInProc(Model model) {
        List<Order> ordersList = orderService.findOrdersByStat1();
        model.addAttribute("ordersList", ordersList);
        return "/orders/stat/list1";
    }
    @GetMapping("/orders/stat/list2")
    public String findAllFormal(Model model) {
        List<Order> ordersList = orderService.findOrdersByStat2();
        model.addAttribute("ordersList", ordersList);
        return "/orders/stat/list2";
    }
    @GetMapping("/orders/stat/list3")
    public String findAllEnds(Model model) {
        List<Order> ordersList = orderService.findOrdersByStat3();
        model.addAttribute("ordersList", ordersList);
        return "/orders/stat/list3";
    }

    @GetMapping("/orders/new")
    public String edit(Model model, @RequestParam("id") Long id, Principal principal) {
        User user = userService.findUserByUsername(principal.getName());
        Client client = new Client();
        if (user != null) {
            for (Client client1 : user.getClients()) {
                client = client1;
            }
        }
        model.addAttribute("client", client);
        Car car = carService.findById(id);
        if(car != null) {
            model.addAttribute("car", car);
        } else {
            throw new ObjectValidationException("Ошибка БД");
        }
        return "/orders/new";
    }

}
