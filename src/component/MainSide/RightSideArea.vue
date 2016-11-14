<template lang="jade">

  .right-side-area(v-if="$slots.default", :style="styleObject")
    slot

</template>



<script lang="coffee">

  Soil = require '../../Soil'

  module.exports =

    props:
      'padding':
        type: String
        required: true

    computed:
      'styleObject': ->
        'margin-left': @padding

</script>