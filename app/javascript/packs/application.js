import 'particles.js'
import '../styles/application'

import Vue from 'vue/dist/vue.esm'

document.addEventListener('DOMContentLoaded', () => {
  // Load particles effect
  const particlesContainer = document.getElementById('particles-js')

  if (particlesContainer) {
    particlesJS.load('particles-js', '/particles-config.json')
  }

  // Load Vue.js app
  const app = new Vue({
    el: '#app',

    components: {
    }
  })
})
