<template lang="jade">

  .playground
    soil-flow-x
      .d1
      .d2(slot="left")
      .d3
      .sep1(slot="sep")
    //- soil-button(label="您下一步的操作是？", @click="$refs['drawer-menu'].show()")
    //- soil-drawer-menu(ref="drawer-menu", cancel-label="取消")
    //-   soil-drawer-menu-item(label="收藏到精选集", @select="onSelectCollect")
    //-   soil-drawer-menu-item(label="下载到本地", @select="onSelectDownload")
    //-   soil-drawer-menu-item(label="分享到微信朋友圈", @select="onSelectShare")
    //-   soil-drawer-menu-item(label="不再听这首歌", @select="onSelectRemove")

</template>

<script lang="coffee">

  module.exports =

    # mounted: ->
    #   this.$refs['drawer-menu'].show()

    data: ->
      birthday: {}
      'src': 'http://pic.sc.chinaz.com/files/pic/pic9/201508/apic14052.jpg'

    methods:
      'onLoadImage': ({ dataURL, file }) ->
        @src = dataURL
      'onMinSizeError': ({ file, minSize }) ->
        alert "文件#{file.name}太小，不应该小于#{minSize/1024}KB"
      'onMaxSizeError': ({ file, maxSize }) ->
        alert "文件#{file.name}太大，不应该大于#{maxSize/1024}KB"
      'onMimesError': ({ file, mimes }) ->
        alert "文件#{file.name}类型不符合要求，只能是#{mimes.join(', ')}其中之一"

    #   'onSelectCollect': -> alert 'collect'
    #   'onSelectDownload': -> alert 'download'
    #   'onSelectShare': -> alert 'share'
    #   'onSelectRemove': -> alert 'remove'

</script>

<style lang="less">

  @import "./assets/styles/color";

  html, body {
    width: 100%;
    height: 100%;
  }
  body {
    // display: flex;
    // justify-content: center;
    // align-items: center;
  }

  .d1 {
    width: 48px;
    height: 48px;
    background-color: red;
    &:hover {
      background-color: red;
    }
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
    display: inline-block;
    width: 1px;
    height: 40px;
    background-color: #ccc;
  }
  .sep2 {
    display: inline-block;
    width: 20px;
    height: 40px;
    background-color: #ccc;
  }
  .soil-date-picker {
  }

</style>