Vue = require 'vue'



Soil =
  ListX: require './components/ListX'



_convertComponentNameMode = (name, mode) ->
  # For example, ListX -> ['List', 'X']
  nameParts = name.match /[A-Z][a-z0-9]*/g
  switch mode
    when 'AaBb' then return name
    when 'aabb' then return nameParts.join('').toLowerCase()
    when 'AABB' then return nameParts.join('').toUpperCase()
    when 'Aa-Bb' then return nameParts.join('-')
    when 'aa-bb' then return nameParts.join('-').toLowerCase()
    when 'AA-BB' then return nameParts.join('-').toUpperCase()
    when 'Aa_Bb' then return nameParts.join('_')
    when 'aa_bb' then return nameParts.join('_').toLowerCase()
    when 'AA_BB' then return nameParts.join('_').toUpperCase()
    else throw "Mode [#{mode}] is not a pre-value"



_convertComponentNameFormat = (name, format) ->
  return format.replace /\*/g, name



_convertComponentName = (name, mode, format) ->
  name = _convertComponentNameMode name, mode
  return _convertComponentNameFormat name, format



Soil.init = (option={}) ->

  nameMode = option.nameMode ? 'AaBb'
  nameFormat = option.nameFormat ? '*'
  registerAllComponentsInGlobal = option.registerAllComponentsInGlobal ? false

  for name, Component of Soil
    if name isnt 'install'
      Component.name = _convertComponentName name, nameMode, nameFormat
      if registerAllComponentsInGlobal
        Vue.component Component.name, Component



module.exports = Soil