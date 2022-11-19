#!/bin/bash
# DESCRIÇÃO
#
# Neste projeto iremos criar um script onde toda a infraestrutura de usuários, grupos de usuários, diretórios e permissões serão criadas automaticamente. 
# Será realizado o upload do arquivo de script no GitHub para futuras reutilizações do script. 
# Sendo assim, toda nova máquina virtual que for iniciada já estará pronta para uso quando o script for executado.
#
# Este scritp foi elaborado em projeto de estudo por "Adriano Alves"
#

echo "Criando pastas..."

mkdir /publico 
mkdir /adm 
mkdir /ven 
mkdir /sec

echo "Criando os grupos..."

groupadd GRP_ADM 
groupadd GRP_VEN 
groupadd GRP_SEC

echo "Criando contas usuarios..."

useradd carlos -c "Carlos" -s /bin/bash -m -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd maria -c "Maria" -s /bin/bash -m -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd joao_ -c "Joao" -s /bin/bash -m -p $(openssl passwd -crypt Senha123) -G GRP_ADM 

useradd debora -c "Debora" -s /bin/bash -m -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd sebastiana -c "Sebastiana" -s /bin/bash -m -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd roberto -c "Roberto" -s /bin/bash -m -p $(openssl passwd -crypt Senha123) -G GRP_VEN

useradd josefina -c "Josefina" -s /bin/bash -m -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd amanda -c "Amanda" -s /bin/bash -m -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd rogerio -c "Rogerio" -s /bin/bash -m -p $(openssl passwd -crypt Senha123) -G GRP_SEC

echo "Atribuindo permissao nas pastas..."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 770 /publico

echo "Concluido..."
