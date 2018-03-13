#!/bin/bash
echo "Enter the .csv file name: "
read INPUT

if [ -e "$INPUT" ] ; then
	echo "Reading file ..."
else
	echo "The $INPUT file does not exist!!!"
	exit 99;
fi

OLDIFS=$IFS
IFS=',='
[ ! -f $INPUT ] && { echo "The spreadsheet should be downloaded in csv format with the following name $INPUT "; exit 99; }
while read column_A	column_B column_C column_D column_E_file_name column_F column_G column_H column_I column_J column_K column_L_link_of_drive column_L_id column_M
do
	if [ -e "$column_E_file_name.jpg" ] ; then
		echo "File $column_E_file_name.jpg already exists!!!"
	else
		echo "Download file $column_E_file_name.jpg (Name: $column_B, USP number: $column_E_file_name, id: $column_L_id)"
		curl -L -o "$column_E_file_name.jpg" "https://drive.google.com/uc?export=download&id=$column_L_id"
	fi
done < $INPUT
IFS=$OLDIFS
