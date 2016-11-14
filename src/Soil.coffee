Vue = require 'vue'
require './assets/hammer.min'
require './assets/hammer-time.min'
require './assets/styles/reset'
require './assets/styles/common'



Soil =
  ListX: require './components/ListX'
  ListY: require './components/ListY'
  FlowX: require './components/FlowX'
  BarX: require './components/BarX'
  Grid: require './components/Grid'
  MainSide: require './components/MainSide'
  LineX: require './components/LineX'
  Label: require './components/Label'
  Image: require './components/Image'
  Icon: require './components/Icon'
  Button: require './components/Button'
  # Switch: require './components/Switch'
  Input: require './components/Input'
  InputArea: require './components/InputArea'
  Radio: require './components/Radio'
  RadioGroup: require './components/RadioGroup'
  Table: require './components/Table'
  TableRow: require './components/TableRow'
  TableCell: require './components/TableCell'
  # RadioBar: require './components/RadioBar'
  # Rate: require './components/Rate'
  # MenuCell: require './components/MenuCell'
  # MenuCellGroup: require './components/MenuCellGroup'
  # Drawer: require './components/Drawer'
  # DrawerMenu: require './components/DrawerMenu'
  # DrawerMenuItem: require './components/DrawerMenuItem'
  DatePicker: require './components/DatePicker'
  FilePicker: require './components/FilePicker'
  Popup: require './components/Popup'
  Dialog: require './components/Dialog'
  MessageDialog: require './components/MessageDialog'



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



_setDevicePixelRatio = ->
  isAndroid = window.navigator.appVersion.match /android/gi
  isIPhone  = window.navigator.appVersion.match /iphone/gi
  dpr = window.devicePixelRatio
  if isIPhone
    switch true
      when dpr >= 3 then dpr = 3
      when dpr is 2 then dpr = 2
      else dpr = 1
  else
    dpr = 1
  document.documentElement.setAttribute 'soil-dpr', dpr



Soil.init = (option={}) ->
  registerAllComponentsInGlobal = option.registerAllComponentsInGlobal ? false

  for name, Component of Soil when name isnt 'init'

    # For example, ListX -> 'soil-list-x'
    Component.name = _convertComponentName name, 'aa-bb', 'soil-*'

    # Auto-register
    if registerAllComponentsInGlobal
      Vue.component Component.name, Component

  _setDevicePixelRatio()

  # Shortcuts
  Soil.message = require './components/MessageDialog/shortcut'



module.exports = Soil