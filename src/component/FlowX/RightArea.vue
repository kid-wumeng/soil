<template lang="jade">

  soil-list-x.right-area(:padding="padding")
    slot
    template(slot="sep"): slot(name="sep")

</template>



<script lang="coffee">

  Soil = require '../../Soil'

  module.exports =

    components:
      'soil-list-x': require '../ListX'

    props:
      'padding':
        type: String
        required: true

</script>