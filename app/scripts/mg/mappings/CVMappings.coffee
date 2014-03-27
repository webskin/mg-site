'use strict'

mgApp = angular.module 'mgApp'

mgApp.factory 'mg.CVMappings', [
  '_'
  'mg.CVModels'
  (_, m) ->

    cvDeserializer = (json) ->
      termesTechniques = []
      if json.termesTechniques
        termesTechniques = _(json.termesTechniques).map((termeJson) ->
          terme = new m.TermeTechnique(termeJson)
          terme.__categories = []
          if termeJson.categories
            terme.__categories = termeJson.categories
          terme
        ).valueOf()

      categoriesTermeTechnique =[]
      if json.categoriesTermeTechnique
        categoriesTermeTechnique = _(json.categoriesTermeTechnique).map((catJson) ->
          cat = new m.CategorieTermeTechnique(catJson)
          cat.termes = _(termesTechniques).filter((t) ->
            if _(t.__categories).contains(cat.id)
              t.categories.push cat
              true
            else
              false
          ).valueOf()
          cat
        ).valueOf()

      _(termesTechniques).forEach (t) -> delete t.__categories

      cv = new m.CV()
      cv.categoriesTermeTechnique = categoriesTermeTechnique
      cv

    {
      cvDeserializer
    }

]