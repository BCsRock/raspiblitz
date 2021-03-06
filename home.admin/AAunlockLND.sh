#!/bin/sh
echo ""
echo "****************************************************************************"
echo "Unlock LND Wallet --> lncli unlock"
echo "****************************************************************************"
echo "HELP: Enter your PASSWORD C"
echo "****************************************************************************"
chain="$(bitcoin-cli -datadir=/home/bitcoin/.bitcoin getblockchaininfo | jq -r '.chain')"
while :
  do
    lncli unlock
    sleep 4
    locked=$(sudo tail -n 1 /mnt/hdd/lnd/logs/bitcoin/${chain}net/lnd.log | grep -c unlock)
    if [ ${locked} -eq 0  ]; then
      break
    fi

    echo ""
    echo "Wallet still locked - please try again or Cancel with CTRL+C"
  done
