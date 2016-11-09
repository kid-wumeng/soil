<template lang="jade">

  .playground
    soil-radio-group(@change="onChange" multiple)
      soil-radio(label="动画" value="ANIMATION" default-active @change="onChangeOne")
      soil-radio(label="漫画" value="COMIC" default-active)
      soil-radio(label="游戏" value="GAME")

    //- soil-button(label="您下一步的操作是？", @click="$refs['drawer-menu'].show()")
    //- soil-drawer-menu(ref="drawer-menu", cancel-label="取消")
    //-   soil-drawer-menu-item(label="收藏到精选集", @select="onSelectCollect")
    //-   soil-drawer-menu-item(label="下载到本地", @select="onSelectDownload")
    //-   soil-drawer-menu-item(label="分享到微信朋友圈", @select="onSelectShare")
    //-   soil-drawer-menu-item(label="不再听这首歌", @select="onSelectRemove")

</template>

<script lang="coffee">

  module.exports =


    methods:
      'onChange': (value) ->
        console.log value
      'onChangeOne': (value) ->
        console.log value


</script>

<style lang="less">

  @import "./assets/styles/color";

  html, body {
  }
  body {
    background-color: #f2f2f2;
    padding: 50px;
  }
  .soil-radio{
  }

  .soil-radio > .circle-sign{
  }

  .d1 {
    width: 48px;
    height: 48px;
    background-color: red;
  }
  .d2 {
    width: 48px;
    height: 68px;
    background-color: blue;
  }
  .d3 {
    width: 48px;
    height: 48px;
    background-color: green;
  }
  .sep1 {
    width: 10px;
    height: 40px;
    background-color: #333;
  }
  .sep2 {
    width: 10px;
    height: 40px;
    background-color: #333;
  }


  .soil-rate[rate="1"] .icon.-active{ color: @soil-red; text-shadow: 0px 0px 10px }
  .soil-rate[rate="2"] .icon.-active{ color: @soil-gray-8; text-shadow: 0px 0px 10px }
  .soil-rate[rate="3"] .icon.-active{ color: @soil-yellow; text-shadow: 0px 0px 10px }
  .soil-rate[rate="4"] .icon.-active{ color: @soil-yellow; text-shadow: 0px 0px 10px }

</style>