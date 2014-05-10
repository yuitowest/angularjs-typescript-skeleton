/// <reference path="types/tsd.d.ts"/>

var app = angular.module('sample', ['ngRoute'])
  .config(function ($routeProvider:ng.route.IRouteProvider) {
    $routeProvider.when('/', {
      controller: 'MainCtrl',
      templateUrl: '/views/main.html'
    }).otherwise({
      redirectTo: '/'
    });
  });
