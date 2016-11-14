<template lang="jade">

  soil-flow-x.bar(:style="styleObject")
    template(slot="left"):  slot(name="bar-left")
    template(slot="right"): slot(name="bar-right")

</template>



<script lang="coffee">

  Soil = require '../../Soil'

  module.exports =

    components:
      'soil-flow-x': require '../FlowX'

    props:
      'padding':
        type: String
        required: 'true'

    computed:
      'styleObject': ->
        'marginTop': @padding

</script>