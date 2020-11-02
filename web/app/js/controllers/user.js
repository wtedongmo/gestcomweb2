'use strict';

/* Controllers */
// signin controller
app.controller('UserController', ['$rootScope', '$scope', '$http', '$state', 'toaster',
    function($rootScope, $scope, $http, $state, toaster) {
        $scope.user = {};
        $scope.authError = null;
        $scope.login = function() {
            $scope.authError = null;
            // Try to login
            $http({
                method: 'POST',
                url: 'connect',
                data: $.param($scope.user), // pass in data as strings
                headers: {'Content-Type': 'application/x-www-form-urlencoded'}  // set the headers so angular passing info as form data (not request payload)
            })
                    .then(function(response) {
                        $rootScope.username = response.data;
                        $state.go('app.home');

                    }, function(x) {
                        console.log(x);
                        $scope.authError = x.data.message;
                        if (x.data.code) {
                            $state.go('access.changepwdexp');
                        }

                    });
        };

        $scope.chgtpwd = function() {
            $scope.authError = null;
            $http({
                method: 'POST',
                url: 'changepassword',
                data: $.param($scope.user), // pass in data as strings
                headers: {'Content-Type': 'application/x-www-form-urlencoded'}  // set the headers so angular passing info as form data (not request payload)
            })
                    .then(function(response) {
                        $state.go('access.signin');
                    }, function(x) {
                        toaster.pop("error", "Error", x.data);
                    });
        };

        $scope.changepasswordexp = function() {
            $scope.authError = null;
            $http({
                method: 'POST',
                url: 'changepasswordexp',
                data: $.param($scope.user), // pass in data as strings
                headers: {'Content-Type': 'application/x-www-form-urlencoded'}  // set the headers so angular passing info as form data (not request payload)
            })
                    .then(function(response) {
                        $scope.login();
                    }, function(x) {
                        $scope.authError = x.data;

                    });
        };
        $scope.forgotpassword = function() {
            $scope.authError = null;
            $http({
                method: 'POST',
                url: 'forgotpassword',
                data: $.param($scope.user), // pass in data as strings
                headers: {'Content-Type': 'application/x-www-form-urlencoded'}  // set the headers so angular passing info as form data (not request payload)
            })
                    .then(function(response) {
                        $scope.user.password = $scope.user.username;
                        $scope.login();
                        toaster.pop("Succes", "Success", "Nouveau Mot de passe" + $scope.user.username);
                    }, function(x) {
                        $scope.authError = x.data;

                    });
        };
    }])
        ;