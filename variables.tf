variable settings {
  type = "map"

  default = {
    "app_name" = "terraform-sample-02"

    # VPC CIDR block (CIDR block subnet size is fixed to 16 bit)
    "production.cidr_head" = "10.0"
    "staging.cidr_head"    = "10.10"

    # Web access allowed IP addresses (Enter multiple items separated by commas without spaces.)
    "production.web_allow_cidr" = "0.0.0.0/0"
    "production.ssh_allow_cidr" = "xxx.xxx.xxx/32"
    "staging.web_allow_cidr"    = "xxx.xxx.xxx/32"
    "staging.ssh_allow_cidr"    = "xxx.xxx.xxx/32"

    # EC2 Settings
    "production.ec2_instance_type" = "m5.large"
    "staging.ec2_instance_type"    = "t3.small"
    "production.ec2_volume_size"   = 20
    "staging.ec2_volume_size"      = 20
    "production.ec2_instance_ami"  = "ami-0ff21806645c5e492" # Amazon Linux 2 AMI (HVM), SSD Volume Type x86 (ap-northeast-1)
    "staging.ec2_instance_ami"     = "ami-0ff21806645c5e492" # Amazon Linux 2 AMI (HVM), SSD Volume Type x86 (ap-northeast-1)
    "production.public_key_path"   = "./terraform-sample-02.pub"
    "staging.public_key_path"      = "./terraform-sample-02.pub"

    # RDS Settings
    "production.db_allocated_storage"       = 50
    "staging.db_allocated_storage"          = 50
    "production.db_engine"                  = "mysql"
    "staging.db_engine"                     = "mysql"
    "production.db_engine_version"          = "5.7.22"
    "staging.db_engine_version"             = "5.7.22"
    "production.db_port"                    = 3306
    "staging.db_port"                       = 3306
    "production.db_instance_class"          = "db.t2.micro"
    "staging.db_instance_class"             = "db.t2.micro"
    "production.db_username"                = "administrator"
    "staging.db_username"                   = "administrator"
    "production.db_password"                = "password"
    "staging.db_password"                   = "password"
    "production.db_multi_az"                = true
    "staging.db_multi_az"                   = false
    "production.db_backup_retention_period" = 7
    "staging.db_backup_retention_period"    = 7
    "production.db_backup_window"           = "00:00-00:30"         // must not overlap db_maintenance_window
    "staging.db_backup_window"              = "00:00-00:30"         // must not overlap db_backudb_maintenance_windowp_window
    "production.db_maintenance_window"      = "Mon:01:00-Mon:02:00" // must not overlap db_backup_window
    "staging.db_maintenance_window"         = "Mon:01:00-Mon:02:00" // must not overlap db_backup_window
    "production.db_parameter_group_family"  = "mysql5.7"
    "staging.db_parameter_group_family"     = "mysql5.7"
  }
}
