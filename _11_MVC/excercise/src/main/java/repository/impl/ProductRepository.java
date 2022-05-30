package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    public static List<Product> productList= new ArrayList<>();
    static {
        productList.add(new Product(1, "Ablade", 10000,100,"12/12/2022"));
        productList.add(new Product(2, "Exciter", 20000,100,"12/12/2022"));
        productList.add(new Product(3, "Vision", 15000,100,"12/12/2022"));
        productList.add(new Product(4, "Winner X", 30000,100,"12/12/2022"));
        productList.add(new Product(5, "Sh Mode", 40000,100,"12/12/2022"));

    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public Product findById(int id) {
        return productList.get(id - 1);
    }

    @Override
    public void add(Product product) {
     productList.add(product);
    }

    @Override
    public void update(int id, Product product) {
    productList.add(id,product);
    }

    @Override
    public void delete(int id) { productList.remove(id);
    }
}
