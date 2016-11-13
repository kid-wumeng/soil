<template lang="jade">

  .soil-dialog
    soil-popup(ref="popup", :alpha="alpha")
      panel(:padding="padding")
        content-area
          slot
        bar(:padding="padding")
          template(slot="bar-left"):  slot(name="bar-left")
          template(slot="bar-right"): slot(name="bar-right")

</template>



<script lang="coffee">

  module.exports =

    components:
      'soil-popup':   require '../Popup'
      'panel':        require './Panel'
      'content-area': require './ContentArea'
      'bar':          require './Bar'

    props:
      'alpha':
        type: Number
        default: 0.4
      'padding':
        type: String
        default: '16px'

    methods:
      'show': ->
        @$refs.popup.show()
      'hide': ->
        @$refs.popup.hide()
        @$emit('hide')

</script>