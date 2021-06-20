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
      buildings: [
        {
          number: 3735,
          units: [
            {
              number: 1
            },
            {
              number: 2
            },
            {
              number: 3
            },
            {
              number: 4
            },
            {
              number: 5
            },
            {
              number: 6
            }
          ]
        },
        {
          number: 3737,
          units: [
            {
              number: 1
            },
            {
              number: 2
            },
            {
              number: 3
            },
            {
              number: 4
            },
            {
              number: 5
            },
            {
              number: 6
            }
          ]
        },
        {
          number: 3739,
          units: [
            {
              number: 1
            },
            {
              number: 2
            },
            {
              number: 3
            },
            {
              number: 4
            },
            {
              number: 5
            },
          ]
        },
        {
          number: 3743,
          units: [
            {
              number: 1
            },
            {
              number: 2
            },
            {
              number: 3
            },
          ]
        },
        {
          number: 3745,
          units: [
            {
              number: 1
            },
            {
              number: 2
            },
            {
              number: 3
            },
          ]
        },
      ]
    }
  },
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
