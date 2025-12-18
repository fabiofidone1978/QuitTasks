/* eslint-env node */
module.exports = {
  extends: ['expo/shared/ios'],
  rules: {
    'no-console': [
      'warn',
      {
        allow: ['warn', 'error', 'info'],
      },
    ],
    '@typescript-eslint/explicit-function-return-types': 'warn',
  },
};
