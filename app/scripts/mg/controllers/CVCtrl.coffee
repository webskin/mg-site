'use strict'

mgApp = angular.module 'mgApp'

mgApp.controller 'mg.CVCtrl', [
  '$scope'
  '$http'
  'mg.CVService'
  ($scope, $http, cvService) ->
    $scope.cv = null

    cvService.get().then(
      (success) =>
        $scope.cv = success.data
        success
    )

]