#!/bin/bash

showDir()
{
	echo 
	echo "Текущий каталог: " $PWD
}

showContDir()
{
	echo
	echo "Содержимое текущего каталога:"
	ls -a $PWD
}

createDir()
{
	echo
	echo "Введите имя каталога:"
	read -r dname
	if [ ! -d "$dname" ];
	then 
		mkdir -p "$dname";
	else 
		echo "Данный каталог уже существует!" | tee -a lab1_err.log
	fi
}

changeDir()
{
	echo
	echo "Введите имя каталога:"
	read -r dname
	if [ -d "$dname" ];
	then 
		cd "$dname";
	else 
		echo "Данный каталог не существует!" | tee -a lab1_err.log
	fi
}

removeDir()
{
	echo
	echo "Введите имя каталога:"
	read -r dname
	if [ -d "$dname" ];
	then 
		rm -rfi "$dname";
	else 
		echo "Данный каталог не существует!" | tee -a lab1_err.log
	fi
}

showMenu()
{
	echo
	echo "1) Напечатать имя текущего каталога"
	echo "2) Напечатать содержимое текущего каталога"
	echo "3) Создать каталог"
	echo "4) Сменить каталог"
	echo "5) Удалить каталог"
	echo "6) Выход"
}

exitProgram()
{
	exit 0
}

readOptions()
{
	echo
	echo "Выберите пункт меню:"
	read -r option

	case $option in
	1) showDir;;
	2) showContDir;;
	3) createDir;;
	4) changeDir;; 
	5) removeDir;;
	6) exitProgram;;
	*) echo "Опция не '$option' существует!" | tee -a lab1_err.log;;
	esac
}

while true 
	do
	showMenu
	readOptions
done
	
