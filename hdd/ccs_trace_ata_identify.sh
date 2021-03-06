#!/bin/sh
export QEMU_S2E=/home/zaddach/projects/avatar-pandora/s2e-build/qemu-release/arm-s2e-softmmu/qemu-system-arm
export PYTHONPATH=/home/zaddach/projects/avatar-pandora/avatar-python:/home/zaddach/projects/avatar-pandora/avatar-gdbstub/scripts:/home/zaddach/projects/avatar-pandora/s2e/qemu/QMP
LOGNAME=$( date +'/tmp/Avatar_ata_identify_%Y-%m-%d_%H-%M-%S.log' )

python3 -u avatar_hdd_2.py  --power-control /home/zaddach/projects/avatar-pandora/avatar-samples/hdd/on_off.sh --serial /dev/ttyUSB0 --gdbstub-sram /home/zaddach/projects/avatar-pandora/avatar-gdbstub-build/cmake/gdbstub_ST3320413AS_0x7000/gdbstub_ST3320413AS_0x7000.bin --gdbstub-sram-address $(( 0x7000 )) --gdbstub-high /home/zaddach/projects/avatar-pandora/avatar-gdbstub-build/cmake/gdbstub_ST3320413AS_0x3FC000/gdbstub_ST3320413AS_0x3FC000.bin --gdbstub-high-address $(( 0x3fc000 ))   --trace-ata-identify -vvv | tee "${LOGNAME}"
