Vue = require 'vue'
VueRouter = require 'vue-router'
App = require './App'


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