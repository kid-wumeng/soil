module.exports = (src, dest) ->
  newObject = {}
  for name, value of src
    newObject[name] = src[name]
  for name, value of dest
    newObject[name] = dest[name]
  return newObject