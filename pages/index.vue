<template>
  <div>
    <testeDiv>
      <img src="../assets/img/logo_dark_100.png" alt=""> 
      <invoDiv>
        <titlePryme> Home </titlePryme> 
        <titlePryme> Painel </titlePryme> 
        <titlePryme> Caderno </titlePryme> 
      </invoDiv>
    </testeDiv>
  </div>
</template>

<script>

import * as Components from '../assets/css/global.js'

export default {
  name: 'IndexPage',
  components: {
    testeDiv: Components.testeDiv,
    titlePryme: Components.titlePryme,
    invoDiv: Components.invoDiv
    },
}
</script>

<style>
body {
    margin: 0px;
}

</style>