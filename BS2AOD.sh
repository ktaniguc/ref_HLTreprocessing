#! /bin/sh

INPUTFILE=./*Athena*.data
Reco_tf.py --inputBSFile=$INPUTFILE --outputAODFile=AOD.pool.root --conditionsTag='CONDBR2-BLKPA-2018-11' --geometryVersion='ATLAS-R2-2016-01-00-01' --preExec="from TriggerJobOpts.TriggerFlags import TriggerFlags; TriggerFlags.AODEDMSet.set_Value_and_Lock('AODFULL');" --postInclude="TriggerTest/disableChronoStatSvcPrintout.py" --athenaopts="--imf --perfmon --threads=1" --maxEvents=-1
