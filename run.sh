#! /bin/sh

file=/gpfs/fs7001/ktaniguc/data/data18_13TeV.00349335.physics_EnhancedBias.merge.RAW/data18_13TeV/data18_13TeV.00349335.physics_EnhancedBias.merge.RAW._lb0163._SFO-1._0001.1

TAIL=$file
TAIL=${TAIL##*/}
echo $TAIL
mkdir run_$TAIL

echo "#! /bin/sh" > run_$TAIL/run.sh
echo "" >> run_$TAIL/run.sh
echo "export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase" >> run_$TAIL/run.sh
echo "alias setupATLAS='source ${ATLAS_LOCAL_ROOT_BASE}/user/atlasLocalSetup.sh'" >> run_$TAIL/run.sh
echo "setupATLAS" >> run_$TAIL/run.sh
echo "" >> run_$TAIL/run.sh
echo "cd $TestArea/" >> run_$TAIL/run.sh
echo "source ./setup.sh" >> run_$TAIL/run.sh
echo "source $TestArea/../build/*/setup.sh" >> run_$TAIL/run.sh
echo 'export FRONTIER_SERVER="(serverurl=http://atlasfrontier-ai.cern.ch:8000/atlr)(serverurl=http://atlasfrontier2-ai.cern.ch:8000/atlr)(serverurl=http://atlasfrontier1-ai.cern.ch:8000/atlr)(serverurl=http://frontier-atlas.lcg.triumf.ca:3128/ATLAS_frontier)(serverurl=http://frontier-atlas1.lcg.triumf.ca:3128/ATLAS_frontier)(serverurl=http://frontier-atlas2.lcg.triumf.ca:3128/ATLAS_frontier)(serverurl=http://ccfrontier.in2p3.fr:23128/ccin2p3-AtlasFrontier)(serverurl=http://ccfrontier01.in2p3.fr:23128/ccin2p3-AtlasFrontier)(proxyurl=http://conddb-px01.icepp.jp:3128)(proxyurl=http://conddb-px02.icepp.jp:3128)(proxyurl=http://atlasbpfrontier.cern.ch:3127)(proxyurl=http://atlasbpfrontier.fnal.gov:3127)"' >> run_$TAIL/run.sh
echo "cd $TestArea/../bsub_datarate/run_$TAIL/" >> run_$TAIL/run.sh
echo "cp ../RAW2RDOTrig.sh ./" >> run_$TAIL/run.sh
echo "cp ../BS2AOD.sh ./" >> run_$TAIL/run.sh
echo "./RAW2RDOTrig.sh $file" >> run_$TAIL/run.sh
echo "./BS2AOD.sh" >> run_$TAIL/run.sh

chmod 744 run_$TAIL/run.sh

cd run_$TAIL
bsub -n 2 -q 12h -o log_${TAIL}.txt ./run.sh
cd ..
