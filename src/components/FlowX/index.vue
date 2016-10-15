<template lang="jade">

  .soil-flow-x

    soil-list-x.left-area: slot(name="left")

    soil-list-x.center-area: slot

    //- Since the center-area is position: absolute,
    //- need the placeholder open the height of root-element
    //- when the center-area is higher than left-area / right-area
    soil-list-x.center-area-placeholder: slot

    soil-list-x.right-area: slot(name="right")

</template>



<script lang="coffee">

  module.exports =
    components:
      'soil-list-x': require '../ListX'

</script>



<style lang="less">

  .soil-flow-x {
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: relative;
    background-color: pink;
  }

  .soil-flow-x > .center-area {
    position: absolute;
    width: 100%;
    display: flex;
    justify-content: center;
  }

  .soil-flow-x > .center-area-placeholder {
    position: relative;
    left: -100%;
    width: 1px;
    visibility: hidden;
  }

</style>