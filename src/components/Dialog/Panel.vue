<template lang="jade">

  .panel(:style="styleObject")
    slot

</template>



<script lang="coffee">

  module.exports =

    props:
      'padding':
        type: String
        required: 'true'

    computed:
      'styleObject': ->
        'padding': @padding

</script>



<style lang="less">

  .soil-dialog{
    .panel{
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      box-sizing: border-box;
      background-color: white;
      width: 400px;
      height: 400px;
      border-radius: 2px;
      box-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
    }
  }

</style>