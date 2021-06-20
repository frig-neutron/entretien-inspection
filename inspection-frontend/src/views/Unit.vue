<template>
  <div class="backdrop">
    <div @click="hideUnits">
      <p>{{ building }} Unit-{{ unit }}</p>
      <slot name="occupant"><h2>no one here but us chickens</h2></slot>
    </div>
  </div>
</template>

<script>
import Element from "../components/Element";

export default {
  name: "Unit",
  props: ["building", "unit"],
  methods: {
    hideUnits(){
      this.$emit('close')
    }
  }
}
</script>

<style>
</style>
