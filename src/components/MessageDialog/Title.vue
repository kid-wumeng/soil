<template lang="jade">

  .title {{ title }}

</template>



<script lang="coffee">

  module.exports =

    props:
      'title':
        type: String
        required: true

</script>



<style lang="less">

  @import "../../asset/style/color";

  .soil-message-dialog{
    .title{
      font-size: 12px;
      color: @soil-gray-6;
    }
  }

</style>