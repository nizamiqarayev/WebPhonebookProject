
resource "aws_db_instance" "db" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  storage_type = "gp2"
  name                 = "Contacts"
  identifier = "contactdb"
  username             = "MasterAdmin"
  password             = "SkeletonKeyDB"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  publicly_accessible = false
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.dbsecurity.id]
    tags = {
    "name" = "contactDb"
  }
}
################################################################
#db for testing
################################################################
# resource "aws_db_instance" "db_practise" {
#   allocated_storage    = 20
#   engine               = "mysql"
#   engine_version       = "5.7"
#   instance_class       = "db.t2.micro"
#   storage_type = "gp2"
#   name                 = "Contacts"
#   identifier = "casualpractise"
#   username             = "MasterAdmin"
#   password             = "Nizami242001!"
#   parameter_group_name = "default.mysql5.7"
#   skip_final_snapshot  = true
#   publicly_accessible = true
#   # db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
#   # vpc_security_group_ids = [aws_security_group.dbsecurity.id]
#     tags = {
#     "name" = "contactDb"
#   }
# }
data "template_file" "config" {
  template = "templates/my_config.json.tmpl"

  vars = {
    endpoint = aws_db_instance.db.endpoint
  }
}
#####################################################
#s3 attempts
#####################################################
# data "aws_canonical_user_id" "current_user" {}

# resource "aws_s3_bucket" "bucket" {
#   bucket  = "dbendpointbucket"

#   }

  # content = data.template_file.config.rendered

# resource "aws_s3_bucket_object" "config" {
#   bucket  = aws_s3_bucket.bucket.id
#   key     = "conf/my-service/config.json"
#   content = data.template_file.config.rendered
# }
# resource "aws_s3_bucket_public_access_block" "example" {
#   bucket = aws_s3_bucket.bucket.id

#   block_public_acls   = false
#   block_public_policy = false
# }
# resource "aws_s3_access_point" "example" {
#   bucket = aws_s3_bucket.bucket.id
#   name   = "example"

#   # VPC must be specified for S3 on Outposts
#   vpc_configuration {
#     vpc_id = aws_vpc.vpc_pb.id
#   }
# }



#   username             = data.aws_kms_secrets.mysqldata.plaintext["mysqlUser"]
#   password             = data.aws_kms_secrets.mysqldata.plaintext["mysqlPW"]
