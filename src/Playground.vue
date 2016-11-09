<template lang="jade">

  .playground
    soil-table
      soil-table-row(title)
        soil-table-cell(label="ID")
        soil-table-cell(label="名字")
        soil-table-cell(label="作者")
        soil-table-cell(label="简介")
        soil-table-cell(label="操作")
      soil-table-row(v-for="comic in comics")
        soil-table-cell(:label="comic.id")
        soil-table-cell(:label="comic.name")
        soil-table-cell(:label="comic.author")
        soil-table-cell(:label="comic.intro")
        soil-table-cell(label="操作")
          soil-list-x(padding="8px")
            soil-button(label="删除" facade="nude" disabled color="soil-red")
            soil-button(label="编辑" facade="ghost" disabled)

</template>



<script lang="coffee">

  module.exports =

    data: ->
      comics: [
        { id: 1, name: '剑风传奇', author: '三浦建太郎', intro: '黑暗史诗' }
        { id: 2, name: 'JOJO的奇妙冒险', author: '荒木飞吕彦', intro: '黄金灵魂、漆黑意志' }
        { id: 3, name: '海贼王', author: '尾田荣一郎', intro: '我是要成为海贼王的男人！' }
        { id: 4, name: '火影忍者', author: '岸本齐史', intro: '忍者的故事' }
        { id: 5, name: '死神', author: '久保带人', intro: '尸魂界篇非常好看' }
      ]

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

  .soil-rate[rate="1"] .icon.-active{ color: @soil-red;    text-shadow: 0px 0px 10px }
  .soil-rate[rate="2"] .icon.-active{ color: @soil-gray-8; text-shadow: 0px 0px 10px }
  .soil-rate[rate="3"] .icon.-active{ color: @soil-yellow; text-shadow: 0px 0px 10px }
  .soil-rate[rate="4"] .icon.-active{ color: @soil-yellow; text-shadow: 0px 0px 10px }

</style>