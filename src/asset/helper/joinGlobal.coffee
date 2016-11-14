Vue = require 'vue'


module.exports = ->
  table = @formatComponentTable('aa-bb', 'soil-*')
  for name, component of table
    Vue.component name, component