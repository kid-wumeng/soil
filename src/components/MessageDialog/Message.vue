<template lang="jade">

  .message {{ message }}

</template>



<script lang="coffee">

  module.exports =

    props:
      'message':
        type: String
        required: true

</script>



<style lang="less">

  @import "../../asset/style/color";

  .soil-message-dialog{
    .message{
      font-size: 14px;
      color: @soil-black-light;
    }
  }

</style>