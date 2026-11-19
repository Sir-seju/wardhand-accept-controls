# Self-contained GitHub Actions OIDC IAM role (first live Bedrock PR proof fixture).

resource "aws_iam_role" "github_actions_accept" {
  name = "wardhand-accept-planted-oidc-wildcard"
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
          }
          StringLike = {
            "token.actions.githubusercontent.com:sub" = "repo:Sir-seju/*"
          }
        }
      }
    ]
  })
}
