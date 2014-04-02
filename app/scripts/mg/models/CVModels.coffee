'use strict'

mgApp = angular.module 'mgApp'

mgApp.factory 'mg.CVModels', [
  '_'
  (_) ->

    class CV
      constructor: (
        @informationsGenerales
        @formations
        @experiencesProfessionnelles
        @stagesEtProjetsFinEtude
      ) ->
        
    class ExperienceProfessionnelle
      constructor: ({
        @debut
        @fin
        @entreprise
        @statut
      }) ->
        @projets = []

    class Projet
      constructor: ({
        @nom
        @client
        @description
      }) ->
        @termesTechniques = []
        @realisations = []

    class Realisation
      constructor: ({
        @description
      }) ->
        @termesTechniques = []
        

    class CategorieTermeTechnique
      constructor: ({@id, @libelle}) ->
        @termes = []

    class TermeTechnique
      constructor: ({@id, @libelle}) ->
        @categories = []



    {
      CV
      ExperienceProfessionnelle
      Projet
      Realisation
      TermeTechnique
      CategorieTermeTechnique
    }

]