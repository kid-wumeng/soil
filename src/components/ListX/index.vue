<template lang="pug">
  .soil-list-x
    .wrap
      .list
        slot
</template>

<script lang="coffee">
</script>

<style lang="less">
  .soil-list-x {
    outline: 1px dashed #000;
    .wrap {
      outline: 1px dashed #000;
      .list {
        outline: 1px dashed #000;
        display: flex;
        & > * {
          outline: 1px dashed #000;
        }
      }
    }
  }
</style>
