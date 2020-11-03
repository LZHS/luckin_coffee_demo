package com.luckin_coffee.service.imp;

import com.luckin_coffee.beans.product.ProductCategory;
import com.luckin_coffee.repository.ProductCategoryRepository;
import com.luckin_coffee.service.ProductCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *  查询商品 类目菜单
 */
@Service
public class ProductCategoryServiceImp implements ProductCategoryService {
    @Autowired
    ProductCategoryRepository repository;

    @Override
    public ProductCategory findOne(Integer categoryId) {
        return repository.findById(categoryId).orElse(null);
    }


    @Override
    public List<ProductCategory> findAll() {
        return repository.findAll(Sort.by(Sort.Direction.ASC,"categorySort"));
//        return repository.findAll();
    }

    @Override
    public List<ProductCategory> findByCategoryTypeIn(List<Integer> categoryTypeList) {
        return repository.findByCategoryTypeIn(categoryTypeList);
    }

    @Override
    public ProductCategory save(ProductCategory productCategory) {
        return repository.save(productCategory);
    }
}
