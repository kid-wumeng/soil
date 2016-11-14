<template lang="jade">

  .left-side-area(v-if="$slots.default", :style="styleObject")
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
        'margin-right': @padding

</script>