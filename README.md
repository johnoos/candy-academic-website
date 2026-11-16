# candy-site

Single-page document vault (Astro, static, served by Cloudflare Workers).

## Setup
1. `npm install`
2. Copy her PDFs into place: `./scripts/prepare-assets.sh "/path/to/her/pdf/folder"`
   (strips number prefixes, lower-cases, creates `public/assets/<folder>/<file>.pdf`)
3. `npm run dev` to preview locally.
4. `npm run deploy` (needs `npx wrangler login` once) or connect the repo in Cloudflare.

## Editing
- Page text: top of `src/pages/index.astro`.
- Categories and files: `src/data/vault.js`. Order in the file = order on the page.

## Category pages
Each category also has its own shareable page, generated from `src/data/vault.js`:
`/curriculum-vitae`, `/academic-qualifications-education`, `/academic-qualifications-music`,
`/other-music-certificates`, `/academic-transcripts`, `/documents-other`, `/workshops`, `/references`.
Shared layout and styles live in `src/layouts/VaultLayout.astro`.
