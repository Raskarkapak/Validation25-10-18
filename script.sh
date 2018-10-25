#!/bin/bash
echo ""
echo ""




echo "Vous avez ouvert un script contenant des variables mulet.Voulez-vous continuer  la procédure ?"
echo ""
echo "1.Oui je le veux, j'ai pas peur des mulets"
echo "2.Les mulets me stressent, laissez moi tranquille."
echo ""
read mulet


if [ $mulet == 1 ]
    then 
        mkdir data
        cd data/
        clear
        echo ""
        echo "------------------------------------------------------"
        echo " | Bienvenue dans le programme d'installation moche |"
        echo "------------------------------------------------------"
    menu=0
    while [ $menu -ne 4 ]
    do
        echo ""
        echo ""
        echo "1.Installer Vagrant"
        echo "2.Installer VirtualBox"
        echo "3.Suivant (création de votre machine virtuelle)"
        echo "4.Quitter"
        echo ""
        read menu


        if [ $menu == 1 ]
            then 
                clear
                echo ""
                echo "************************************************" 
                echo "Version de vagrant actuellement installée:"
                echo ""
                vagrant --version 
                echo "************************************************"
                echo ""
        fi

        if [ $menu == 2 ]
            then 
                clear
                echo ""
                echo "************************************************" 
                echo "Version de virtualbox actuellement installée:"
                echo ""
                vboxmanage --version 
                echo "************************************************"
                echo ""
        fi

        if [ $menu == 3 ]
            then 
                echo "------------------------------------------------------"
                echo ""
                vagrant init
                echo ""
                echo "------------------------------------------------------"
                rm Vagrantfile
                clear
                touch Vagrantfile                

                echo ""
                echo "Veuillez choisir le nom de votre dossier synchro local "
                echo "------------------------------------------------------"
                read muletLocal
                echo "Veuillez choisir le nom de votre dossier synchro distant "
                echo "------------------------------------------------------"
                read muletDistant     
                echo "Veuillez choisir une adresse ip locale pour votre machine virtuelle(entre 1 et 254) :192.168.33."
                echo "------------------------------------------------------"
                read muletIP

                echo "config.vm.box = "ubuntu/xenial64"
config.vm.network "private_network", ip: "192.168.33.$muletIP"
config.vm.synced_folder "../$muletLocal", "/$muletDistant""> Vagrantfile    
                launch=0
                while [ $launch -ne 2 ]
                do
                echo "Votre machine virtuelle est prête à l'emploi et peut être démarée tout de suite, elle sera accessible a l'adresse ip suivante: 192.168.33.$muletIP"
                echo ""
                echo "1.OK"
                echo "2.Plus tard (ferme le programme)"
                read launch
                
                
                if [ $launch == 1 ]
                    then 
                        clear
                        vagrant up
                fi
                if [ $launch == 2 ]
                    then
                        clear
                        echo ""
                        echo "Ok à plus !"
                        echo ""
                        exit
                fi
                if [ $launch -lt 1 -o $launch -gt 2 ]
                    then 
                    clear
                    echo ""
                    echo "Veuillez entrer un chiffre compris entre 1 et 2, comme indiqué SUR LE MENU !"
                    echo ""
                    
                fi
                done
        fi
        if [ $menu == 4 ]
            then
                clear
                echo "A bientôt !"
                echo ""
                exit
        fi

        if [ $menu -lt 1 -o $menu -gt 4 ]
            then 
                clear
                echo ""
                echo "Veuillez entrer un chiffre compris entre 1 et 4, comme indiqué SUR LE MENU !"
                echo ""
        fi

    done
fi

if [ $mulet == 2 ]
then 
clear 
echo "C'est fort dommage ! A bientôt, peut-être"
echo ""
exit
fi
if [ $mulet -lt 1 -o $mulet -gt 2 ]
    then 
    clear
    echo "Veuillez entrer un chiffre compris entre 1 et 2, comme indiqué SUR LE MENU !"
    echo " *****5 secondes de punition.*****"
    sleep 5
    clear
    bash script.sh
fi








