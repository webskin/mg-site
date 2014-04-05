'use strict'

# | Animation Step                                                                                 | What the element class attribute looks like |
# |------------------------------------------------------------------------------------------------|---------------------------------------------|
# | 1. $animate.addClass(element, 'super') is called                                               | class="my-animation"                        |
# | 2. $animate runs any JavaScript-defined animations on the element                              | class="my-animation ng-animate"             |
# | 3. the .super-add class are added to the element                                               | class="my-animation ng-animate super-add"   |
# | 4. $animate scans the element styles to get the CSS transition/animation duration and delay    | class="my-animation ng-animate super-add"   |
# | 5. $animate waits for 10ms (this performs a reflow)                                            | class="my-animation ng-animate super-add"   |
# | 6. the .super, .super-add-active and .ng-animate-active classes are added (this triggers the CSS transition/animation) | class="my-animation ng-animate ng-animate-active super super-add super-add-active"          |
# | 7. $animate waits for X milliseconds for the animation to complete                             | class="my-animation super super-add super-add-active"  |
# | 8. The animation ends and all generated CSS classes are removed from the element               | class="my-animation super"                  |
# | 9. The super class is kept on the element                                                      | class="my-animation super"                  |
# | 10. The doneCallback() callback is fired (if provided)                                         | class="my-animation super"                  |

mgApp = angular.module 'mgApp'

mgApp.animation '.animate-slide', [
  'mg.CVService'
  (cvService) ->
    enter: (element, done) ->
      console.log ".animate-ref-cat-projet enter"

    leave: (element, done) ->
      console.log ".animate-ref-cat-projet leave"
    move: (element, done) ->
      console.log ".animate-ref-cat-projet move"

    # animation that can be triggered before the class is added
    beforeAddClass: (element, className, done) ->
      console.log ".animate-ref-cat-projet beforeAddClass #{className}"
      if 'ng-hide' is className
        element.slideUp 400, () -> done()
      return


    # animation that can be triggered after the class is added
    addClass: (element, className, done) ->
      console.log ".animate-ref-cat-projet addClass #{className}"
      if 'ng-hide' is className
        done()
      return

    # animation that can be triggered before the class is removed
    beforeRemoveClass: (element, className, done) ->
      console.log ".animate-ref-cat-projet beforeRemoveClass #{className}"
      if 'ng-hide' is className
        # sécifique Jquery
        element.hide()
        done()
      return

    # animation that can be triggered after the class is removed
    removeClass: (element, className, done) ->
      console.log ".animate-ref-cat-projet removeClass #{className}"

      if 'ng-hide' is className
        element.slideDown  400, () -> done()
      return

]