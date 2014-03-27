'use strict'

mgApp = angular.module('mgApp', [
  'ngAnimate'
  'ngSanitize',
  'ui.router'
  'mgcrea.ngStrap'
])

mgApp.constant('_', window._);
mgApp.constant('URI', window.URI);
mgApp.constant('URITemplate', window.URITemplate);


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
      $log.debug '$stateChangeStart'

    $rootScope.$on '$stateChangeSuccess', () ->
      $log.debug '$stateChangeSuccess'

    $rootScope.$on '$stateNotFound', () ->
      $log.debug '$stateNotFound'

    $rootScope.$on '$stateChangeError', () ->
      $log.debug '$stateChangeError'

    # bugggé pour le moment attendre la 0.0.3
    $rootScope.$on '$viewContentLoading', () ->
      $log.debug '$viewContentLoading'

]