

curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh | sudo bash
sudo systemctl stop httpd; sudo systemctl stop httpd; sudo yum -y erase httpd  
sudo EXTERNAL_URL="https://gitlab.greencap.com.au" yum install -y gitlab-ee

sudo cp /etc/gitlab/gitlab.rb /etc/gitlab/gitlab.rb.orig
sudo cat >> /etc/gitlab/gitlab.rb <<EOL
gitlab_rails['ldap_enabled'] = false
gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "smtp.sendgrid.net"
gitlab_rails['smtp_port'] = 2525
gitlab_rails['smtp_user_name'] = "apikey"
gitlab_rails['smtp_password'] = "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"
gitlab_rails['smtp_domain'] = "smtp.sendgrid.net"
gitlab_rails['smtp_authentication'] = "login"
gitlab_rails['smtp_enable_starttls_auto'] = true
gitlab_rails['smtp_tls'] = false
registry_external_url 'https://gitlabregistry.greencap.com.au'

nginx['listen_port'] = 80
nginx['listen_https'] = false
nginx['proxy_set_headers'] = {
  "X-Forwarded-Proto" => "https",
  "X-Forwarded-Ssl" => "on"
}

registry_nginx['listen_port'] = 80
registry_nginx['listen_https'] = false
registry_nginx['proxy_set_headers'] = {
  'X-Forwarded-Proto' => 'https',
  'X-Forwarded-Ssl' => 'on'
}

letsencrypt['enable'] = false
letsencrypt['auto_renew'] = false
EOL

gitlab-ctl reconfigure

