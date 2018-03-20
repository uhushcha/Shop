package com.tsystems.javaschoolshop.model;


import javax.persistence.*;
import java.io.Serializable;

@MappedSuperclass
public class Generic implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
