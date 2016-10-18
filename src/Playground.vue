<template lang="jade">

  .playground
    .icon-star-solid
    soil-list-x( padding="0" )
      soil-switch( v-model="like" )
      soil-button( text="喜欢吗" type="ghost" @click="say" )

</template>

<script lang="coffee">

  module.exports =
    data: ->
      like: false
    methods:
      'say': ->
        console.log @like

</script>

<style lang="less">

  .d1 {
    width: 348px;
    height: 48px;
    background-color: red;
  }
  .d2 {
    width: 48px;
    height: 48px;
    background-color: blue;
  }
  .d3 {
    width: 48px;
    height: 48px;
    background-color: green;
  }
  .sep1 {
    width: 4px;
    height: 40px;
    background-color: #000;
  }
  .sep2 {
    display: inline-block;
    width: 3px;
    height: 100px;
    background-color: #fff;
  }
  .soil-switch {
  }

</style>