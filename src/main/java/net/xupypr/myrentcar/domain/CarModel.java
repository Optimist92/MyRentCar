package net.xupypr.myrentcar.domain;

import javax.persistence.*;

@Entity
@Table(name = "model")
public class CarModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "class_id")
    private CarClass carClass;

    @Column(name = "make_of_car")
    private String brandCar;

    @Column(name = "model_of_car")
    private String modelCar;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "transmission_id")
    private Transmission transmission;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "type_id")
    private Type type;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "fuel_id")
    private Fuel fuel;

    @Column(name = "avg_fuel_cons")
    private Double avgFuelCons;

    @Column(name = "power")
    private Integer power;

    @Column(name = "capacity")
    private Integer capacity;

    @Column(name = "years_of_production")
    private String yearsOfProduction;

    @OneToOne(fetch = FetchType.EAGER)
    @PrimaryKeyJoinColumn
    private Price price;


    public Price getPrice() {
        return price;
    }

    public void setPrice(Price price) {
        this.price = price;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public CarClass getCarClass() {
        return carClass;
    }

    public void setCarClass(CarClass carClass) {
        this.carClass = carClass;
    }

    public String getBrandCar() {
        return brandCar;
    }

    public void setBrandCar(String carBrand) {
        this.brandCar = carBrand;
    }

    public String getModelCar() {
        return modelCar;
    }

    public void setModelCar(String carModel) {
        this.modelCar = carModel;
    }

    public Transmission getTransmission() {
        return transmission;
    }

    public void setTransmission(Transmission transmission) {
        this.transmission = transmission;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public Fuel getFuel() {
        return fuel;
    }

    public void setFuel(Fuel fuel) {
        this.fuel = fuel;
    }

    public Double getAvgFuelCons() {
        return avgFuelCons;
    }

    public void setAvgFuelCons(Double avgFuelCons) {
        this.avgFuelCons = avgFuelCons;
    }

    public Integer getPower() {
        return power;
    }

    public void setPower(Integer power) {
        this.power = power;
    }

    public Integer getCapacity() {
        return capacity;
    }

    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
    }

    public String getYearsOfProduction() {
        return yearsOfProduction;
    }

    public void setYearsOfProduction(String yearsOfProduction) {
        this.yearsOfProduction = yearsOfProduction;
    }

    @Override
    public String toString() {
        return "[" + getId() + "] " + carClass.getName() + " " + brandCar + " " + modelCar + " " + transmission.getName() +
                " " + type.getName() + " " + fuel.getName() + " " + avgFuelCons + " " +power + " " + capacity + " " + yearsOfProduction;
    }
}
