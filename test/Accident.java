package net.xupypr.myrentcar.domain;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "accident")
public class Accident {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Temporal(TemporalType.DATE)
    @Column (name="date_accident")
    private Date date_accident;

    @Column (name = "damage_comm")
    private String damage_comment;

    @Column (name = "repair_cost")
    private Long repair_cost;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getDate_accident() {
        return date_accident;
    }

    public void setDate_accident(Date date_accident) {
        this.date_accident = date_accident;
    }


    public String getDamage_comment() {
        return damage_comment;
    }

    public void setDamage_comment(String damage_comment) {
        this.damage_comment = damage_comment;
    }

    public Long getRepair_cost() {
        return repair_cost;
    }

    public void setRepair_cost(Long repair_cost) {
        this.repair_cost = repair_cost;
    }
}
