'use strict'
mgApp = angular.module 'mgApp'

mgApp.factory 'mg.CVService', [
  '_'
  '$http'
  '$q'
  'mg.CVMappings'
  (_, $http, $q, mappings) ->

    #
    class CVService
      constructor: ->
        @cachedCVResponse = null

      get: () ->

        if @cachedCVResponse
          $q.when(@cachedCVResponse)
        else
          successDeffered = $q.defer()

          $http.get('/resources/cv.json').then (success) =>
            mappings.cvDeserializer(success.data).then (cv) =>
              success.data = cv
              @cachedCVResponse = success
              successDeffered.resolve success


          successDeffered.promise


    # on retourne le singleton
    new CVService()
]