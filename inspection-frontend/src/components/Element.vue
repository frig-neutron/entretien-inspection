<template>
  <div class="element">
    <h4>{{ elementId }}</h4>
    <label>Condition</label>
    <select>
      <option>ok</option>
      <option>broken</option>
      <option>chipped</option>
      <option>damaged</option>
      <option>dangerous</option>
      <option>gone</option>
      <option>inefficient</option>
      <option>infested</option>
      <option>rotten</option>
      <option>rusty</option>
      <option>used</option>
      <option>water leakage</option>
      <option>wobbly</option>
    </select>
    <label>Note</label>
    <button>Add note</button>
    <label>Photo</label>
    <button>Add photo</button>
    <label>Open tickets</label>
  </div>
</template>

<script>
export default {
  name: "Element",
  props: ["elementId"]
}
</script>

<style>
.element label {
  display: block;
  text-align: left;
  color: #AAA;
}
.element {
  display: inline-block;
}
/*
https://research.olemiss.edu/spa/federal-property-manual/section/20
 */
</style>
