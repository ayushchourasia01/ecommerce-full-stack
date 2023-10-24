package com.ayush.ecommerce.ProductCategory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.CrossOrigin;

@CrossOrigin("http://localhost:4200")
public interface ProductCategoryRepo extends JpaRepository<ProductCategory, Long> {
}
