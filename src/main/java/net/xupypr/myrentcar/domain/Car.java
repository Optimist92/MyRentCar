package net.xupypr.myrentcar.domain;

import org.hibernate.annotations.Proxy;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "car")
@Proxy(lazy = false)
public class Car {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "model_id")
    private CarModel model;

    @Column(name = "reg_number_auto")
    private String regNumberAuto;

    @Column(name = "rented")
    private boolean rented;

    @Column(name = "year_of_issue")
    private Integer yearOfIssue;

    @Column(name = "color")
    private String color;

    @Column(name = "on_repair")
    private boolean onRepair;

    @Column(name = "air_cond")
    private boolean airCond;

    @Column(name = "power_windows")
    private boolean powerWindows;

    @Column(name = "seat_heating")
    private boolean seatHeating;

    @Column(name = "wheel_heating")
    private boolean wheelHeating;

    @Column(name = "parking_sensors")
    private boolean parkingSensors;

    @Column(name = "cruise_control")
    private boolean cruiseControl;

    @Column(name = "media")
    private boolean media;

    @Column(name = "bluetooth")
    private boolean bluetooth;

    @Column(name = "leather_interior")
    private boolean leather;

    @Transient
    private List<Order> orders;

    @Column(name = "description")
    private String description;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public CarModel getModel() {
        return model;
    }

    public void setModel(CarModel model) {
        this.model = model;
    }

    public String getRegNumberAuto() {
        return regNumberAuto;
    }

    public void setRegNumberAuto(String regNumberAuto) {
        this.regNumberAuto = regNumberAuto;
    }

    public Integer getYearOfIssue() {
        return yearOfIssue;
    }

    public void setYearOfIssue(Integer yearOfIssue) {
        this.yearOfIssue = yearOfIssue;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public boolean isRented() {
        return rented;
    }

    public void setRented(boolean rented) {
        this.rented = rented;
    }

    public boolean isOnRepair() {
        return onRepair;
    }

    public void setOnRepair(boolean onRepair) {
        this.onRepair = onRepair;
    }

    public boolean isAirCond() {
        return airCond;
    }

    public void setAirCond(boolean airCond) {
        this.airCond = airCond;
    }

    public boolean isPowerWindows() {
        return powerWindows;
    }

    public void setPowerWindows(boolean powerWindows) {
        this.powerWindows = powerWindows;
    }

    public boolean isSeatHeating() {
        return seatHeating;
    }

    public void setSeatHeating(boolean seatHeating) {
        this.seatHeating = seatHeating;
    }

    public boolean isWheelHeating() {
        return wheelHeating;
    }

    public void setWheelHeating(boolean wheelHeating) {
        this.wheelHeating = wheelHeating;
    }

    public boolean isParkingSensors() {
        return parkingSensors;
    }

    public void setParkingSensors(boolean parkingSensors) {
        this.parkingSensors = parkingSensors;
    }

    public boolean isCruiseControl() {
        return cruiseControl;
    }

    public void setCruiseControl(boolean cruiseControl) {
        this.cruiseControl = cruiseControl;
    }

    public boolean isMedia() {
        return media;
    }

    public void setMedia(boolean media) {
        this.media = media;
    }

    public boolean isBluetooth() {
        return bluetooth;
    }

    public void setBluetooth(boolean bluetooth) {
        this.bluetooth = bluetooth;
    }

    public boolean isLeather() {
        return leather;
    }

    public void setLeather(boolean leather) {
        this.leather = leather;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    @Override
    public String toString() {
        return "[" + getId() + "] " + "(" + model.getBrandCar() + " " + model.getModelCar() + ") " +
                regNumberAuto + " " + yearOfIssue + " " + color;
    }
}
