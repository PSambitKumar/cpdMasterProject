package com.angular.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.angular.model.CpdModel;


public interface cpdRepository  extends JpaRepository<CpdModel, Integer> {


}
