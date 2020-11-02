app.controller("listController",
        function listController($state, $scope, toaster, $http, DTOptionsBuilder, $modal, $log, ErrorService, $resource, $location, initialData, $stateParams) {

            $scope.errorService = ErrorService;

            $scope.searchitem = {};
            $scope.searchitem1 = {};

            var categorie = initialData.data.categorie;
            $scope.categorie = initialData.data.categorie;
            $scope.listmodel = initialData.data;
            $scope.dtColumnDefs = initialData.data.columns;
            $scope.dtOptions = DTOptionsBuilder
                    .newOptions()
                    .withOption('ajax', {
                        url: 'datatables/' + $stateParams.categorie,
                        type: 'GET'
                    })
                    .withDataProp('data')
                    .withPaginationType('full')
                    .withOption("serverSide", true)
                    .withOption("bFilter", false)

                    .withBootstrap()
                    // Add Table tools compatibility
                    .withTableTools('vendor/jquery/datatables/copy_csv_xls.swf')
                    .withTableToolsOption("sRowSelect", "multi")
                    .withTableToolsButtons([
                        "editrow", "delrow", "csv", "select_all", "select_none"
                    ]);

            $scope.dtOptions1 = DTOptionsBuilder
                    .fromSource('datatables1/' + categorie)
                    .withPaginationType('full')
                    .withBootstrap()
                    // Add Table tools compatibility
                    .withTableTools('vendor/jquery/datatables/copy_csv_xls.swf')
                    .withTableToolsOption("sRowSelect", "multi")
                    .withTableToolsButtons([
                        "addrow", "editrow1", "delrow", "csv", "select_all", "select_none"
                    ]);

            $scope.dtOptions2 = DTOptionsBuilder
                    .fromSource('query/' + $stateParams.query)
                    .withPaginationType('full')
                    .withBootstrap()
                    // Add Table tools compatibility
                    .withTableTools('vendor/jquery/datatables/copy_csv_xls.swf')
                    .withTableToolsButtons([
                        "csv", "xls"
                    ]);

            $scope.search = function() {
                $scope.errorService.setwaiting();
                $http({
                    method: 'POST',
                    url: $stateParams.categorie + '/search1',
                    data: $.param($scope.searchitem), // pass in data as strings
                    headers: {'Content-Type': 'application/x-www-form-urlencoded'}  // set the headers so angular passing info as form data (not request payload)
                })
                        .success(function(data) {
                            $scope.errorService.setSucces();
                            $('#dataTables-example').DataTable().ajax.reload();
                        });

            };

            $scope.searchfull = function() {
                $scope.errorService.setwaiting();
                $http({
                    method: 'POST',
                    url: $stateParams.categorie + '/searchfull',
                    data: $.param($scope.searchitem1), // pass in data as strings
                    headers: {'Content-Type': 'application/x-www-form-urlencoded'}  // set the headers so angular passing info as form data (not request payload)
                })
                        .success(function(data) {
                            $scope.errorService.setSucces();
                            $('#dataTables-example').DataTable().ajax.reload();
                        });

            };

            $scope.openformprocess = function(size, process) {
                var modalInstance = $modal.open({
                    templateUrl: 'tpl/process.html',
                    controller: 'ProcessController',
                    resolve: {
                        formModel: function($http) {
                            var formmodel = $http.get(process.reference + '/processmodel')
                                    .success(function(data) {
                                        return data;
                                    });
                            return  formmodel;
                        },
//                        initialData: function($http) {
//                            var initdata = $http.get(process.reference + '/processmodel')
//                                    .success(function(data) {
//                                        return data;
//                                    });
//                            return  initdata;
//                        },
                        deps: ['$ocLazyLoad',
                            function($ocLazyLoad) {
                                return $ocLazyLoad.load(['ui.select', 'datatables']);
                            }]
                    },
                    size: size
                });

                modalInstance.result.then(function() {
                    $log.info('Modal closed at: ' + new Date());
                }, function() {
                    $log.info('Modal dismissed at: ' + new Date());
                });

            };

            $scope.openFormRelation = function(size, row) {
                var modalInstance = $modal.open({
                    templateUrl: 'tpl/form_modal.html',
                    controller: 'ModalformController',
                    resolve: {
                        formData: function($stateParams, $http) {
                            var datas = $http({method: 'GET', url: $stateParams.categorie + '/' + $stateParams.id + '/' + initialData.data.categorie + '/getElement1/' + row + '/' + $scope.listmodel.mappedby}).
                                    success(function(data, status, headers, config) {
                                        return data;
                                    });
                            return datas;
                        },
                        formModel: function($stateParams, $http) {
                            var datas = $http({method: 'GET', url: initialData.data.categorie + '/formmodel1/' + $scope.listmodel.mappedby}).
                                    success(function(data, status, headers, config) {
                                        return data;
                                    });
                            return datas;
                        }
                    },
                    size: size
                });

                modalInstance.result.then(function() {
                    $log.info('Modal closed at: ' + new Date());
//                    $state.reload();
                    $('#dataTable-' + categorie).DataTable().ajax.reload();
                }, function() {
                    $log.info('Modal dismissed at: ' + new Date());
//                    $state.reload();
                    $('#dataTable-' + categorie).DataTable().ajax.reload();
                });
            };

          


            $scope.alerte = function() {
                var oTT = $.fn.dataTable.TableTools.fnGetInstance('dataTables-example');
                //oTT.fnSelectAll();
                alert(JSON.stringify(oTT.fnGetSelectedData(), ['Index']));
            };


            $.fn.dataTable.TableTools.buttons.addrow = $.extend(
                    {}, $.fn.dataTable.TableTools.buttonBase,
                    {
                        "sButtonText": "<i class=\"fa fa-plus\"></i>",
                        "sToolTip": "New Data",
                        "fnClick": function(nButton, oConfig) {
                            $scope.openFormRelation('lg', -1);
                        }

                    }
            );
            $.fn.dataTable.TableTools.buttons.editrow = $.extend(
                    {}, $.fn.dataTable.TableTools.BUTTONS.select,
                    {
                        "sButtonText": "<i class=\"fa fa-edit\"></i>",
                        "sToolTip": "Edit Data",
                        "fnClick": function(nButton, oConfig) {
                            $state.go('app.form.elt', {id: (this.fnGetSelectedData()[0]).Index, categorie: categorie});
                        }
                    }
            );
            $.fn.dataTable.TableTools.buttons.editrow1 = $.extend(
                    {}, $.fn.dataTable.TableTools.buttons.editrow,
                    {
                        "fnClick": function(nButton, oConfig) {
                            $scope.openFormRelation('lg', (this.fnGetSelectedData()[0]).Index);
                        }
                    }
            );

            $.fn.dataTable.TableTools.buttons.delrow = $.extend(
                    {}, $.fn.dataTable.TableTools.BUTTONS.select,
                    {
                        "sButtonText": "<i class=\"fa fa-trash-o\"></i>",
                        "sToolTip": "Delete Data",
                        "fnClick": function(nButton, oConfig) {
                            //confirm dialogue
                            var r = confirm("Confirm ?");
                            if (r == true) {
                                $http.get(categorie + '/del/' + (this.fnGetSelectedData()[0]).code + '?row=' + (this.fnGetSelectedData()[0]).Index)
                                        .success(function(data) {
                                            toaster.pop("success", "Success", "Suppression Effectuée avec Succès");
                                            $('#dataTables-example').DataTable().ajax.reload();
                                        }).error(function(data) {
                                    toaster.pop("error", "Error", data);
                                    $('#dataTables-example').DataTable().ajax.reload();
                                });
                            }
                            ;

                        }
                    }
            );


        });


