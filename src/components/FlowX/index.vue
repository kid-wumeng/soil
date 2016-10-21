<template lang="jade">

  .soil-flow-x

    soil-list-x.left-area( :padding="padding" )
      slot( name="left" )
      template( slot="sep" ): slot( name="sep" )

    soil-list-x.center-area( :padding="padding" )
      slot
      template( slot="sep" ): slot( name="sep" )

    //- Since the center-area is position: absolute,
    //- need the placeholder open the height of root-element
    //- when the center-area is higher than left-area / right-area
    soil-list-x.center-area-placeholder
      slot
      template( slot="sep" ): slot( name="sep" )

    soil-list-x.right-area( :padding="padding" )
      slot( name="right" )
      template( slot="sep" ): slot( name="sep" )

</template>



<script lang="coffee">

  module.exports =

    components:
      'soil-list-x': require '../ListX'

    props:
      'padding':
        type: String

</script>



<style lang="less" scoped>

  .soil-flow-x {
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: relative;
  }

  .soil-flow-x > .center-area {
    position: absolute;
    width: 100%;
    display: flex;
    justify-content: center;
  }

  .soil-flow-x > .center-area-placeholder {
    // Hide the placeholder
    position: relative;
    left: -100%;
    width: 1px;
    visibility: hidden;
  }

</style>