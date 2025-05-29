package com.example.jadeapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.jadeapi.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
}
