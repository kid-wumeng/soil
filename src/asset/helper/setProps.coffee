module.exports = (vm, op, Constructor) ->
  for name, prop of Constructor.props
    vm[name] = op[name] ? prop.default