var Soil = {}



Soil.formatComponentName  = require('./src/asset/helper/formatComponentName.coffee'),
Soil.formatComponentTable = require('./src/asset/helper/formatComponentTable.coffee'),
Soil.merge                = require('./src/asset/helper/merge.coffee'),
Soil.joinGlobal           = require('./src/asset/helper/joinGlobal.coffee'),
Soil.cloneVNode           = require('./src/asset/helper/cloneVNode.coffee'),
Soil.cloneVNodes          = require('./src/asset/helper/cloneVNodes.coffee'),
Soil.setProps             = require('./src/asset/helper/setProps.coffee'),
Soil.setDevicePixelRatio  = require('./src/asset/helper/setDevicePixelRatio.coffee'),
Soil.color                = require('./src/asset/helper/color.coffee'),
Soil.n2br                 = require('./src/asset/helper/n2br.coffee'),
Soil.isEmailAddress       = require('./src/asset/helper/isEmailAddress.coffee'),



Soil.message = require('./src/component/MessageDialog/shortcut.coffee'),



Soil.componentTable = {
  ListX:        require('./src/component/ListX/index.vue'),
  ListY:        require('./src/component/ListY/index.vue'),
  FlowX:        require('./src/component/FlowX/index.vue'),
  BarX:         require('./src/component/BarX/index.vue'),
  Grid:         require('./src/component/Grid/index.vue'),
  MainSide:     require('./src/component/MainSide/index.vue'),
  LineX:        require('./src/component/LineX/index.vue'),
  Label:        require('./src/component/Label/index.vue'),
  Image:        require('./src/component/Image/index.vue'),
  Icon:         require('./src/component/Icon/index.vue'),
  Button:       require('./src/component/Button/index.vue'),
  // Switch: require('./src/component/Switch/index.vue'),
  Input:        require('./src/component/Input/index.vue'),
  InputArea:    require('./src/component/InputArea/index.vue'),
  Radio:        require('./src/component/Radio/index.vue'),
  RadioGroup:   require('./src/component/RadioGroup/index.vue'),
  Table:        require('./src/component/Table/index.vue'),
  TableRow:     require('./src/component/TableRow/index.vue'),
  TableCell:    require('./src/component/TableCell/index.vue'),
  // RadioBar: require('./src/component/RadioBar/index.vue'),
  // Rate: require('./src/component/Rate/index.vue'),
  // MenuCell: require('./src/component/MenuCell/index.vue'),
  // MenuCellGroup: require('./src/component/MenuCellGroup/index.vue'),
  // Drawer: require('./src/component/Drawer/index.vue'),
  // DrawerMenu: require('./src/component/DrawerMenu/index.vue'),
  // DrawerMenuItem: require('./src/component/DrawerMenuItem/index.vue'),
  DatePicker:    require('./src/component/DatePicker/index.vue'),
  FilePicker:    require('./src/component/FilePicker/index.vue'),
  Popup:         require('./src/component/Popup/index.vue'),
  Dialog:        require('./src/component/Dialog/index.vue'),
  MessageDialog: require('./src/component/MessageDialog/index.vue'),
}



Soil.install = function(Vue, op){
  op = op || {};
  if(op.global){
    Soil.joinGlobal(Soil.componentTable, 'aa-bb', 'soil-*');
  }
  Soil = Soil.merge(Soil, Soil.componentTable);
  Vue.prototype.$soil = Soil;
}



module.exports = Soil