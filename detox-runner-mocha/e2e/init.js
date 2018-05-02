const detox = require('detox-runner-conformance-suite/detox');
const config = require('../package.json').detox;
const adapter = require('detox-runner-mocha/adapter');

before(async () => {
  await detox.init(config);
});

beforeEach(async function () {
  await adapter.beforeEach(this);
});

afterEach(async function () {
  await adapter.afterEach(this);
});

after(async () => {
  await detox.cleanup();
});
