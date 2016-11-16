Vue = require 'vue'
formatComponentTable = require './formatComponentTable'


module.exports = (componentTable, mode, template) ->
  table = formatComponentTable(componentTable, mode, template)
  for name, component of table
    Vue.component name, component