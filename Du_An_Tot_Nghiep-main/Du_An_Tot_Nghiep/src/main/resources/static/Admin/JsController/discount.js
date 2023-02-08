
app.controller("discount-ctrl", function($http, $scope) {

	$scope.items = [];
	$scope.itemsCategory = [];
	$scope.form = {};
	$scope.forms = {};
	$scope.cates = [];
	$scope.categoryCombobox = "";
	$scope.selected = [];
	$scope.userLogin = {};
	
	$scope.initialize = function(){
        //Load Product
        $http.get("/rest/productdiscount").then(resp => {
            $scope.items = resp.data;
            //Chuyển ngày về date JavaScript
            $scope.items.forEach(item => {
                item.startdate = new Date(item.startdate);
                item.enddate = new Date(item.enddate);
            })
        });
        
        //LoadProduct
        $http.get("/rest/categoryAll").then(resp => {
			$scope.cates = resp.data;
		});

		$http.get("/rest/account/userLogin").then(resp => {
			$scope.userLogin = resp.data;
			$scope.form.account = $scope.userLogin;
		});
		
    }
    
    $scope.changeEvent = function() {
		if($scope.changeModel != null && $scope.changeModel != "" && $scope.changeModel != undefined) {
			$http.get(`/rest/searchByCategory/${$scope.changeModel}`).then(resp => {
				$scope.itemsCategory = resp.data;
			})
		}else{
			$scope.itemsCategory = [];
		}
	}
	
	$scope.exists = function(item) {
		return $scope.selected.indexOf(item) > -1;
	}
	
	$scope.toggle = function(item) {
		var idx = $scope.selected.indexOf(item);
		if(idx > -1) {
			$scope.selected.splice(idx, 1);
		}else {
			$scope.selected.push(item);
		}
		
	}
	
	$scope.checkAll = function() {
		if($scope.selectAll) {
			angular.forEach($scope.itemsCategory, function(item){
				var idx = $scope.selected.indexOf(item);
				if(idx >= 0){
					return true;
				}else {
					$scope.selected.push(item);
				}
			})
		}else {
			$scope.selected = [];
		}
	}
    
   

    //Start---------------------------------------------------------------------//
    $scope.initialize();
    
    //Clear form
    $scope.reset = function() {
		$scope.form = {
			productdiscountid: '',
			productid: '',
			startdate: new Date(),
			enddate : new Date(),
			discount: '',
			accountId: ''
		}
	}
    
    //Edit item
    $scope.edit = function(item) {
        $scope.form = angular.copy(item);
		$(".nav-tabs .nav-item button.nav-link:eq(0)").tab('show');
	}
	
	//SaveAll
	$scope.create = function() {
		if ($scope.selected.length == 0){
			Swal.fire({
				position: 'top-middle',
				icon: 'error',
				title: 'Vui lòng chọn sản phẩm giảm giá',
				showConfirmButton: false,
				timer: 1500
			})
			return;
		}
		for(var i = 0; i < $scope.selected.length ; i++) {
			$scope.forms.startdate = angular.copy($scope.form.startdate);
			$scope.forms.enddate = angular.copy($scope.form.enddate);
			$scope.forms.discount = angular.copy($scope.form.discount);
			$scope.forms.account =  angular.copy($scope.form.account),
			$scope.forms.product = {
				productid: $scope.selected[i].productid,
				productname: $scope.selected[i].productname,
				listedprice: $scope.selected[i].listedprice,
				sellingprice: $scope.selected[i].sellingprice,
				describe: $scope.selected[i].describe,
				mainproductimage: $scope.selected[i].mainproductimage,
				productstatus: $scope.selected[i].productstatus,
				style: $scope.selected[i].style,
				category: $scope.selected[i].category
			};
			var item = angular.copy($scope.forms);
			$http.post('/rest/productdiscount', item).then(resp => {
				resp.data.startdate = new Date(resp.data.startdate);
				resp.data.enddate = new Date(resp.data.enddate);
				$scope.items.push(item);
				$scope.reset();
				$scope.items = [];
				$scope.initialize();
				Swal.fire({
					position: 'top-middle',
					icon: 'success',
					title: 'Thêm mới thành công',
					showConfirmButton: false,
					timer: 1500
				})
			}).catch(error => {
				Swal.fire({
					position: 'top-middle',
					icon: 'error',
					title: 'Thêm mới thất bại',
					showConfirmButton: false,
					timer: 1500
				})
			});
		}

		$scope.changeModel = null;
		$scope.itemsCategory = {};
	}
	
	
	//Update
	$scope.update = function() {
		var item = angular.copy($scope.form);
		$http.put(`/rest/productdiscount/${item.productdiscountid}`, item).then(resp => {
			var index = $scope.items.findIndex(p => p.productdiscountid == item.productdiscountid);
			$scope.items[index] = item;
			$scope.reset();
			Swal.fire({
				position: 'top-middle',
				icon: 'success',
				title: 'Update thành công',
				showConfirmButton: false,
				timer: 1500
			})
		}).catch(error => {
			Swal.fire({
				position: 'top-middle',
				icon: 'error',
				title: 'Update thất bại',
				showConfirmButton: false,
				timer: 1500
			})
			console.log("Error", error);
		});
	}
	
	//Delete
	$scope.delete = function(item) {
		$http.delete(`/rest/productdiscount/${item.productdiscountid}`).then(resp => {
			var index = $scope.items.findIndex(p => p.productdiscountid == item.productdiscountid);
			$scope.items.splice(index,1);
			$scope.reset();
			Swal.fire({
				position: 'top-middle',
				icon: 'success',
				title: 'Xóa thành công',
				showConfirmButton: false,
				timer: 1500
			})
		}).catch(error => {
			Swal.fire({
				position: 'top-middle',
				icon: 'error',
				title: 'Xóa thất bại',
				showConfirmButton: false,
				timer: 1500
			})
			console.log("Error", error);
		});
	}
	
	$scope.pager = {
		page : 0,
		size : 10,
		
		get items() {
			var start = this.page * this.size;
			var end = start + this.size;
			return $scope.items.slice(start, end);
		},
		
		get count() {
			return Math.ceil(1.0 * $scope.items.length / this.size);
		},
		
		first() {
			this.page = 0;
		},
		
		prev() {
			this.page--;
			if(this.page < 0) {
				this.last();
			}
		},
		
		next() {
			this.page++;
			if(this.page >= this.count){
				this.first();
			}
		},
		
		last(){
			this.page = this.count - 1;
		}
	}
	
});