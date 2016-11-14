<template lang="jade">

  .soil-radio-group
    slot

</template>



<script lang="coffee">

  # @TODO Implement `padding` prop
  # @TODO Implement `y` prop

  Soil = require '../../Soil'

  module.exports =

    props:
      'multiple':
        type: Boolean
        default: false


    computed:
      'radios': -> @$children


    mounted: ->
      @preCheck()
      @bindEvents()


    methods:

      'preCheck': ->
        return if @multiple
        # To avoid more than one `default-value` prop of Radio
        # when use single-select of RadioGroup.
        for radio in @radios
          if radio.active
            @mutex(radio)
            break


      'bindEvents': ->
        for radio in @radios
          ((radio) =>
            radio.$on 'change', =>
              if @multiple
                @handleMultiple()
              else
                @handleSingle(radio)
          )(radio)


      'handleMultiple': ->
        values = []
        for radio in @radios
          if radio.active
            values.push(radio.value)
        @$emit('change', values)


      'handleSingle': (radio) ->
        if radio.active
          @mutex(radio)
          @$emit('change', radio.value)
        else
          @$emit('change', null)


      'mutex': (changeRadio) ->
        # Set inactive for other-radios.
        for radio in @radios
          if radio isnt changeRadio
            radio.active = false

</script>



<style lang="less">

  @import "../../asset/style/color";
  
  .soil-radio-group{
    >.soil-radio{margin-right: 16px}
    >.soil-radio:last-child{margin-right: 0}
  }

</style>