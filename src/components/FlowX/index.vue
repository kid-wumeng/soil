<!--
  .soil-flow-x
    .soil-list-x
      slot(left)
    .soil-list-x
      slot
    .soil-list-x
      slot(right)
-->



<template lang="pug">
  .soil-flow-x
    soil-list-x
      slot(name="left")
    soil-list-x
      slot
    soil-list-x
      slot(name="right")
</template>



<script lang="coffee">
  module.exports =
    components:
      'soil-list-x': require '../ListX'
</script>



<style>
  .soil-flow-x
  {
    display: flex;
    justify-content: space-between;
  }
</style>