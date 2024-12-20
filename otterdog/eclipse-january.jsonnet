local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('science.january', 'eclipse-january') {
  settings+: {
    description: "",
    name: "Eclipse January",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('january') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "python"
      ],
      code_scanning_default_setup_enabled: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "January project",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          is_admin_enforced: true,
          required_approving_review_count: null,
          requires_pull_request: false,
        },
        orgs.newBranchProtectionRule('january_*') {
          is_admin_enforced: true,
          required_approving_review_count: null,
          required_status_checks+: [
            "any:ip-validation"
          ],
          requires_pull_request: false,
        },
        orgs.newBranchProtectionRule('january_1_0') {
          is_admin_enforced: true,
          required_approving_review_count: null,
          requires_pull_request: false,
        },
        orgs.newBranchProtectionRule('january_2_0') {
          is_admin_enforced: true,
          required_approving_review_count: null,
          requires_pull_request: false,
        },
        orgs.newBranchProtectionRule('january_2_1') {
          is_admin_enforced: true,
          required_approving_review_count: null,
          requires_pull_request: false,
        },
        orgs.newBranchProtectionRule('january_2_2') {
          is_admin_enforced: true,
          required_approving_review_count: null,
          requires_pull_request: false,
        },
        orgs.newBranchProtectionRule('january_2_3') {
          is_admin_enforced: true,
          required_approving_review_count: null,
          requires_pull_request: false,
        },
      ],
    },
    orgs.newRepo('january-forms') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          is_admin_enforced: true,
          required_approving_review_count: null,
          required_status_checks+: [
            "any:continuous-integration/travis-ci",
          ],
          requires_pull_request: false,
        },
      ],
    },
    orgs.newRepo('january-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
  ],
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}