/// <reference path="../app.ts" />

interface MainCtrlScope extends ng.IScope {
  greeting: { text: string };
}

app.controller('MainCtrl', function ($scope:MainCtrlScope) {
  $scope.greeting = { text: 'Hello' }
});
