'use strict'

mgApp = angular.module 'mgApp'

mgApp.directive 'informationsGeneralesComponent', [
  'moment'
  'mg.CVService'
  'mg.options'
  (moment, cvService, options) ->
    restrict: 'E'
    scope:
      informationsGenerales: '='
    link: (scope, element, attrs) ->
      scope.options = options
      scope.age = () ->
        return '' if not scope.informationsGenerales
        moment().diff(scope.informationsGenerales.naissance, 'years') + 'ans'
    template:"""
<p class="informations-generales" ng-if="!options.anonyme">
    <span class="nom-prenom">{{informationsGenerales.prenom}} {{informationsGenerales.nom}}</span><br />
    <span class="nom-prenom" ng-show="options.pourImpression">Ingénieur Conseil en Systèmes et Logiciels Informatiques</span><br ng-show="options.pourImpression"/>
    <span>{{age()}} </span><br />
    <span>{{informationsGenerales.adresse | trustedTrad}} </span><br />
    <span>{{informationsGenerales.codePostal | trustedTrad}} {{informationsGenerales.ville | trustedTrad}} </span><br />
    <span>{{informationsGenerales.telephones.mobile | trustedTrad}} </span><br />
    <span>{{informationsGenerales.email | trustedTrad}} </span><br />
    <span ng-show="options.pourImpression">{{informationsGenerales.siteWeb | trustedTrad}} </span><br ng-show="options.pourImpression"/>
    <span ng-repeat="a in informationsGenerales.autres" >{{a | trustedTrad}}</span>
</p>
<p class="informations-generales" ng-if="options.anonyme">
    <span class="nom-prenom" ng-show="options.pourImpression">Ingénieur Conseil en Systèmes et Logiciels Informatiques</span><br ng-show="options.pourImpression"/>
</p>
"""
]