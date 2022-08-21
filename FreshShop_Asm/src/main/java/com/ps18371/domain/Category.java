package com.ps18371.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Entity
@Table(name = "Categories")
public class Category implements Serializable {
	@Id
	String id;
	String name;
	
	String image;
	@OneToMany(mappedBy = "category")
	List<Product> products;
}
