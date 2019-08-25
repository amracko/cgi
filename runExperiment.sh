#!/bin/bash

if [ -z $1 ]; then
	#If there is no argument given, print help
	echo "Usage: runExperiment <experiment name>"
	exit 1
fi
experiment="${@:1}"
printf "\nRunning experiment: '$experiment'\n"

# Print header
echo "Cgroups settings:"

# Take user inputs and save them to variables
echo -n "Cpuset cpus [# of cores] (e.g. 4): "
read cpusetCpus

echo -n "Cpu shares (e.g. 0): "
read cpuShares

echo -n "Memory limit [MB] (e.g. 512M): "
read memoryLimit

echo -n "Enter path to log file: "
read log

printf "\n\n"
echo "Running command:"
echo "docker run -it --cpuset-cpus=\"$cpusetCpus\" --cpu-shares=$cpuShares --memory=\"$memoryLimit\" $experiment"
# $1 is the argument given to this script
start=$(date +%s)
docker run -it --cpuset-cpus="$cpusetCpus" --cpu-shares=$cpuShares --memory="$memoryLimit" $experiment | tee $log
printf "\n\nExperiment took $(($(date +%s) - $start)) seconds.\n" | tee -a $log
