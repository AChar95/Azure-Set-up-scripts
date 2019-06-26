#! /bin/bash
echo "Please select what would you like to do?" 
echo "Please enter create, to generate a resources and virtual machines; or enter delete to remove your existing resource group generated by this script"
read userInput

case $userInput in
	"create") echo "Creating cloud and vm resources"
		az login
		scripts/resourceGrp.sh
		scripts/network.sh
		scripts/nsg.sh
		scripts/publicIP.sh
		scripts/NICs.sh
		scripts/VM.sh ;;
	"delete") echo "What would you like to delete? WildflyVM, JenkinsVM, both or everything?"
		read userChoice

		case $userChoice in
			"WildflyVM") echo "Deleting WildflyVM"
				scripts/deleteWFVM.sh ;;
			"JenkinsVM") echo "Deleting JenkinsVM"
				scripts/deleteJVM.sh ;;
			"both") echo "Deleting bothVMs"
				scripts/deleteJVM.sh
				scripts/deleteWFM.sh ;;
			"everything") echo "Deleting all resources"
				scripts/deleteAll.sh ;;
			*) echo "Sorry please choose either WildflyVM, JenkinsVM, both or everything; these choices are case-sensitve"
		esac
	*) echo "Sorry, please select either create or delete, these choices are case-sensitive"
esac

