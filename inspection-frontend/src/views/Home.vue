<template>
  <div class="nav">
    <div v-for="building in buildings" class="building">
      <h2>{{ building.number }}</h2>
      <ol>
        <li v-for="unit in building.units">
          <router-link :to="{
            name: 'Unit',
            params: { building: building.number, unit: unit.number }
          }">Unit {{ unit.number }}
          </router-link>
        </li>
      </ol>
    </div>
    <div>host: {{ hostname }}</div>
  </div>
</template>

<script>

export default {
  name: 'Home',
  components: {},
  data() {
    return {
      hostname: "",
      buildings: false
    }
  },
  mounted() {
    this.hostname = window.location.hostname
    fetch("http://" + window.location.hostname + ":3000/buildings?_embed=units")
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

.nav {
  position: relative;
}

.nav a,
.nav a:visited {
  color: black;
  display: block;
  text-decoration: none;
  padding: 1ex;
  border: 2px solid transparent;
  border-radius: 5px;
}

.nav a:hover {
  border: 2px solid black;
}

.building {
  display: inline-block;
  vertical-align: top;
}
</style>
