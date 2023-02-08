app.controller("size", function($scope, $http){
	$scope.form = {};
	$scope.initialize = function(){
		$http.get("/rest/sizes").then(resp => {
			$scope.items = resp.data;
		});
		$scope.reset();
		
	}
	
	$scope.reset = function(){
		$scope.form = {
			sizeid: '',
			describe: '',	
		}
	}

	//$scope.edit = function(item){
	//	$scope.form = angular.copy(item);
		//$(".nav-tabs a:eq(0)").tab("0");
	//}
	$scope.edit = function(item) {
		console.log(item);
        $scope.form = angular.copy(item);
		$(".nav-tabs .nav-item button.nav-link:eq(0)").tab('show');
	}

	$scope.create = function(){
		var item = angular.copy($scope.form);
		console.log(item);
		$http.post(`/rest/sizes`, item).then(resp => {
			$scope.items.push(resp.data);
			$scope.reset();
			alert("Thêm mới thành công!");
		}).catch(error => {
			alert("Lỗi thêm mới !");
			console.log("Error", error);
		});
	}

	$scope.update = function(){
		var item = angular.copy($scope.form);
		$http.put(`/rest/sizes/${item.sizeid}`, item).then(resp => {
			var index = $scope.items.findIndex(p => p.sizeid == item.sizeid);
			$scope.items[index] = item;
			alert("Cập nhật thành công!");
		})
		.catch(error => {
			alert("Lỗi cập nhật !");
			console.log("Error", error);
		});
	}

	$scope.delete = function(item){
		if(confirm("Bạn muốn xóa sản phẩm này?")){
			$http.delete(`/rest/sizes/${item.sizeid}`).then(resp => {
				var index = $scope.items.findIndex(p => p.sizeid == item.sizeid);
				$scope.items.splice(index, 1);
				$scope.reset();
				alert("Xóa thành công!");
				
			}).catch(error => {
				alert("Lỗi xóa !");
				console.log("Error", error);
			})
		}
	}
	
	$scope.initialize();

	$scope.pager = {
		page: 0,
		size: 10,
		get items(){
			if(this.page < 0){
				this.last();
			}
			if(this.page >= this.count){
				this.first();
			}
			var start = this.page*this.size;
			return $scope.items.slice(start, start + this.size)
		},
		get count(){
			return Math.ceil(1.0 * $scope.items.length / this.size);
		},
		first(){
			this.page = 0;
		},
		last(){
			this.page = this.count - 1;
		},
		next(){
			this.page++;
		},
		prev(){
			this.page--;
		}
	}
});