app.controller("HomeController",
        function HomeController($scope, $http, $state, $modal, $log, ErrorService) {
            $http.get('menu')
                    .success(function(data) {
                        $scope.rubriques = data.rubriques;
                        $scope.menus = data.menus;

                    });

            $scope.logout = function() {
                $http.post('signout')
                        .success(function(data) {
                            $state.go("access.signin");
                        });
            };


        });
