Vue = require 'vue'
VueRouter = require 'vue-router'
App = require './App'


require 'normalize.css'


Vue.component 'ListX', require './components/ListX'


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