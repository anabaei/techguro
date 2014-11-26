app.controller('productsCtrl', function ($scope, $modal, $filter, Data) {
               //sample data, can be manipulated by json file
               $scope.products = [
                                  {id: '1',name:'Mobile phone', price: '300', stock: '30', packing: '1 for 1', status: 'Inactive', description: 'mobiles'},
                                  {id: '2',name:'Desktop', price: '800', stock: '300', packing: '1 for 1',status: 'Active', description: 'computer'},
                                 
                                  {id: '3',name: 'labtop', price: '500', stock: '300', packing: '1 for 1',status: 'Inactive', description: 'computer'},
                                  
                                  {id: '4',name: 'tablet', price: '200', stock: '300', packing: '1 for 1',status: 'Active', description: 'tablet'}
                                 ];
               
               $scope.product = {};
            
               Data.get('products').then(function(data){
                                         $scope.products = data.data;
                                         });
               $scope.changeProductStatus = function(product){
               product.status = (product.status=="Active" ? "Inactive" : "Active");
               Data.put("products/"+product.id,{status:product.status});
               };
               $scope.deleteProduct = function(product){
               if(confirm("Are you sure to remove the product")){
               Data.delete("products/"+product.id).then(function(result){
                                                        $scope.products = _.without($scope.products, _.findWhere($scope.products, {id:product.id}));
                                                        });
               }
               };
               $scope.open = function (p,size) {
               var modalInstance = $modal.open({
                                               templateUrl: 'partials/productEdit.html',
                                               controller: 'productEditCtrl',
                                               size: size,
                                               resolve: {
                                               item: function () {
                                               return p;
                                               }
                                               }
                                               });
               modalInstance.result.then(function(selectedObject) {
                                         if(selectedObject.save == "insert"){
                                         $scope.products.push(selectedObject);
                                         $scope.products = $filter('orderBy')($scope.products, 'id', 'reverse');
                                         }else if(selectedObject.save == "update"){
                                         p.description = selectedObject.description;
                                         p.price = selectedObject.price;
                                         p.stock = selectedObject.stock;
                                         p.packing = selectedObject.packing;
                                         }
                                         });
               };
               
               $scope.columns = [
                                 {text:"ID",predicate:"id",sortable:true,dataType:"number"},
                                 {text:"Name",predicate:"name",sortable:true},
                                 {text:"Price",predicate:"price",sortable:true},
                                 {text:"Stock",predicate:"stock",sortable:true},
                                 {text:"Packing",predicate:"packing",reverse:true,sortable:true,dataType:"number"},
                                 {text:"Description",predicate:"description",sortable:true},
                                 {text:"Status",predicate:"status",sortable:true},
                                 {text:"Action",predicate:"",sortable:false}
                                 ];
               
               });


app.controller('productEditCtrl', function ($scope, $modalInstance, item, Data) {
               
               $scope.product = angular.copy(item);
               
               $scope.cancel = function () {
               $modalInstance.dismiss('Close');
               };
               $scope.title = (item.id > 0) ? 'Edit Product' : 'Add Product';
               $scope.buttonText = (item.id > 0) ? 'Update Product' : 'Add New Product';
               
               var original = item;
               $scope.isClean = function() {
               return angular.equals(original, $scope.product);
               }
               $scope.saveProduct = function (product) {
               product.uid = $scope.uid;
               if(product.id > 0){
               Data.put('products/'+product.id, product).then(function (result) {
                                                              if(result.status != 'error'){
                                                              var x = angular.copy(product);
                                                              x.save = 'update';
                                                              $modalInstance.close(x);
                                                              }else{
                                                              console.log(result);
                                                              }
                                                              });
               }else{
               product.status = 'Active';
               Data.post('products', product).then(function (result) {
                                                   if(result.status != 'error'){
                                                   var x = angular.copy(product);
                                                   x.save = 'insert';
                                                   x.id = result.data;
                                                   $modalInstance.close(x);
                                                   }else{
                                                   console.log(result);
                                                   }
                                                   });
               }
               /* $scope.$watch('saveProduct', function (newValue) {
                             $("#bcTarget").barcode({[{product.id}]}, "ean13");
                             });    */
               };
               
               });
