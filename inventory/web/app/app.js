var app = angular.module('myApp', ['ngRoute', 'ui.bootstrap', 'ngAnimate','angularCharts']);

app.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider
            .when('/', {
                  templateUrl: 'pages/login.html',
                  controller: 'homeCtrl'
                  })
            
            .when('/product', {
                  title: 'Products',
                  templateUrl: 'pages/products.html',
                  controller: 'productsCtrl'
                  })
            
            .when('/help', {
                  templateUrl: 'pages/help.html',
                  controller: 'helpCtrl'
                  })
            
            .when('/download', {
                  templateUrl: 'pages/download.html',
                  controller: 'downloadCtrl'
                  })
            
    .otherwise({
      redirectTo: '/'
    });
            
}]);

function MainCtrl($scope) {
    $scope.config = {
    title: 'Products',
    tooltips: true,
    labels: false,
    mouseover: function() {},
    mouseout: function() {},
    click: function() {},
    legend: {
    display: true,
        //could be 'left, right'
    position: 'right'
    }
    };
    
    $scope.data = {
    series: ['Sales', 'Income', 'Expense', 'Laptops', 'Keyboards'],
    data: [{
           x: "Laptops",
           y: [100, 50000, 30000],
           tooltip: "this is tooltip"
           }, {
           x: "Desktops",
           y: [500, 10000, 8000]
           }, {
           x: "Mobiles",
           y: [300,4000,3500]
           }, {
           x: "Tablets",
           y: [200,1000 , 879]
           }]
    };
}