<template lang="jade">

  .soil-radio-group
    slot

</template>



<script lang="coffee">

  # @TODO Implement `padding` prop
  # @TODO Implement `y` prop
  # @TODO Implement `at-least` prop

  module.exports =

    props:
      # @TODO Check: default-value should in child-radios' data
      'value':
        type: null
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
        value = []
        for radio in @radios
          if radio.active
            value.push(radio.data)
        @$emit('input', value)


      'handleSingle': (radio) ->
        if radio.active
          @mutex(radio)
          @$emit('input', radio.data)
        else
          @$emit('input', null)


      'mutex': (changeRadio) ->
        # Set inactive for other-radios.
        for radio in @radios
          if radio isnt changeRadio
            radio.active = false

</script>



<style lang="less">

  @import "../../asset/style/color.less";

  .soil-radio-group{
    >.soil-radio{margin-right: 16px}
    >.soil-radio:last-child{margin-right: 0}
  }

</style>