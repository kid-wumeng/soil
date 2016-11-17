Vue = require 'vue'
Constructor = require './'
setProps = require '../../asset/helper/setProps.coffee'


VueComponent = Vue.extend Constructor


execute = (args...) ->
  if typeof args[0] is 'object'
    executeByObject args[0]
  else
    executeBySimple args...


executeBySimple = (message, onOK) ->
  executeByObject {message, onOK}


executeByObject = (op={}) ->
  vm = new VueComponent().$mount()
  setProps(vm, op, Constructor)

  vm.$on 'ok', op.onOK if op.onOK
  vm.$on 'ok', ->
    vm.open = false
    document.body.removeChild(vm.$el)
    setTimeout (-> vm.$destroy()), 0

  document.body.appendChild(vm.$el)
  vm.open = true


module.exports = execute