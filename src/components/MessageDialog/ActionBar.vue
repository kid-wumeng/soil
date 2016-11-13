<template lang="jade">

  .action-bar
    soil-button(:label="sureLabel", facade="solid", @click="$emit('sure')")

</template>



<script lang="coffee">

  module.exports =

    components:
      'soil-button': require '../Button'

    props:
      'sureLabel':
        type: String
        required: true

</script>



<style lang="less">

  .soil-message-dialog{
    .action-bar{
      .soil-button{
        width: 100%;
        padding-top: 8px;
        padding-bottom: 8px;
        font-size: 14px;
        -webkit-font-smoothing: subpixel-antialiased;
      }
    }
  }

</style>