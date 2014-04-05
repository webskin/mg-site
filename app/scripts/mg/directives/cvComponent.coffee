'use strict'

mgApp = angular.module 'mgApp'

mgApp.directive 'cvComponent', [
  'mg.CVService'
  (cvService) ->
    restrict: 'E'
    scope:
      cv: '='
    link: (scope, element, attrs) ->

    template:"""
<div id="cv">
  <informations-generales-component informations-generales="cv.informationsGenerales"></informations-generales-component>
  <br/>
  <div class="row">
    <div class="col-lg-7">
      <h1 class="title">Expériences Professionnelles</h1>
    </div>
  </div>
  <div ng-repeat="e in cv.experiencesProfessionnelles">
    <experience-professionnelle-component experience-Professionnelle="e"></experience-professionnelle-component>
  </div>
  <br />
  <div class="row">
    <div class="col-lg-7 col-md-7">
      <h1 class="title">Stages et Projets de Fin d'Étude</h1>
    </div>
  </div>
  <div ng-repeat="e in cv.stagesEtProjetsFinEtude">
    <experience-professionnelle-component experience-Professionnelle="e"></experience-professionnelle-component>
  </div>
  <br />
  <div class="row">
    <div class="col-lg-7 col-md-7">
      <h1 class="title">Formations</h1>
    </div>
  </div>
  <div ng-repeat="f in cv.formations">
    <formation-component formation="f"></formation-component>
  </div>
  <br />
</div>
"""
]