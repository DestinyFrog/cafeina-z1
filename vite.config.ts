import { defineConfig } from 'vite'
import { svelte } from '@sveltejs/vite-plugin-svelte'

// https://vite.dev/config/
export default defineConfig({
  envDir: '../',
  root: './web',
  build: {
    outDir: '../dist',
    emptyOutDir: true,
  },
  plugins: [svelte()],
})
