import { Component } from '@angular/core';
import { Product } from 'src/app/common/product';
import { ProductService } from 'src/app/services/product.service';

@Component({
  selector: 'app-product-list',
  templateUrl: './product-list.component.html',
  styleUrls: ['./product-list.component.css']
})
export class ProductListComponent {
  products: Product[] = [];
  constructor(private productService: ProductService) { }

  ngOnInit(): void {
    this.productService.getProductList().subscribe((products) => {
      this.products = products;
      this.convertPrices();
    });
  }

  listProducts() {
    this.productService.getProductList().subscribe(
      data => {
        this.products = data;
      }
    )
  }

  convertPrices() {
    const exchangeRate = 85; 
    this.products.forEach(product => {
      product.unitPriceInINR = product.unitPrice * exchangeRate;
    });
  }
}
