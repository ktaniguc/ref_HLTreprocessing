
INPUTFILE=$1

#INPUTFILE=/gpfs/fs7001/kayamash/dataset/ForAthena/data18_13TeV.00360129.physics_EnhancedBias.recon.RAW.r11276_r11374/RAW.17754287._080689.pool.root.1
#INPUTFILE=/cvmfs/atlas-nightlies.cern.ch/repo/data/data-art/TrigP1Test/data18_13TeV.00360026.physics_EnhancedBias.merge.RAW._lb0151._SFO-1._0001.1
athena.py -c "setMenu='LS2_v1';doEmptyMenu=True;doMuonSlice=True;rewriteLVL1=True;doWriteBS=True;" --imf --perfmon --threads=1 --evtMax=-1 --filesInput=$INPUTFILE TriggerJobOpts/runHLT_standalone.py 
#athena.py -c "setMenu='LS2_v1';doEmptyMenu=True;doMuonSlice=True;doWriteBS=True;" --imf --perfmon --threads=1 --evtMax=50 --filesInput=$INPUTFILE TriggerJobOpts/runHLT_standalone.py 

