#!/bin/bash
clear
echo $0 $@

if [[ -f $1 ]]; then
    ansiblePlaybook="$1"
  else
    if [[ -f $1.yaml ]]; then
      ansiblePlaybook="$1.yaml"
    else
      echo -e "Cannot find playbook $1"
      exit
  fi
fi

ansibleBecome="--become-password-file ~/.ssh/sshpw"
ansibleUser=`whoami`

if [[ $DEBUG -gt 0 ]]; then
  echo -e "ansible-playbook \\"
  echo -e "  --inventory-file hosts.yaml \\"
  echo -e "  --user ${ansibleUser} \\"
  echo -e "  ${ansibleBecome} \\"
  echo -e "  ${ansiblePlaybook}"
fi

ansible-playbook \
  --inventory-file hosts.yaml \
  --user ${ansibleUser} \
  ${ansibleBecome} \
  ${ansiblePlaybook}
