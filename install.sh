INFO='[\033[0;34mINFO\033[0m]'
ERROR='[\033[0;33mWARNING\033[0m]'

displayInfo() {
	echo -e $INFO $@
}

displayError() {
	echo -e $WARNING $@
}

installBashrc() {
	if [ -f ~/.bashrc ]; then
		echo "The file ~/.bashrc is already present";
		echo "Do you want to create a backup ? [y/n]";
		read answer;
		case $answer in
			y|Y)
				mv ~/.bashrc ~/.bashrc.backup && 
				displayInfo "Backup created for [~/.bashrc] as [~/.bashrc.backup]"
				if [ -f ~/.bash_aliases ]; then
					mv ~/.bash_aliases ~/.bash_aliases.backup && 
					displayInfo "Backup created for [~/.bashrc_aliases] as [.bash_aliases.backup]"
				fi;;
			*)
				echo "No backup created";;
		esac
	fi
	cp ./bash/.bashrc ~/.bashrc && cp ./bash/.bash_aliases ~/.bash_aliases && 
	displayInfo "New .bashrc imported"
	displayInfo "New .bashrc_aliases imported"
	echo "New .bashrc installed. Open a new terminal to use it.";
}

if [ "$#" -lt 1 ]; then
	displayError 'Invalid arguments. Type ./install.sh [bashrc, vimrc]' ;
fi

for arg in "$@"
do
	case $arg in
		bashrc)
			echo New .bashrc will be installed
			installBashrc ;;
		vimrc)
			echo New .vimrc will be installed ;;
		*)
			echo 'Invalid arguments. Type ./install.sh [bashrc, vimrc]' ;;
	esac
done

