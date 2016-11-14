Vue = require 'vue'
require './asset/hammer.min'
require './asset/hammer-time.min'
require './asset/style/reset'
require './asset/style/common'



Soil = {}



# Helper ( their `this` context is Soil )
Soil.formatComponentName  = require './asset/helper/formatComponentName'
Soil.formatComponentTable = require './asset/helper/formatComponentTable'
Soil.merge                = require './asset/helper/merge'
Soil.joinGlobal           = require './asset/helper/joinGlobal'
Soil.cloneVNode           = require './asset/helper/cloneVNode'
Soil.cloneVNodes          = require './asset/helper/cloneVNodes'
Soil.setProps             = require './asset/helper/setProps'
Soil.setDevicePixelRatio  = require './asset/helper/setDevicePixelRatio'
Soil.color                = require './asset/helper/color'
Soil.n2br                 = require './asset/helper/n2br'
Soil.isEmailAddress       = require './asset/helper/isEmailAddress'



# Component
Soil.componentTable =
  ListX:        require './component/ListX'
  ListY:        require './component/ListY'
  FlowX:        require './component/FlowX'
  BarX:         require './component/BarX'
  Grid:         require './component/Grid'
  MainSide:     require './component/MainSide'
  LineX:        require './component/LineX'
  Label:        require './component/Label'
  Image:        require './component/Image'
  Icon:         require './component/Icon'
  Button:       require './component/Button'
  # Switch: require './component/Switch'
  Input:        require './component/Input'
  InputArea:    require './component/InputArea'
  Radio:        require './component/Radio'
  RadioGroup:   require './component/RadioGroup'
  Table:        require './component/Table'
  TableRow:     require './component/TableRow'
  TableCell:    require './component/TableCell'
  # RadioBar: require './component/RadioBar'
  # Rate: require './component/Rate'
  # MenuCell: require './component/MenuCell'
  # MenuCellGroup: require './component/MenuCellGroup'
  # Drawer: require './component/Drawer'
  # DrawerMenu: require './component/DrawerMenu'
  # DrawerMenuItem: require './component/DrawerMenuItem'
  DatePicker:    require './component/DatePicker'
  FilePicker:    require './component/FilePicker'
  Popup:         require './component/Popup'
  Dialog:        require './component/Dialog'
  MessageDialog: require './component/MessageDialog'



# Shortcut
Soil.message = require './component/MessageDialog/shortcut'



Soil = Soil.merge(Soil, Soil.componentTable)



module.exports = Soil