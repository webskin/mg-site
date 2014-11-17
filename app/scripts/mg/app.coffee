'use strict'

mgApp = angular.module('mgApp', [
  'ngAnimate'
  'ngSanitize',
  'ui.router'
])

mgApp.constant('_', window._)
mgApp.constant('URI', window.URI)
mgApp.constant('URITemplate', window.URITemplate)
mgApp.constant('moment', window.moment)

missionAngularOption =
  anonyme: true
  pourImpression: true
  pourImpressionOptions:
    projetsToExclude: [22, 19, 18, 17, 15, 14, 13, 12, 8, 9, 5]
    formationsToExclude: [1, 2]

freelanceInfoOption =
  anonyme: false
  pourImpression: true
  pourImpressionOptions:
    projetsToExclude: [18, 15, 14, 12, 8, 9, 5]
    formationsToExclude: [1, 2]

mgApp.constant 'mg.options', missionAngularOption


mgApp.config [
  '$stateProvider'
  '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider) ->

    $urlRouterProvider
      .when '/', () -> '/cv'
      .otherwise '/cv'

    $stateProvider
      .state 'cv',
        url: '/cv'
        templateUrl: 'views/cv.html'
        controller: 'mg.CVCtrl'
      .state 'cv2',
        url: '/cv2'
        templateUrl: 'views/cv.html'
        controller: 'mg.CVCtrl'
]


mgApp.run [
  '$log'
  '$rootScope'
  '$state'
  '$stateParams'
  '$window'
  ($log, $rootScope, $state, $stateParams, $window) ->

    # permet l'utisation de LoDash dans les controlleurs et les vues
    ###
    <div ng-repeat="item in _.range(1, 11)">
      {{ item }}
    </div>
    ###
    $rootScope._ = $window._

    # config ui-router
    ###
    <ul class="nav">
      <li ng-class="{ active: $state.includes('contacts') }"><a href="#/contacts">Contacts</a></li>
      <li ng-class="{ active: $state.includes('about') }"><a href="#/about">About</a></li>
    </ul>
    ###
    $rootScope.$state = $state
    $rootScope.$stateParams = $stateParams

    $rootScope.$on '$stateChangeStart', () ->

    $rootScope.$on '$stateChangeSuccess', () ->

    $rootScope.$on '$stateNotFound', () ->

    $rootScope.$on '$stateChangeError', () ->

    # bugggé pour le moment attendre la 0.0.3
    $rootScope.$on '$viewContentLoading', () ->

]