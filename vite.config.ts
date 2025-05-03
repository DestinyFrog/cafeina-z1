import { defineConfig } from 'vite'
import { svelte } from '@sveltejs/vite-plugin-svelte'

// https://vite.dev/config/
export default defineConfig({
  root: 'web',
  build: {
    outDir: 'dist',
    emptyOutDir: true, // also necessary
  },
  plugins: [svelte()],
})
