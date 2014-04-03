'use strict'

mgApp = angular.module 'mgApp'

mgApp.directive 'informationsGeneralesComponent', [
  'mg.CVService'
  (cvService) ->
    restrict: 'E'
    scope:
      informationsGenerales: '='
    link: (scope, element, attrs) ->

    template:"""
<div>
    <span>{{informationsGenerales.prenom}} {{informationsGenerales.nom}}</span><br />
    <span>{{informationsGenerales.statut}} </span><br />
    <span>{{informationsGenerales.naissance | mformat}} </span><br />
    <span>{{informationsGenerales.adresse}} </span><br />
    <span>{{informationsGenerales.codePostal}} {{informationsGenerales.ville}} </span><br />
    <span>{{informationsGenerales.telephones.mobile}} </span><br />
    <span>{{informationsGenerales.telephones.fixe}} </span><br />
    <span>{{informationsGenerales.email}} </span><br />
    <span>{{informationsGenerales.siteWeb}} </span><br />
    <span>{{informationsGenerales.siret}} </span><br />
    <span>{{informationsGenerales.tva}} </span><br />
    <span>{{informationsGenerales.ape}} </span><br />
    <span ng-repeat="a in informationsGenerales.autres" >{{a}}</span>
</div>
"""
]