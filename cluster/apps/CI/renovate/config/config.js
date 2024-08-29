module.exports = {
    requireConfig: 'required',
    onboardingNoDeps: 'auto',
    onboardingConfigFileName: '.gitlab/renovate.json5',

    binarySource: 'install',

    persistRepoData: true,
    baseDir: '/tmp/renovate'
}
