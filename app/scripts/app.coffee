'use strict'

mgApp = angular.module('mgSiteApp', [
  'ngAnimate'
  'ngCookies',
  'ngSanitize',
  'ui.router'
  'mgcrea.ngStrap'
])

mgApp.config [
  '$stateProvider'
  '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider) ->

    $urlRouterProvider
      .when '/',
        redirectTo: '/cv'
      .otherwise
        redirectTo: '/cv'

    $stateProvider
      .state 'cv',
          url: '/'
          templateUrl: 'views/cv.html'
          controller: 'spnm.CVCtrl'
]
