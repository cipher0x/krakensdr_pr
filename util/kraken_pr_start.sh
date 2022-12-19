#!/bin/bash

#source /home/krakenrf/miniforge3/etc/profile.d/conda.sh <- required for systemd auto startup (comment out eval and use source instead)

eval "$(conda shell.bash hook)"
conda activate kraken

"$(dirname "$0")"/kraken_pr_stop.sh
sleep 2

cd heimdall_daq_fw/Firmware
#sudo ./daq_synthetic_start.sh
sudo env "PATH=$PATH" ./daq_start_sm.sh
sleep 2
cd ../../krakensdr_pr
sudo env "PATH=$PATH" ./gui_run.sh
