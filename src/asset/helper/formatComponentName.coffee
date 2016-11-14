# For example:
#   name     = 'DatePicker'
#   mode     = 'aa-bb'
#   template = 'soil-*'
# ->
#   'soil-date-picker'

module.exports = (name, mode, template) ->

  # nameParts = ['Date', 'Picker']
  nameParts = name.match /[A-Z][a-z0-9]*/g

  # name = 'date-picker'
  switch mode
    when 'AaBb'  then name = name
    when 'aabb'  then name = nameParts.join('').toLowerCase()
    when 'AABB'  then name = nameParts.join('').toUpperCase()
    when 'Aa-Bb' then name = nameParts.join('-')
    when 'aa-bb' then name = nameParts.join('-').toLowerCase()
    when 'AA-BB' then name = nameParts.join('-').toUpperCase()
    when 'Aa_Bb' then name = nameParts.join('_')
    when 'aa_bb' then name = nameParts.join('_').toLowerCase()
    when 'AA_BB' then name = nameParts.join('_').toUpperCase()
    else throw "Mode [#{mode}] is not a pre-value"

  # -> 'soil-date-picker'
  return template.replace /\*/g, name