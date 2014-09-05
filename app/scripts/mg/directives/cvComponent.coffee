'use strict'

mgApp = angular.module 'mgApp'

mgApp.directive 'cvComponent', [
  'mg.CVService'
  'mg.options'
  (cvService, options) ->
    restrict: 'E'
    scope:
      cv: '='
    link: (scope, element, attrs) ->
      scope.options = options
      scope.formationFilter = (formation) ->
        if options.pourImpression
          not _.contains options.pourImpressionOptions.formationsToExclude, formation.id
        else
          true

    template:"""
<div ng-hide="cv" id="chargement">
Chargement du cv.
</div>
<div id="cv" ng-show="cv" ng-class="{impression : options.pourImpression}">
  <div class="row">
    <div class="col-lg-7 col-md-7">
      <div class="row">
        <div class="col-lg-4 col-md-4">
          <informations-generales-component informations-generales="cv.informationsGenerales"></informations-generales-component>
        </div>
        <div ng-hide="options.pourImpression" class="col-lg-8 col-md-8">
          <h2 class="titre" ng-bind-html="cv.titre | trustedTrad"></h2>
        </div>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-lg-7 col-md-7">
      <h1 class="title">Résumé</h1>
    </div>
  </div>
  <div class="row">
    <div class="col-lg-7 col-md-7">
      <p class="description resume" ng-bind-html="cv.resume | trustedTrad"></p>
    </div>
  </div><div class="row">
    <div class="col-lg-7 col-md-7">
      <h1 class="title">Domaines d'Expertises</h1>
    </div>
  </div>
  <div class="row">
    <div class="col-lg-7 col-md-7">
      <p class="description expertises" ng-bind-html="cv.domainesExpertises | trustedTrad"></p>
    </div>
  </div>
  <div class="row">
    <div class="col-lg-7 col-md-7">
      <h1 class="title">Expériences Professionnelles</h1>
    </div>
  </div>
  <div ng-repeat="e in cv.experiencesProfessionnelles">
    <experience-professionnelle-component experience-Professionnelle="e"></experience-professionnelle-component>
  </div>
  <div ng-hide="options.pourImpression" class="row">
    <div class="col-lg-7 col-md-7">
      <h1 class="title">Stages et Projets de Fin d'Étude</h1>
    </div>
  </div>
  <div ng-hide="options.pourImpression" ng-repeat="e in cv.stagesEtProjetsFinEtude">
    <experience-professionnelle-component experience-Professionnelle="e"></experience-professionnelle-component>
  </div>
  <div class="row">
    <div class="col-lg-7 col-md-7">
      <h1 class="title">Formations</h1>
    </div>
  </div>
  <div ng-repeat="f in cv.formations | filter:formationFilter">
    <formation-component formation="f"></formation-component>
  </div>
</div>
"""
]