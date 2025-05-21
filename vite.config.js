import { defineConfig } from 'vite'

export default defineConfig({
  root: '.',
  base: '/trial/',
  server: {
    open: 'index.html'
  },
  preview: {
    port : 8088
  }
})