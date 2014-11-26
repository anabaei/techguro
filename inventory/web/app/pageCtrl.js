

app.controller('helpCtrl', function($scope) {
                // create a message to display in our view
                $scope.message = 'Technical support';
                });

app.controller('homeCtrl', function($scope) {
               // create a message to display in our view
               $scope.message = 'home';
               });


app.controller('downloadCtrl', function($scope) {
               // create a message to display in our view
               $scope.message = 'download';
               });

app.controller('imageCtrl', function($scope) {
               
               $scope.path = '/images/box.png';
               });