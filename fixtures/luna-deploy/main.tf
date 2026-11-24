# Existing acceptance role. This isolated fixture is imported before planning.

resource "aws_iam_role" "acceptance_deploy" {
  name        = "github-actions-deploy"
  description = "GitHub Actions deploy role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = "arn:aws:iam::197536559184:oidc-provider/token.actions.githubusercontent.com"
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
            "token.actions.githubusercontent.com:sub" = "repo:Sir-seju/wardhand-accept-controls:ref:refs/heads/main"
          }
        }
      }
    ]
  })
}
