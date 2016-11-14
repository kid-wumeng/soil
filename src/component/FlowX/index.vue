<script lang="coffee">

  Soil = require '../../Soil'

  module.exports =

    components:
      'left-area':   require './LeftArea'
      'center-area': require './CenterArea'
      'right-area':  require './RightArea'


    props:
      'padding':
        type: String
        default: '0'


    render: (createElement) ->
      leftItems   = @$slots['left']   ? []
      centerItems = @$slots['center'] ? []
      rightItems  = @$slots['right']  ? []
      seps        = @$slots['sep']    ? []

      props =
        'padding': @padding
      sepTemplate = createElement 'template', {slot: 'sep'}, seps

      # @TODO Don't show area if it hasn't any child.
      leftArea    = createElement 'left-area',   {props}, [leftItems,   sepTemplate]
      centerArea  = createElement 'center-area', {props}, [centerItems, sepTemplate]
      rightArea   = createElement 'right-area',  {props}, [rightItems,  sepTemplate]

      return createElement 'div', {class: 'soil-flow-x'}, [leftArea, centerArea, rightArea]

</script>



<style lang="less">

  .soil-flow-x{
    display: flex;
    >.left-area{
      width: 30%;
      justify-content: flex-start;
    }
    >.center-area{
      width: 40%;
      justify-content: center;
    }
    >.right-area{
      width: 30%;
      justify-content: flex-end;
    }
  }

</style>