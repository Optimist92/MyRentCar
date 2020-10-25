package net.xupypr.myrentcar.controller;

import net.xupypr.myrentcar.domain.*;
import net.xupypr.myrentcar.service.ClientService;
import net.xupypr.myrentcar.service.UserService;
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
import java.text.SimpleDateFormat;

@Controller
@Scope("prototype")
@RequestMapping(value= "/client")
public class ClientController {

    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd.MM.yyyy");

    @Autowired
    private ClientService clientService;

    @Autowired
    private UserService userService;

    @GetMapping("/account")
    public String accountEdit(Model model, Principal principal) {
        User user = userService.findUserByUsername(principal.getName());
        if (user != null) {
            Client client = new Client();
            for(Client client1: user.getClients()) {
                client=client1;
            }
            if(client != null) {
                model.addAttribute("client", client);
            } else {
                throw new ObjectValidationException("Ошибка БД (client)");
            }
        } else {
            throw new ObjectValidationException("Ошибка БД (user)");
        }
        return "/client/account";
    }

    @PostMapping(value = "/save")
    public String save(@RequestParam(required = false, value = "id") String id,
                       @RequestParam("name") String name,
                       @RequestParam("surname") String surname,
                       @RequestParam("email") String email,
                       @RequestParam("address") String address,
                       @RequestParam("passport") String passport,
                       @RequestParam("birthday") String birthday,
                       @RequestParam("phone") String phone,
                       @RequestParam("driver_lic_number") String driverLicNumber) {
        Client client = new Client();
        if(id != null) {
            try {
                client.setId(Long.valueOf(id));
            } catch(NumberFormatException e) {
                throw new ObjectValidationException("Неверный формат идентификатора", e);
            }
        } else {
            throw new ObjectValidationException("Ошибка БД (client без id)");
        }
        client.setName(name);
        client.setSurname(surname);
        client.setEmail(email);
        client.setAddress(address);
        client.setPassport(passport);
        try {
            if (birthday !=null ) {
                client.setBirthday(DATE_FORMAT.parse(birthday));
            } else {
                client.setBirthday(DATE_FORMAT.parse(null));
            }

        } catch(ParseException e) {
            throw new ObjectValidationException("Неверный формат даты", e);
        }
        client.setPhone(phone);
        client.setDriverLicNumber(driverLicNumber);

        clientService.save(client);
        return "redirect:/client/account";
    }
}
