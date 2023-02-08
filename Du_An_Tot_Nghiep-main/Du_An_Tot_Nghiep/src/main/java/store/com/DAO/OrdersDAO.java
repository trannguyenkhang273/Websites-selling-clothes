package store.com.DAO;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import store.com.Entity.Orders;
import store.com.Entity.ReportModel;

public interface OrdersDAO extends JpaRepository<Orders, Integer>{
    @Query("Select u from Orders u where u.account.accountid like ?1 ")
    List<Orders> findByAccount(String username);
    //Get sales
    @Query("select sum(o.totalmoney) from Orders o where (o.createdate between ?1 and ?2 ) and o.orderstatus.orderstatusid=4")
    Double getSales(Date date1, Date date2) ;

    //Get doanh thu hàng theo tháng
    @Query("select sum(o.productmoney) from Orders o where o.createdate between ?1 and ?2 and o.orderstatus.orderstatusid=4")
    Double getTotalMoneyProduct(Date date1, Date date2) ;
    // Get tổng tiền mua sản phẩm trong hóa đon theo tháng
    @Query("select sum(o.productrepository.product.purchaseprice*o.quantity) from DetailOrder o where o.orders.createdate between ?1 and ?2 and o.orders.orderstatus.orderstatusid=4 ")
    Double getPayProduct(Date date1, Date date2) ;
    //Get chi phí ship
    @Query("select sum(o.shipfee) from Orders o where o.createdate between ?1 and ?2 and o.orderstatus.orderstatusid=4")
    Double getShipFee(Date date1, Date date2);

    //Đếm sô lượng order theo orderstatus và create date
    @Query("select new ReportModel (o.orderstatus.orderstatustitle,count (o.orderid))from Orders o where  o.createdate between ?1 and ?2 group by o.orderstatus.orderstatustitle")
    List<ReportModel> getReport(Date date1, Date date2);


    //List order status = 1 (chưa xử lý)
    @Query("select o from Orders o where o.orderstatus.orderstatusid = 1")
    List<Orders> findOrdersNoProcess();

    //List order status = 2 (đang giao)
    @Query("select o from Orders o where o.orderstatus.orderstatusid = 2")
    List<Orders> findOrdersDelivery();

    //List order status = 3 (Hủy)
    @Query("select o from Orders o where o.orderstatus.orderstatusid = 3")
    List<Orders> findOrdersCancel();

    //List order status = 4 (Thành công)
    @Query("select o from Orders o where o.orderstatus.orderstatusid = 4")
    List<Orders> findOrdersSuccess();
}
