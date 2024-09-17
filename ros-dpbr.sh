#!/bin/sh
mkdir -p ./pbr
cd ./pbr

# AS4809 BGP
wget --no-check-certificate -c -O pcdnblock.txt https://bcr.pbh-btn.ghorg.ghostchu-services.top/combine/all.txt

{
echo "/ip firewall address-list"

for net in $(cat pcdnblock.txt) ; do
  echo "add list=pcdnblock address=$net comment=p2pblock"
done

} > ../p2pblock.rsc

# Remove the first 10 lines from the generated p2pblock.rsc
sed -i '1,10d' ../p2pblock.rsc

cd ..
rm -rf ./pbr
