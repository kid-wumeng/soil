formatComponentName = require './formatComponentName'


module.exports = (mode, template) ->
  table = {}
  for name, component of @componentTable
    name = formatComponentName(name, mode, template)
    table[name] = component
  return table