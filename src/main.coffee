Vue = require 'vue'
VueRouter = require 'vue-router'
Soil = require './Soil'
App = require './App'


Soil.init
  registerAllComponentsInGlobal: true

Vue.use VueRouter

router = new VueRouter
  mode: 'history'
  routes: [{
    path: ''
    component: require './Playground'
  }]


new Vue
  el: '#app'
  router: router
  render: (h) -> h App