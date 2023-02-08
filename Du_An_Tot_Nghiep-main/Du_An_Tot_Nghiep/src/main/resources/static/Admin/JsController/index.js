var app = angular.module("AnhApp", ["ngRoute"]);
app.config(function($routeProvider) {
	$routeProvider
		.when("/main", {
			templateUrl: "/Admin/ThongKeDoanhThu.html"
		})

		.when("/ThongKeDoanhThu", {
			templateUrl: "/Admin/ThongKeDoanhThu.html"
		})

		.when("/ThongKeSanPham", {
			templateUrl: "/Admin/ThongKeSanPham.html"
		})

		.when("/QuanLyCategory", {
			templateUrl: "/Admin/QuanLyCategory.html",
			controller: "category"
		})
		.when("/QuanLyStyle", {
			templateUrl: "/Admin/QuanLyStyle.html",
			controller: "style"
		})
		.when("/QuanLySize", {
			templateUrl: "/Admin/QuanLySize.html",
			controller: "size"
		})

		.when("/QuanLySanPham", {
			templateUrl: "/Admin/QuanLySanPham.html",
			controller: "product-ctrl"
		})
		.when("/QuanLyHinhAnh", {
			templateUrl: "/Admin/QuanLyHinhAnh.html",
			controller: "images"
		})
		.when("/QuanLyKho", {
			templateUrl: "/Admin/QuanLyKho.html",
			controller: "repository"
		})

		.when("/QuanLyVoucher", {
			templateUrl: "/Admin/QuanLyVoucher.html",
			controller: "vouchers-ctrl"
		})

		.when("/QuanLyDiscount", {
			templateUrl: "/Admin/QuanLyDiscount.html",
			controller: "discount-ctrl"
		})
		
		.when("/QuanLyBanner", {
			templateUrl: "/Admin/QuanLyBanner.html",
			controller: "banner-ctrl"
		})
		
		.when("/QuanLyVoucher", {
			templateUrl: "/Admin/QuanLyVoucher.html",
			controller: "voucher-ctrl"
		})

		.when("/QuanLyDonHang", {
			templateUrl: "/Admin/QuanLyDonHang.html",
			controller: "statusorder-ctrl"
		})

		.when("/MyProfile", {
			templateUrl: "./index2.html"
		})

		.when("/cart", {
			templateUrl: "./cart/view.html"
		})

		.when("/cart/order", {
			templateUrl: "./cart/order.html"
		})

		.when("/Authority", {
			templateUrl: "/Admin/Authority.html",
			controller: "Authority-ctrl"
		})
		.when("/unauthorized", {
			templateUrl: "/Admin/Unauthorized.html",
		})

		.otherwise({
			redirectTo: "/main"
		})
})