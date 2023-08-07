user_data = <<-EOF
#!/bin/bash
yum update -y
yum install httpd -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "schulltech capstone from $ (hostname -f) .Created by USERDATA in Terraform .Subscribe Now!" (arrow_symbol) /var/www/html/index.html
 EOF