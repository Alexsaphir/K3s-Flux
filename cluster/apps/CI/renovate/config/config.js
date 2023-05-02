module.exports = {
    gitPrivateKey: process.env.RENOVATE_GIT_PRIVATE_KEY,
    gitAuthor: process.env.RENOVATE_GIT_AUTHOR,

    hostRules: [
    {
        hostType: 'docker',
        "matchHost": "docker.io",
        username: process.env.DOCKER_HUB_USER,
        password: process.env.DOCKER_HUB_PASSWORD,
    },
    ],

    requireConfig: 'required',
    onboardingNoDeps: true,
    onboardingConfigFileName: '.gitlab/renovate.json5',

    binarySource: 'install',

    persistRepoData: true,
    baseDir: '/tmp/renovate'
    }
