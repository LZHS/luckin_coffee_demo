package com.luckin_coffee.repository.specs;

import com.luckin_coffee.beans.banner.BannerItem;
import org.springframework.data.jpa.domain.Specification;

import javax.persistence.criteria.*;
import java.util.List;
import java.util.stream.Collectors;

public class BannerSpec {
    public static Specification<BannerItem> findByBannerIds(List<Integer> bannerIds) {
        return (Specification<BannerItem>) (root, criteriaQuery, criteriaBuilder) -> {
            List<Predicate> predicates = bannerIds.stream()
                    .map((bannerId) -> criteriaBuilder.equal(root.get("bannerId"), bannerId))
                    .collect(Collectors.toList());
            return criteriaBuilder.or(predicates.toArray(new Predicate[predicates.size()]));
        };
    }

}
