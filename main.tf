provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_s3_bucket" "s3" {
  bucket = "terraform-study-jade"

  tags = {
    Name = "jade"
  }
}

resource "aws_s3_bucket_policy" "s3_policy" {
    bucket = aws_s3_bucket.s3.id
    policy = data.aws_iam_policy_document.s3_access_policy.json
}
# s3 버킷 정책 내용 data
data "aws_iam_policy_document" "s3_access_policy" {
    statement {
      sid = "1"
      effect = "Allow"
      principals {
        type = "AWS"
        identifiers = ["*"]
      }
      actions = [
        "s3:PutObject",
        "s3:PutObjectAcl",
        "s3:GetObject",
        "s3:GetObjectAcl",
        "s3:DeleteObject"
      ]
      resources = [
        aws_s3_bucket.s3.arn
      ]
    }
}










