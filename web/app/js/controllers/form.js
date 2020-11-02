app.controller('formController',
        ['$modal', 'formData', 'formModel', '$state', '$scope', '$http', 'toaster', 'ErrorService',
            function formController($modal, formData, formModel, $state, $scope, $http, toaster, ErrorService) {
                $scope.master = {};
                $scope.errorService = ErrorService;
                $scope.errorService.clear();
                $scope.tsoftitem = formData.data;
                $scope.master = angular.copy(formData.data);

                $scope.formmodel = formModel.data;

                $scope.gotoElement = function(row) {
                    $state.go('app.form.elt', {id: row, categorie: formData.data.categorie});
                };

                $scope.reset = function() {
                    $scope.tsoftitem = angular.copy($scope.master);
                    $scope.form.$setPristine();
                };

                $scope.del = function(row, code, nbrow) {
                    var r = confirm("Confirm ?");
                    if (r == true) {
                        $http.get(formData.data.categorie + '/del/' + code + '?row=' + row)
                                .success(function(data) {
                                    toaster.pop("success", "Success", "Suppression Effectuée avec Succès");
                                    if (nbrow >= 2) {
                                        $scope.gotoElement(0);
                                    }
                                    else {
                                        $scope.gotoElement(-1);
                                    }

                                }).error(function(data) {
                            toaster.pop("error", "Error", data);
                        });

                    }

                };

                $scope.getElement = function(row) {
                    $http.get(formData.data.categorie + '/getElement/' + row)
                            .success(function(data) {
                                $scope.tsoftitem = data;
                                $scope.master = angular.copy(data);
                                $scope.form.$setPristine();
                            });
                };

                $scope.getElementClone = function(row) {
                    $http.get(formData.data.categorie + '/getElementClone/' + row)
                            .success(function(data) {
                                $scope.tsoftitem = data;
                                $scope.master = angular.copy(data);
                                $scope.form.$setPristine();
                            });
                };

                $scope.beforesave = function() {
                    angular.forEach($scope.formmodel.joincolumns, function(item) {
                        if ($scope.tsoftitem[item] !== null) {
                            $scope.tsoftitem[item] = $scope.tsoftitem[item].code;
                        }
                    });
                    $scope.errorService.setwaiting();
                };

                $scope.aftersave = function() {
                    toaster.pop("success", "Success", "Operation Effectuée avec Succès");
                    $scope.errorService.setSucces();
                    $scope.form.$setPristine();
                };
                $scope.saveitem = function(modal, saveclose) {
                    if ($scope.formmodel.ismultipart) {
                        $scope.saveFile(modal, saveclose);
                    } else {
                        $scope.save(modal, saveclose);
                    }
                };
                $scope.save = function(modal, saveclose) {
                    $scope.beforesave();
                    $http({
                        method: 'POST',
                        url: formData.data.categorie + '/save',
                        data: $.param(($scope.tsoftitem)), // pass in data as strings
                        headers: {'Content-Type': 'application/x-www-form-urlencoded'}  // set the headers so angular passing info as form data (not request payload)
                    })
                            .success(function(data) {
                                if (modal === true) {
                                    if (saveclose === true) {

                                    } else {
                                        $scope.getElement(-1);
                                    }
                                } else {
                                    $scope.gotoElement(data.row);
                                }

                                $scope.aftersave();
                            });
                };

                $scope.saveFile = function(modal, saveclose) {
                    $scope.beforesave();
                    var fd = new FormData();
                    angular.forEach($scope.tsoftitem, function(value, key) {
                        if ($scope.tsoftitem[key] !== null) {
                            fd.append(key, value);
                        }
                    });
                    $http.post(formData.data.categorie + '/saveMultiPart', fd, {
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}
                    })
                            .success(function(data) {
                                if (modal === true) {
                                    if (saveclose === true) {

                                    } else {
                                        $scope.getElement(-1);
                                    }
                                } else {
                                    $scope.gotoElement(data.row);
                                }

                                $scope.aftersave();
                            });


                };

                //autocompletion
                $scope.getItems = function(val, subcategorie, name) {
                    if (val.length < 4)
                        return;
                    return $http.get(subcategorie + '/autocomplete', {
                        params: {
                            cval: val
                        }
                    }).then(function(res) {
                        var items = [];
                        angular.forEach(res.data, function(item) {
                            items.push(item);
                        });
                        $scope.formmodel.selectmodels[name] = items;
                        return items;
                    });
                };


                //doubleselect
                $scope.select = function(fieldname, fieldvalue) {
                    return $http.get(formData.data.categorie + '/doubleselect/' + fieldname + '/' + fieldvalue)
                            .then(function(res) {
                                // $scope.tsoftitem[res.data.name] = null;
                                $scope.formmodel.selectmodels[res.data.name] = res.data.value;
                            });
                };


                $scope.onChangeField = function(onchangeValue) {
                    if (onchangeValue === false) {
                        return;
                    }
                    angular.forEach($scope.formmodel.joincolumns, function(item) {
                        if ($scope.tsoftitem[item] !== null) {
                            $scope.tsoftitem[item] = $scope.tsoftitem[item].code;
                        }
                    });
                    $http({
                        method: 'POST',
                        url: formData.data.categorie + '/onChange',
                        data: $.param(($scope.tsoftitem)), // pass in data as strings
                        headers: {'Content-Type': 'application/x-www-form-urlencoded'}  // set the headers so angular passing info as form data (not request payload)
                    })
                            .success(function(data) {
                                angular.forEach(data, function(value, key) {
                                    $scope.tsoftitem[key] = value;
                                });

                            });
                };
                $scope.openform = function(size, categorie, code) {
                    var modalInstance = $modal.open({
                        templateUrl: 'tpl/form_modal.html',
                        controller: 'ModalformController',
                        resolve: {
                            formData: function($stateParams, $http) {
                                var datas = $http({method: 'GET', url: categorie + '/getElementByCode/' + code}).
                                        success(function(data, status, headers, config) {
                                            return data;
                                        });
                                return datas;
                            },
                            formModel: function($stateParams, $http) {
                                var datas = $http({method: 'GET', url: categorie + '/formmodel'}).
                                        success(function(data, status, headers, config) {
                                            return data;
                                        });
                                return datas;
                            }
                        },
                        size: size
                    });

                    modalInstance.result.then(function() {
                        $log.info('Modal Form   closed at: ' + new Date());
                    }, function() {
                        $log.info('Modal Form dismissed at: ' + new Date());
                    });
                };
            }]);



