# Copyright [2013-2016] [Gregory Senay]
#
# This program is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	(at your option) any later version.
#
#	This program is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
#	You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

#!/bin/bash
# call this script by using source
# source loadmove.bash

export DIRLOADMOVE=~/.dir_tmp

if [ ! -d $DIRLOADMOVE ] ; then
	mkdir $DIRLOADMOVE
fi

function help {
	echo "load move - (C) 2013-2016 Gregory Senay."
	echo "Released under the GNU GPL."
	echo ""
	echo "usage:"
	echo ""
	echo "load <name> \t To save path of the directory"
	echo "\t\t Then change directory, go anywhere"
	echo "move <name>\t To return the previous saved directory <name>"
	echo ""
	echo "load -r <name> \t To delete the saved directory name"
	echo "load -i <name> \t Show the path of the saved directory name"
	echo ""
	echo "\t\t<name> can be any string"
}

function list_all(){ # get the list of all saved directory
	echo `ls -a ~/.dir_tmp/|grep ".load_directory"|cut -d"." -f3`;
}

function load {
	if [[ "$#" == "2"  && "$1" == "-r" ]] ; then
		if [ -f $DIRLOADMOVE/.load_directory.$2 ] ; then
			#echo "delete $2 $DIRLOADMOVE/.load_directory.$2"
			rm $DIRLOADMOVE/.load_directory.$2
			return
		else
			echo "No preload directory $2"
			return
		fi
	fi
	if [[ "$#" == "2"  && "$1" == "-i" ]] ; then
		if [ -f $DIRLOADMOVE/.load_directory.$2 ] ; then
			#echo "delete $2 $DIRLOADMOVE/.load_directory.$2"
			cat $DIRLOADMOVE/.load_directory.$2
			return
		else
			echo "No preload directory $2"
			return
		fi
	fi
	if [ "$#" -gt 1 ] ; then
		help
		return
	else
		for var in "$@" ; do
    	if [[ $var == "-h" || $var == "-help" || $var == "-help" || $var == "--help" ]] ; then
				help
				return
			fi
		done
		echo $PWD > $DIRLOADMOVE/.load_directory.$@
	fi

}

function move {
	for var in "$@" ; do
		if [[ $var == "-h" || $var == "-help" || $var == "-help" || $var == "--help" ]] ; then
			help
			return
		fi
	done
	if [ -e $DIRLOADMOVE/.load_directory.$@ ] ; then
		cd `cat $DIRLOADMOVE/.load_directory.$@`
	else
		echo "No Loading file in $@"
	fi
}

_moveload ()   #  By convention, the function name
{
	local cur
	local cmd="${1##*/}"

	_opts=$(list_all)
	COMPREPLY=()   # Array variable storing the possible completions.
	cur=${COMP_WORDS[COMP_CWORD]}
	prev="${COMP_WORDS[COMP_CWORD-1]}"

	COMPREPLY=( $( compgen -W "${_opts}" -- ${cur} ))
	return 0
}

complete -F _moveload move
complete -F _moveload load
