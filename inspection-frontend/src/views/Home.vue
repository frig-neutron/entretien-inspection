<template>
  <div class="home">
    <div v-for="building in buildings" class="building">
      <div>{{building.number}}</div>
      <ol>
        <li v-for="unit in building.units">
          <router-link :to="{
            name: 'Unit',
            params: { building: building.number, unit: unit.number }
          }">Unit {{unit.number}}</router-link>
        </li>
      </ol>
    </div>
  </div>
</template>

<script>

export default {
  name: 'Home',
  components: {
  },
  data() {
    return {
      buildings: false
    }
  },
  mounted() {
    fetch("http://localhost:3000/buildings?_embed=units")
    .then(res => res.json())
    .then(data => this.buildings = data)
    .catch(e => console.log(e))
  }
}
</script>

<style scoped>
  ol > li {
    list-style: none;
  }
  .home {
    position: relative;
  }
  .building {
    display: inline-block;
    vertical-align: top;
  }
</style>
