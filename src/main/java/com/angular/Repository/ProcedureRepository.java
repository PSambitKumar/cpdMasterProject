package com.angular.Repository;

import com.angular.model.Procedure;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProcedureRepository extends JpaRepository<Procedure, Integer> {
}