app.controller('ProcessController',
        ['formModel', '$modal', '$modalInstance', '$log', '$state', '$scope', '$http', 'toaster', 'ErrorService',
            function ProcessController(formModel, $modal, $modalInstance, $log, $state, $scope, $http, toaster, ErrorService) {
                $scope.master = {};
                $scope.errorService = ErrorService;
                $scope.errorService.clear();
                $scope.tsoftitem = formModel.data.dataform;
                $scope.master = angular.copy(formModel.data.dataform);

                $scope.formmodel = formModel.data.form;
                $scope.url = formModel.data.url;

                $scope.beforesave = function() {
                    $scope.tsoftitem1 = angular.copy($scope.tsoftitem);
                    angular.forEach($scope.formmodel.joincolumns, function(item) {
                        if ($scope.tsoftitem[item] !== null) {
                            $scope.tsoftitem1[item] = $scope.tsoftitem[item].code;
                        }
                    });
                    $scope.errorService.setwaiting();
                };

                $scope.aftersave = function() {
                    toaster.pop("success", "Success", "Operation Effectuée avec Succès");
                    $scope.errorService.setSucces();
                    $scope.form.$setPristine();
                };

                $scope.run = function() {
                    if ($scope.formmodel.ismultipart) {
                        $scope.runprocessMultipart();
                    } else {
                        if ($scope.formmodel.typeservice === 'REPORT') {
                            $scope.runprocessReport();
                        } else {
                            $scope.runprocessAction();
                        }
                    }
                };

                $scope.runprocessMultipart = function() {
                    $scope.beforesave();
                    var fd = new FormData();
                    angular.forEach($scope.tsoftitem, function(value, key) {
                        fd.append(key, value);
                    });
                    $http.post($scope.formmodel.categorie + '/processrun', fd, {
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}
                    })
                            .success(function(data) {
                                $scope.aftersave();
                            });


                };

                //run the process Action
                $scope.runprocessAction = function() {
                    $scope.beforesave();
                    $http({
                        method: 'POST',
                        url: $scope.formmodel.categorie + '/processrun',
                        data: $.param($scope.tsoftitem1), // pass in data as strings
                        headers: {'Content-Type': 'application/x-www-form-urlencoded'}  // set the headers so angular passing info as form data (not request payload)
                    })
                            .success(function(data) {
                                $scope.aftersave();

                            });
                };
                function getFileNameFromHeader(header) {
                    if (!header)
                        return null;
                    var result = header.split(";")[1].trim().split("=")[1];
                    return result.replace(/"/g, '');
                }
                ;
                //run the process Report
                $scope.runprocessReport = function() {
                    $scope.beforesave();
                    $http({
                        method: 'POST',
                        url: $scope.formmodel.categorie + '/processreport',
                        data: $.param($scope.tsoftitem1), // pass in data as strings
                        responseType: 'arraybuffer',
                        transformResponse: function(data, headersGetter, status) {
                            var file = null;
                            if (data) {
                                file = new Blob([data], {
                                    type: 'octet/stream' //or whatever you need, should match the 'accept headers' above
                                });
                            }

                            //server should sent content-disposition header
                            var fileName = getFileNameFromHeader(headersGetter('content-disposition'));
                            var result = {
                                blob: file,
                                fileName: fileName
                            };

                            return {
                                response: result
                            };
                        },
                        headers: {'Content-Type': 'application/x-www-form-urlencoded'}  // set the headers so angular passing info as form data (not request payload)
                    })
                            .success(function(data) {
                                saveAs(data.response.blob, data.response.fileName);
                                $scope.aftersave();

                            });
                };

                $scope.closemodal = function() {
                    $modalInstance.dismiss('cancel');
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
                                $scope.tsoftitem[res.data.name] = null;
                                $scope.formmodel.selectmodels[res.data.name] = res.data.value;
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
                        $log.info('Modal closed at: ' + new Date());
                    }, function() {
                        $log.info('Modal dismissed at: ' + new Date());
                    });
                };


            }]);
       