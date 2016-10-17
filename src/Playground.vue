<template lang="jade">

  .playground
    soil-switch(color="red")
    soil-switch(color="green")
    soil-switch(color="blue")
    soil-switch(color="yellow")

</template>

<script lang="coffee">

  module.exports =
    methods:
      'say': ->
        console.log 'say a word'

</script>

<style lang="less">

  .d1 {
    width: 48px;
    height: 48px;
    background-color: red;
  }
  .d2 {
    width: 48px;
    height: 88px;
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
    margin-top: 50px;
    margin-left: 50px;
  }

</style>