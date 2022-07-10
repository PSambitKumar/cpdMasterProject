package com.angular.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.angular.model.Package;

import java.util.List;

public interface PackageRepository extends JpaRepository<Package, String> {
	List<Package> findAllByCategoryCode(String packageCategoryName);
}
