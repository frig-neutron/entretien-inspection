<template>
  <div class="backdrop">
    <div>
      <h2>{{ building }} Unit-{{ unitNumber }}</h2>
    </div>
    <div v-if="unitTemplate">

      <div class="room" v-for="room in unitTemplate.rooms">
        <h3>{{room.name}}</h3>
        <div class="element" v-for="elementId in room.elements">
          {{ elementId }}
        </div>
      </div>
    </div>
    <div v-else>
      🚚 Moving in...
    </div>
  </div>
</template>

<script>
import Element from "../components/Element";

export default {
  name: "Unit",
  props: ["building", "unitNumber"],
  methods: {},
  data() {
    return {
      unitTemplate: null
    }
  },
  mounted() {
    fetch("http://" + window.location.hostname + ":3000/units/" + this.unitNumber)
    .then(res => res.json())
    .then(data => this.unitTemplate = data)
    .catch(e => console.log(e))
  }
}
</script>

<style>
</style>
