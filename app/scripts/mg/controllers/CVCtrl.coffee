'use strict'

mgApp = angular.module 'mgApp'

mgApp.controller 'mg.CVCtrl', [
  '$scope'
  '$http'
  'mg.CVMappings'
  ($scope, $http, mappings) ->
    $scope.cv = null

    $http.get('/resources/cv.json').then(
      (success) =>
        success.data = mappings.cvDeserializer success.data
        $scope.cv = success.data
        success
    )

]