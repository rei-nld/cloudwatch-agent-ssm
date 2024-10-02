resource "aws_s3_object" "amazon-cloudwatch-agent-config" {
  bucket = resource.aws_s3_bucket.largest_graveyard_mmxxiv.bucket
  key    = "amazon-cloudwatch-agent-config.json"
  source = "./amazon-cloudwatch-agent-config.json"
}