<template>
  <h1>{{ title }}</h1>
  <input type="text">
</template>

<script>
export default {
  name: 'App',
  components: {
  },
  data() {
    return {
      title: 'My first vue app'
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
