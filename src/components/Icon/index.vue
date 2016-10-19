<template lang="jade">

  .soil-icon(:class="iconClass")

</template>



<script lang="coffee">

  module.exports =

    props:
      'name':
        type: String
        required: true

    computed:
      iconClass: -> "soil-icon-#{@name}"

</script>



<style lang="less">

  @import "../../assets/common";

  .soil-icon {
    display: inline-block;
    font-size: 24px;
    color: @soil-gray;
  }

</style>