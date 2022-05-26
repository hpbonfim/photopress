#!/bin/bash
# SCRIPT PARA ADICIONAR NO EC2

# DESCRIÇÃO:
# UM EC2 PARA CRIAÇÃO DAS PRÉ-CONFIGURAÇÕES PARA RODAR WORDPRESS + MARIADB (mysql) + APACHE

# COMO USAR:
# ADICIONE ESTE ARQUIVO NAS CONFIGURAÇÕES DE CRIAÇÃO DE UMA INSTÂNCIA EC2

#------------------------- script.sh
#Atualizando os pacotes
yum update -y
#Configurando os repositórios
amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
#Instalando o apache e o mysql
yum install -y httpd mariadb-server
#inicialização automática
systemctl start httpd
systemctl enable httpd
systemctl start mariadb
systemctl enable mariadb
#Ajustando o permissionamento
usermod -a -G apache ec2-user
chown -R ec2-user:apache /var/www