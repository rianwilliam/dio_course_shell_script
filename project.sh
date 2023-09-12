# !/bin/bash

users=("carlos" "maria" "joao" "debora" "sebastian" "roberto" "josefina" "amanda" "rogerio")
dirs=("publico" "adm" "ven" "sec")
groups=("GRP_ADM" "GRP_VEN" "GRP_SEC")
defaultPassword=123

for group in ${groups[@]}; do
	groupadd $group
done
echo "Grupos Criados"

for dir in ${dirs[@]}; do
        mkdir /$dir
	if [ $dir == "ven" ]; then
		chown root:GRP_VEN $dir
	elif [ $dir == "adm" ]; then
		chown root:GRP_ADM $dir
	elif [ $dir == "sec" ]; then
		chown root:GRP_SEC $dir
	fi
	chmod 770 $dir
done
echo "Diretorios criados"

for user in ${users[@]}; do
	useradd -m -s /bin/bash $user
	echo "$user":"$defaultPassword" | chpasswd
	if [ $user == "carlos" -o $user == "maria" -o $user == "joao" ]; then
		usermod -G GRP_ADM $user
	elif [ $user == "debora" -o $user == "sebastiana" -o $user == "roberto" ]; then
		usermod -G GRP_VEN $user
	elif [ $user == "josefina" -o $user == "amanda" -o $user == "rogerio" ]; then
		usermod -G GRP_SEC $user
	fi
done
echo "Usuarios Criados"
echo "Usuarios adicionados aos grupos"
echo "Codigo finalizado"
