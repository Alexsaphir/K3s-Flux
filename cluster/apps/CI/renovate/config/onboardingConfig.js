
{
    "$schema": "https://docs.renovatebot.com/renovate-schema.json",
    extends: [
        'config:base',
        'docker:enableMajor',
        ':disableRateLimiting',
        ':dependencyDashboard',
        ':enablePreCommit',
        ':semanticCommits',
        ],
    "enabled": true,

    "configWarningReuseIssue": true,
    "configMigration": true,

    "dependencyDashboard": true,
    "dependencyDashboardTitle": "Renovate Dashboard",

    rebaseWhen: 'behind-base-branch',
}
