#! /bin/bash
echo "Proszę wybierz pojemność obrazu"
read pojemnosc
if (( $pojemnosc  <= 100 ))
then
echo "Podaj ilość partycji"
read ilosc
stala=$(($pojemnosc/$ilosc))
dd if=/dev/zero of=plik.img bs=1M count=$pojemnosc
for ((n=0;n<$ilosc-1;n++))
do
(
echo n
echo
echo
echo "+"$stala"M"
echo
echo w
echo y
) | gdisk plik.img
done
(
echo n
echo
echo
echo
echo
echo w
echo y
) | gdisk plik.img

else
echo "Za duża pojemność"
fi
echo "Zakładam system plików. Podaj co przyjąć ext4/xfs/vfat ?"
read system
losetup -Pf plik.img
if [[ $system = ext4 ]]
then
for ((n=1;n<=$ilosc;n++))
do
mkfs.ext4 /dev/loop0p$n
done
elif [[ $system = xfs ]]
then
for ((n=1;n<=$ilosc;n++))
do
mkfs.xfs /dev/loop0p$n
done
elif [[ $system = vfat ]]
then
for ((n=1;n<=$ilosc;n++))
do mkfs.vfat /dev/loop0p$n
done
fi
echo "Sprawdzam poprawność"
lsblk -f /dev/loop0
