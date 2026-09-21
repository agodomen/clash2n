import path from 'node:path'

import { defineConfig } from 'vitest/config'

export default defineConfig({
  resolve: {
    alias: {
      '@': path.resolve('.'),
      '@root': path.resolve('.'),
    },
  },
  define: {
    OS_PLATFORM: `"${process.platform}"`,
  },
  test: {
    include: ['tests/**/*.test.ts', '**/*.test.ts'],
    environment: 'node',
    restoreMocks: true,
  },
})
