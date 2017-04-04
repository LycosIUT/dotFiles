
installBashrc() {
	if [ -f ~/.bashrc ]; then
		echo "The file ~/.bashrc is already present";
		echo "Do you want to create a backup ? [y/n]";
		read answer;
		case $answer in
			y|Y)
				mv ~/.bashrc ~/.bashrc.backup && 
				echo "Backup created as ~/.bashrc.backup"
				if [ -f ~/.bash_aliases ]; then
					mv ~/.bash_aliases ~/.bash_aliases.backup && 
					echo "A backup has also been created for ~/.bashrc_aliases"
				fi;;
			*)
				echo "No backup created";;
		esac
	fi
	cp ./bash/.bashrc ~/.bashrc && cp ./bash/.bash_aliases ~/.bash_aliases && 
	echo "New .bashrc installed. Open a new terminal to use it.";
}

if [ "$#" -lt 1 ]; then
	echo 'Invalid arguments. Type ./install.sh [bashrc, vimrc]' ;
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

