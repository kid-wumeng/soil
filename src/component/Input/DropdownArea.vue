<template lang="jade">

  .dropdown-area
    slot

</template>



<style lang="less">

  @import "../../asset/style/color";
  
  .soil-input{
    >.dropdown-area{
      display: inline-block;
      background-color: white;
      border-radius: 3px;
      box-shadow: 0 0 6px rgba(0, 0, 0, 0.2);
    }
  }

</style>