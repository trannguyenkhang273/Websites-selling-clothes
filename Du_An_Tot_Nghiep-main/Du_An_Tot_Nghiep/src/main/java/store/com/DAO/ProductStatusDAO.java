package store.com.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import store.com.Entity.OrderStatus;

public interface ProductStatusDAO extends JpaRepository<OrderStatus, Integer>{

}
