package net.xupypr.myrentcar;

import net.xupypr.myrentcar.service.CarModelService;
import net.xupypr.myrentcar.service.CarService;
import net.xupypr.myrentcar.service.PriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;

@SpringBootApplication
public class MyrentcarApplication {

    public static void main(String[] args) {
        SpringApplication.run(MyrentcarApplication.class, args);
    }

    @Autowired
    private CarModelService carModelService;

    @Autowired
    private PriceService priceService;

    @EventListener(ApplicationReadyEvent.class)
    private void testJpaMethods(){
        carModelService.findAll().forEach(it-> System.out.println(it));
        priceService.findAll().forEach(it-> System.out.println(it));
    }
}
