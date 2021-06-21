import {createRouter, createWebHistory} from 'vue-router'
import Home from '../views/Home.vue'
import About from '../views/About.vue'
import Unit from '../views/Unit.vue'

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/about',
    name: 'About',
    component: About
  },
  {
    path :'/building/:building/unit/:unitNumber',
    name: 'Unit',
    component: Unit,
    props: true
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
