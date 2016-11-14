Vue = require 'vue'
require './asset/hammer.min'
require './asset/hammer-time.min'
require './asset/style/reset'
require './asset/style/common'



Soil =
  ListX: require './component/ListX'
  ListY: require './component/ListY'
  FlowX: require './component/FlowX'
  BarX: require './component/BarX'
  Grid: require './component/Grid'
  MainSide: require './component/MainSide'
  LineX: require './component/LineX'
  Label: require './component/Label'
  Image: require './component/Image'
  Icon: require './component/Icon'
  Button: require './component/Button'
  # Switch: require './component/Switch'
  Input: require './component/Input'
  InputArea: require './component/InputArea'
  Radio: require './component/Radio'
  RadioGroup: require './component/RadioGroup'
  Table: require './component/Table'
  TableRow: require './component/TableRow'
  TableCell: require './component/TableCell'
  # RadioBar: require './component/RadioBar'
  # Rate: require './component/Rate'
  # MenuCell: require './component/MenuCell'
  # MenuCellGroup: require './component/MenuCellGroup'
  # Drawer: require './component/Drawer'
  # DrawerMenu: require './component/DrawerMenu'
  # DrawerMenuItem: require './component/DrawerMenuItem'
  DatePicker: require './component/DatePicker'
  FilePicker: require './component/FilePicker'
  Popup: require './component/Popup'
  Dialog: require './component/Dialog'
  MessageDialog: require './component/MessageDialog'



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
  Soil.message = require './component/MessageDialog/shortcut'



module.exports = Soil