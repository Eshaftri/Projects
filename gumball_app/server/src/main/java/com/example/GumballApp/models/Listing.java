package com.example.GumballApp.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.beans.factory.annotation.Value;

import javax.persistence.*;

@Entity
@Table(name = "listings")
public class Listing {

    @Id
    @GeneratedValue( strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "item")
    private String item;

    @Column(name = "description")
    private String description;

    @Column(name = "category")
    private String category;

    @Column(name = "asking_price")
    private double askingPrice;

    @Column(name = "search_counter")
    @Value("${default.searchCounter")
    private long searchCounter;

    @Column(name = "image", columnDefinition="text")
    private String image;

    @ManyToOne
    @JoinColumn(name = "customer_id", nullable = false)
   private Customer customer;


    public Listing(String item, String description,
                   String category, double askingPrice, String image, Customer customer) {
        this.item = item.toUpperCase();
        this.description = description.toLowerCase();
        this.category = category;
        this.askingPrice = askingPrice;
        this.customer = customer;
        this.searchCounter = 0L;
        this.image = image;
    }
    public Long getSearchCounter() {
        return searchCounter;
    }
    public void incrementSearchCounter() {
        this.searchCounter++;
    }

    public void setSearchCounter(Long searchCounter) {
        this.searchCounter = searchCounter;
    }


    public Listing(){
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getItem() {
        return item;
    }

    public void setItem(String item) {
        this.item = item.toUpperCase();
    }

    public String getDescription() {
        return description.toLowerCase();
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public double getAskingPrice() {
        return askingPrice;
    }

    public void setAskingPrice(double askingPrice) {
        this.askingPrice = askingPrice;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
