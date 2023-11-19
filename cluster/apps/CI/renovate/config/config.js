module.exports = {
    gitPrivateKey: process.env.RENOVATE_GIT_PRIVATE_KEY,
    gitAuthor: process.env.RENOVATE_GIT_AUTHOR,

    requireConfig: 'required',
    onboardingNoDeps: true,
    onboardingConfigFileName: '.gitlab/renovate.json5',

    binarySource: 'install',

    persistRepoData: true,
    baseDir: '/tmp/renovate'
    }
