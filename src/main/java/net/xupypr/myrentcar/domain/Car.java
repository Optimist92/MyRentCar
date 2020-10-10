package net.xupypr.myrentcar.domain;

import javax.persistence.*;

@Entity
@Table(name = "car")
public class Car {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "model_id")
    private CarModel model;

    @Column(name = "reg_number_auto")
    private String regNumberAuto;

    @Column(name = "rented")
    private Integer rented;

    @Column(name = "year_of_issue")
    private Integer yearOfIssue;

    @Column(name = "color")
    private String color;

    @Column(name = "on_repair")
    private Integer onRepair;

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

    public Integer getRented() {
        return rented;
    }

    public void setRented(Integer rented) {
        this.rented = rented;
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

    public Integer getOnRepair() {
        return onRepair;
    }

    public void setOnRepair(Integer onRepair) {
        this.onRepair = onRepair;
    }

    @Override
    public String toString() {
        return "[" + getId() + "] " + "(" + model.getBrandCar() + " " + model.getModelCar() + ") " +
                regNumberAuto + " " + yearOfIssue + " " + color;
    }
}
