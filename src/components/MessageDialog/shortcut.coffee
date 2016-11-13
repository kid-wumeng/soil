Vue = require 'vue'
Constructor = require './'
util = require '../../assets/util'


VueComponent = Vue.extend Constructor


execute = (args...) ->
  if typeof args[0] is 'object'
    executeByObject args[0]
  else
    executeBySimple args...


executeBySimple = (message, onHide) ->
  executeByObject {message, onHide, hideOnClickMask: true}


executeByObject = (op={}) ->
  vm = new VueComponent().$mount()
  util.setProps(vm, op, Constructor)

  if op.onSure then vm.$on('sure', op.onSure)
  if op.onHide then vm.$on('hide', op.onHide)

  vm.$on 'hide', ->
    document.body.removeChild(vm.$el)
    setTimeout (-> vm.$destroy()), 0

  document.body.appendChild(vm.$el)
  vm.show()


module.exports = execute