app.controller('ModalformController',
        ['$modal', '$modalInstance', 'formData', 'formModel', '$state', '$scope', '$http', 'toaster', 'ErrorService',
            function ModalformController($modal, $modalInstance, formData, formModel, $state, $scope, $http, toaster, ErrorService) {

                $scope.closemodal = function() {
                    $modalInstance.dismiss('cancel');
                };

                $scope.master = {};
                $scope.errorService = ErrorService;
                $scope.errorService.clear();
                $scope.tsoftitem = formData.data;
                $scope.master = angular.copy(formData.data);

                $scope.formmodel = formModel.data;

                $scope.gotoElement = function(row) {
                    $state.go('app.form.elt', {id: row, categorie: formData.data.categorie});
                };

                $scope.reset = function() {
                    $scope.tsoftitem = angular.copy($scope.master);
                    $scope.form.$setPristine();
                };

                $scope.del = function(row, code, nbrow) {
                    var r = confirm("Confirm ?");
                    if (r == true) {
                        $http.get(formData.data.categorie + '/del/' + code + '?row=' + row)
                                .success(function(data) {
                                    toaster.pop("success", "Success", "Suppression Effectuée avec Succès");
                                    if (nbrow >= 2) {
                                        $scope.gotoElement(0);
                                    }
                                    else {
                                        $scope.gotoElement(-1);
                                    }

                                }).error(function(data) {
                            toaster.pop("error", "Error", data);
                        });

                    }

                };

                $scope.getElement = function(row) {
                    $http.get(formData.data.categorie + '/getElement/' + row)
                            .success(function(data) {
                                $scope.tsoftitem = data;
                                $scope.master = angular.copy(data);
                                $scope.form.$setPristine();
                            });
                };

                $scope.getElementClone = function(row) {
                    $http.get(formData.data.categorie + '/getElementClone/' + row)
                            .success(function(data) {
                                $scope.tsoftitem = data;
                                $scope.master = angular.copy(data);
                                $scope.form.$setPristine();
                            });
                };

                $scope.beforesave = function() {
                    angular.forEach($scope.formmodel.joincolumns, function(item) {
                        if ($scope.tsoftitem[item] !== null) {
                            $scope.tsoftitem[item] = $scope.tsoftitem[item].code;
                        }
                    });
                    $scope.errorService.setwaiting();
                };

                $scope.aftersave = function() {
                    toaster.pop("success", "Success", "Operation Effectuée avec Succès");
                    $scope.errorService.setSucces();
                    $scope.form.$setPristine();
                };
                $scope.saveitem = function(saveclose) {
                    if ($scope.formmodel.ismultipart) {
                        $scope.saveFile(saveclose);
                    } else {
                        $scope.save(saveclose);
                    }
                };
                $scope.save = function(saveclose) {
                    $scope.beforesave();
                    $http({
                        method: 'POST',
                        url: formData.data.categorie + '/save',
                        data: $.param(($scope.tsoftitem)), // pass in data as strings
                        headers: {'Content-Type': 'application/x-www-form-urlencoded'}  // set the headers so angular passing info as form data (not request payload)
                    })
                            .success(function(data) {
                                if (saveclose === true) {
                                    $modalInstance.close();
                                } else {
                                    $scope.openFormRelation('lg', -1);
                                }
                                $scope.aftersave();
                            });
                };

                $scope.saveFile = function(saveclose) {
                    $scope.beforesave();
                    var fd = new FormData();
                    angular.forEach($scope.tsoftitem, function(value, key) {
                        if ($scope.tsoftitem[key] !== null) {
                            fd.append(key, value);
                        }
                    });
                    $http.post(formData.data.categorie + '/saveMultiPart', fd, {
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}
                    })
                            .success(function(data) {
                                if (saveclose === true) {
                                    $modalInstance.close();
                                } else {
                                   $scope.openFormRelation('lg', -1);
                                }
                                $scope.aftersave();
                            });


                };

                //autocompletion
                $scope.getItems = function(val, subcategorie, name) {
                    if (val.length < 4)
                        return;
                    return $http.get(subcategorie + '/autocomplete', {
                        params: {
                            cval: val
                        }
                    }).then(function(res) {
                        var items = [];
                        angular.forEach(res.data, function(item) {
                            items.push(item);
                        });
                        $scope.formmodel.selectmodels[name] = items;
                        return items;
                    });
                };


                //doubleselect
                $scope.select = function(fieldname, fieldvalue) {
                    return $http.get(formData.data.categorie + '/doubleselect/' + fieldname + '/' + fieldvalue)
                            .then(function(res) {
                                // $scope.tsoftitem[res.data.name] = null;
                                $scope.formmodel.selectmodels[res.data.name] = res.data.value;
                            });
                };


                $scope.onChangeField = function(onchangeValue) {
                    if (onchangeValue === false) {
                        return;
                    }
                    angular.forEach($scope.formmodel.joincolumns, function(item) {
                        if ($scope.tsoftitem[item] !== null) {
                            $scope.tsoftitem[item] = $scope.tsoftitem[item].code;
                        }
                    });
                    $http({
                        method: 'POST',
                        url: formData.data.categorie + '/onChange',
                        data: $.param(($scope.tsoftitem)), // pass in data as strings
                        headers: {'Content-Type': 'application/x-www-form-urlencoded'}  // set the headers so angular passing info as form data (not request payload)
                    })
                            .success(function(data) {
                                angular.forEach(data, function(value, key) {
                                    $scope.tsoftitem[key] = value;
                                });

                            });
                };
                $scope.openform = function(size, categorie, code) {
                    var modalInstance = $modal.open({
                        templateUrl: 'tpl/form_modal.html',
                        controller: 'formController',
                        resolve: {
                            formData: function($stateParams, $http) {
                                var datas = $http({method: 'GET', url: categorie + '/getElementByCode/' + code}).
                                        success(function(data, status, headers, config) {
                                            return data;
                                        });
                                return datas;
                            },
                            formModel: function($stateParams, $http) {
                                var datas = $http({method: 'GET', url: categorie + '/formmodel'}).
                                        success(function(data, status, headers, config) {
                                            return data;
                                        });
                                return datas;
                            }
                        },
                        size: size
                    });

                    modalInstance.result.then(function() {
                       console.log('Modal Form   closed at: ' + new Date());
                    }, function() {
                        console.log('Modal Form dismissed at: ' + new Date());
                    });
                };



            }])
        ;
       