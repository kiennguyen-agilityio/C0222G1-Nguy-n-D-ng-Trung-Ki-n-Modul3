package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository {
    public static Map<Integer,Product> productList= new HashMap<>();
    static {
        productList.put(1, new Product(1, "Ablade", 10000,100,"12/12/2022"));
        productList.put(2,new Product(2, "Exciter", 20000,100,"12/12/2022"));
        productList.put(3,new Product(3, "Vision", 15000,100,"12/12/2022"));
        productList.put(4,new Product(4, "Winner X", 30000,100,"12/12/2022"));
        productList.put(5,new Product(5, "Sh Mode", 40000,100,"12/12/2022"));

    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productList.values());
    }

    @Override
    public Product findById(int id) {
        return productList.get(id);
    }

    @Override
    public void put(int id, Product product) {
        productList.put(id,product);
    }

    @Override
    public void update(int id, Product product) {
    productList.put(id,product);
    }

    @Override
    public void delete(int id) { productList.remove(id);
    }

    @Override
    public List<Product> search(String name) {
            List<Product> products = new ArrayList<>();
            for (Product item:productList.values()) {
                if (item.getName().contains(name)){
                    products.add(item) ;
                }
            }
            return products;
        }
    }


