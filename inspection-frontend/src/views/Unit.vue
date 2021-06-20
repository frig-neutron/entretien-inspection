<template>
  <div class="backdrop">
    <div class="modal" @click="hideUnits">
      <p>{{ building }} {{ unit }}</p>
      <slot name="occupant"><h2>no one here but us chickens</h2></slot>
    </div>
  </div>
</template>

<script>
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

<style scoped>
</style>
