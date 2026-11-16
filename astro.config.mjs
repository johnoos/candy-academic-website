import { defineConfig } from 'astro/config';

// Fully static site: Astro builds to ./dist and Cloudflare serves it
// as static assets (see wrangler.jsonc). No adapter needed.
export default defineConfig({
  output: 'static',
});
