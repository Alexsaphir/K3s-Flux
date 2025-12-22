module.exports = {
    requireConfig: 'required',
    onboardingNoDeps: 'auto',
    onboardingConfigFileName: '.gitlab/renovate.json5',

    binarySource: 'install',

    persistRepoData: true,
    baseDir: '/tmp/renovate',

    hostRules: [
        {
            hostType: 'docker',
            matchHost: 'docker.io',
            username: process.env.DOCKER_HUB_USER,
            password: process.env.DOCKER_HUB_PASSWORD,
        },
    ],
};
