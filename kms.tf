resource "aws_kms_key" "data_archive_kms_key" {
  description         = "KMS key for data archive"
  enable_key_rotation = true
  policy              = <<POLICY
    {
    "Version": "2012-10-17",
    "Id": "kms-tf-1",
    "Statement": [
        {
        "Sid": "Enable IAM User Permissions",
        "Effect": "Allow",
        "Principal": {
            "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        },
        "Action": "kms:*",
        "Resource": "*"
        }
    ]
    }
    POLICY
}

data "aws_caller_identity" "current" {}