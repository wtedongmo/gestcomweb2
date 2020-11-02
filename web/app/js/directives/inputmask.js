/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
angular.module('tsoftApp.services')
        .directive('inputmask2', ['$timeout', function
                    ($timeout) {
                return {
                    link: function(scope, element, attrs) {
                        $timeout(function() {
                            $('#' + attrs['id']).inputmask();
                        })
                    }
                }
            }]);

