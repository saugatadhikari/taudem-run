mpiexec -np 3 PitRemove DEMTrainingRegion.tif
@REM mpiexec -np 3 PitRemove -z DEM_3.tif -fel DEM_3fel.tif -4way
@REM mpiexec -np 3 PitRemove -z DEM_3.tif -fel DEM_3feldm.tif -depmask logpitmask.tif
@REM mpiexec -np 3 PitRemove -z DEM_3.tif -fel DEM_3feldm4.tif -depmask logpitmask.tif -4way

@REM mpiexec -n 7 D8Flowdir -p src_dir_Reach_0.tif -sd8 Reach_0_DEM_2msd8.tif -fel DEM_Reach_0_Optimalfel.tif

@REM mpiexec -n 4 DinfFlowdir -ang DEM_3ang.tif -slp DEM_3slp.tif -fel DEM_3fel.tif

@REM mpiexec -n 6 D8Flowdir -p DEM_3pnf.tif -sd8 DEM_3sd8nf.tif -fel DEM_3.tif

@REM mpiexec -n 3 DinfFlowdir -ang DEM_3angnf.tif -slp DEM_3slpnf.tif -fel DEM_3.tif
@REM mpiexec -np 4 AreaD8 DEM_3.tif
@REM mpiexec -np 12 AreaDinf DEM_3.tif
@REM mpiexec -np 4 AreaD8 -p DEM_3pnf.tif -ad8 DEM_3ad8nf.tif
@REM mpiexec -np 12 AreaDinf -ang DEM_3angnf.tif -sca DEM_3scanf.tif

@REM mpiexec -n 7 aread8 -p DEM_3p.tif -o MyOutlet.shp -ad8 DEM_3ad8o.tif
@REM mpiexec -n 1 areadinf -ang DEM_3ang.tif -o MyOutlet.shp -sca DEM_3scao.tif
@REM mpiexec -n 5 Gridnet -p DEM_3p.tif -plen DEM_3plen.tif -tlen DEM_3tlen.tif -gord DEM_3gord.tif 
@REM mpiexec -n 5 Gridnet -p DEM_3p.tif -plen DEM_3plen1.tif -tlen DEM_3tlen1.tif -gord DEM_3gord1.tif -mask DEM_3ad8.tif -thresh 100 
@REM mpiexec -n 7 Gridnet -p DEM_3p.tif -plen DEM_3plen2.tif -tlen DEM_3tlen2.tif -gord DEM_3gord2.tif -o MyOutlet.shp

@REM Rem stream network peuker douglas
@REM mpiexec -np 7 PeukerDouglas -fel DEM_3fel.tif -ss DEM_3ss.tif
@REM mpiexec -n 4 Aread8 -p DEM_3p.tif -o MyOutlet.shp -ad8 DEM_3ssa.tif -wg DEM_3ss.tif
@REM mpiexec -n 4 Dropanalysis -p DEM_3p.tif -fel DEM_3fel.tif -ad8 DEM_3ad8.tif -ssa DEM_3ssa.tif -drp DEM_3drp.txt -o MyOutlet.shp -par 5 500 10 0
@REM mpiexec -n 5 Threshold -ssa DEM_3ssa.tif -src DEM_3src.tif -thresh 180 
@REM mpiexec -n 5 Streamnet -fel DEM_3fel.tif -p DEM_3p.tif -ad8 DEM_3ad8.tif -src DEM_3src.tif -ord DEM_3ord3.tif -tree DEM_3tree.dat -coord DEM_3coord.dat -net DEM_3net.shp -w DEM_3w.tif -o MyOutlet.shp

@REM Rem stream network slope area
@REM mpiexec -n 3 SlopeArea -slp DEM_3slp.tif -sca DEM_3sca.tif -sa DEM_3sa.tif -par 2 1
@REM mpiexec -n 8 D8FlowpathExtremeUp -p DEM_3p.tif -sa DEM_3sa.tif -ssa DEM_3ssa1.tif -o MyOutlet.shp
@REM mpiexec -n 4 Dropanalysis -p DEM_3p.tif -fel DEM_3fel.tif -ad8 DEM_3ad8.tif -ssa DEM_3ssa1.tif -drp DEM_3drp1.txt -o MyOutlet.shp -par 5000 50000 10 1
@REM mpiexec -n 5 Threshold -ssa DEM_3ssa1.tif -src DEM_3src1.tif -thresh 15000
@REM mpiexec -n 8 Streamnet -fel DEM_3fel.tif -p DEM_3p.tif -ad8 DEM_3ad8.tif -src DEM_3src1.tif -ord DEM_3ord5.tif -tree DEM_3tree1.dat -coord DEM_3coord1.dat -net DEM_3net1.shp -w DEM_3w1.tif -o MyOutlet.shp -sw

@REM mpiexec -n 3 LengthArea -plen DEM_3plen.tif -ad8 DEM_3ad8.tif -ss DEM_3lass.tif -par 0.03 1.3

@REM Rem Specialized grid analysis
@REM mpiexec -n 3 SlopeAreaRatio -slp DEM_3slp.tif -sca DEM_3sca.tif -sar DEM_3sar.tif
@REM mpiexec -np 7 D8HDisttoStrm -p DEM_3p.tif -src DEM_3ad8.tif -dist DEM_3dist1.tif -thresh 200 
@REM mpiexec -np 5 D8HDisttoStrm -p DEM_3p.tif -src DEM_3src.tif -dist DEM_3dist.tif

@REM Rem downslope influence
@REM mpiexec -np 1 AreaDinf -ang DEM_3ang.tif -wg DEM_3dg.tif -sca DEM_3di.tif 
@REM mpiexec -n 2 dinfupdependence -ang DEM_3ang.tif -dg DEM_3dg.tif -dep DEM_3dep.tif
@REM mpiexec -n 7 dinfdecayaccum -ang DEM_3ang.tif -dm DEM_3dm08.tif -dsca DEM_3dsca.tif
@REM mpiexec -n 3 dinfConcLimAccum -ang DEM_3ang.tif -dm DEM_3dm08.tif -dg DEM_3dg.tif -ctpt DEM_3ctpt.tif -q DEM_3sca.tif
@REM mpiexec -n 5 dinfConcLimAccum -ang DEM_3ang.tif -dm DEM_3dm08.tif -dg DEM_3dg.tif -ctpt DEM_3ctpto.tif -q DEM_3sca.tif  -o MyOutlet.shp -csol 2.4

@REM Rem Trans lim accum
@REM mpiexec -n 7 dinfTransLimAccum -ang DEM_3ang.tif -tsup DEM_3tsup.tif -tc DEM_3tc.tif -tla DEM_3tla.tif -tdep DEM_3tdep.tif
@REM mpiexec -n 6 dinfTransLimAccum -ang DEM_3ang.tif -tsup DEM_3tsup.tif -tc DEM_3tc.tif -tla DEM_3tla1.tif -tdep DEM_3tdep1.tif -o MyOutlet.shp -cs DEM_3dg.tif -ctpt DEM_3ctpt1.tif

@REM rem REVERSE ACCUMULATION
@REM mpiexec -n 4 dinfRevAccum -ang DEM_3ang.tif -wg DEM_3dg.tif -racc DEM_3racc.tif -dmax DEM_3rdmax.tif

@REM rem MOVEOUTLETS
@REM mpiexec -n 5 Threshold -ssa DEM_3ad8.tif -src DEM_3src2.tif -thresh 200
@REM mpiexec -np 3 MoveOutletstoStreams -p DEM_3p.tif -src DEM_3src.tif -o OutletstoMove.shp -om Outletsmoved.shp -md 20

@REM rem DISTDOWN
@REM mpiexec -n 1 dinfdistdown -ang DEM_3ang.tif -fel DEM_3fel.tif -src DEM_3src.tif -dd DEM_3ddhave.tif
@REM mpiexec -n 2 dinfdistdown -ang DEM_3ang.tif -fel DEM_3fel.tif -src DEM_3src.tif -dd DEM_3ddhmin.tif -m min h
@REM mpiexec -n 3 dinfdistdown -ang DEM_3ang.tif -fel DEM_3fel.tif -src DEM_3src.tif -dd DEM_3ddhmax.tif -m max h
@REM mpiexec -n 4 dinfdistdown -ang DEM_3ang.tif -fel DEM_3fel.tif -src DEM_3src.tif -dd DEM_3ddvave.tif -m ave v
@REM mpiexec -n 5 dinfdistdown -ang DEM_3ang.tif -fel DEM_3fel.tif -src DEM_3src.tif -dd DEM_3ddvmin.tif -m min v
@REM mpiexec -n 6 dinfdistdown -ang DEM_3ang.tif -fel DEM_3fel.tif -src DEM_3src.tif -dd DEM_3ddvmax.tif -m max v
@REM mpiexec -n 7 dinfdistdown -ang DEM_3ang.tif -fel DEM_3fel.tif -src DEM_3src.tif -dd DEM_3ddsave.tif -m ave s
@REM mpiexec -n 8 dinfdistdown -ang DEM_3ang.tif -fel DEM_3fel.tif -src DEM_3src.tif -dd DEM_3ddsmin.tif -m min s
@REM mpiexec -n 1 dinfdistdown -ang DEM_3ang.tif -fel DEM_3fel.tif -src DEM_3src.tif -dd DEM_3ddsmax.tif -m max s
@REM mpiexec -n 2 dinfdistdown -ang DEM_3ang.tif -fel DEM_3fel.tif -src DEM_3src.tif -dd DEM_3ddpave.tif -m ave p
@REM mpiexec -n 3 dinfdistdown -ang DEM_3ang.tif -fel DEM_3fel.tif -src DEM_3src.tif -dd DEM_3ddpmin.tif -m min p
@REM mpiexec -n 4 dinfdistdown -ang DEM_3ang.tif -fel DEM_3fel.tif -src DEM_3src.tif -dd DEM_3ddpmax.tif -m max p
@REM mpiexec -n 2 dinfdistdown -ang DEM_3ang.tif -fel DEM_3fel.tif -src DEM_3src.tif -dd DEM_3ddvavenc.tif -m ave v -nc
@REM mpiexec -n 3 dinfdistdown -ang DEM_3ang.tif -fel DEM_3fel.tif -src DEM_3src.tif -dd DEM_3ddhminnc.tif -m min h -nc
@REM mpiexec -n 4 dinfdistdown -ang DEM_3ang.tif -fel DEM_3fel.tif -src DEM_3src.tif -dd DEM_3ddpmaxnc.tif -m max p -nc
@REM mpiexec -n 4 dinfdistdown -ang DEM_3ang.tif -fel DEM_3fel.tif -src DEM_3src.tif -dd DEM_3ddsmaxnc.tif -m max s -nc
@REM mpiexec -n 4 dinfdistdown -ang DEM_3ang.tif -fel DEM_3fel.tif -src DEM_3src.tif -dd DEM_3ddsmaxwg.tif -m max s -wg DEM_3dwg.tif
@REM mpiexec -n 4 dinfdistdown -ang DEM_3ang.tif -fel DEM_3fel.tif -src DEM_3src.tif -dd DEM_3ddhavewg.tif -m ave h -wg DEM_3dwg.tif

@REM rem DISTANCE UP
@REM mpiexec -n 1 dinfdistup -ang DEM_3ang.tif -fel DEM_3fel.tif -du DEM_3duhave.tif
@REM mpiexec -n 2 dinfdistup -ang DEM_3ang.tif -fel DEM_3fel.tif -du DEM_3duhmin.tif -m min h -thresh 0.5
@REM mpiexec -n 3 dinfdistup -ang DEM_3ang.tif -fel DEM_3fel.tif -du DEM_3duhmax.tif -m max h -thresh 0.8
@REM mpiexec -n 4 dinfdistup -ang DEM_3ang.tif -fel DEM_3fel.tif -du DEM_3duvave.tif -m ave v
@REM mpiexec -n 5 dinfdistup -ang DEM_3ang.tif -fel DEM_3fel.tif -du DEM_3duvmin.tif -m min v
@REM mpiexec -n 6 dinfdistup -ang DEM_3ang.tif -fel DEM_3fel.tif -du DEM_3duvmax.tif -m max v
@REM mpiexec -n 7 dinfdistup -ang DEM_3ang.tif -fel DEM_3fel.tif -du DEM_3dusave.tif -m ave s -thresh 0.9
@REM mpiexec -n 8 dinfdistup -ang DEM_3ang.tif -fel DEM_3fel.tif -du DEM_3dusmin.tif -m min s
@REM mpiexec -n 1 dinfdistup -ang DEM_3ang.tif -fel DEM_3fel.tif -du DEM_3dusmax.tif -m max s
@REM mpiexec -n 2 dinfdistup -ang DEM_3ang.tif -fel DEM_3fel.tif -du DEM_3dupave.tif -m ave p
@REM mpiexec -n 3 dinfdistup -ang DEM_3ang.tif -fel DEM_3fel.tif -du DEM_3dupmin.tif -m min p
@REM mpiexec -n 4 dinfdistup -ang DEM_3ang.tif -fel DEM_3fel.tif -du DEM_3dupmax.tif -m max p
@REM mpiexec -n 2 dinfdistup -ang DEM_3ang.tif -fel DEM_3fel.tif -du DEM_3duvavenc.tif -m ave v -nc
@REM mpiexec -n 3 dinfdistup -ang DEM_3ang.tif -fel DEM_3fel.tif -du DEM_3duhminnc.tif -m min h -nc
@REM mpiexec -n 4 dinfdistup -ang DEM_3ang.tif -fel DEM_3fel.tif -du DEM_3dupmaxnc.tif -m max p -nc
@REM mpiexec -n 4 dinfdistup -ang DEM_3ang.tif -fel DEM_3fel.tif -du DEM_3dusmaxnc.tif -m max s -nc

@REM rem AVALANCHE
@REM mpiexec -n 2 DinfAvalanche -ang DEM_3ang.tif -fel DEM_3fel.tif -ass DEM_3ass.tif -rz DEM_3rz.tif -dfs DEM_3dfs.tif
@REM mpiexec -n 3 DinfAvalanche -ang DEM_3ang.tif -fel DEM_3fel.tif -ass DEM_3ass.tif -rz DEM_3rz1.tif -dfs DEM_3dfs1.tif -thresh 0.1 -alpha 10
@REM mpiexec -n 4 DinfAvalanche -ang DEM_3ang.tif -fel DEM_3fel.tif -ass DEM_3ass.tif -rz DEM_3rz2.tif -dfs DEM_3dfs2.tif -direct -thresh 0.01 -alpha 5


@REM rem SLOPEAVEDOWN
@REM mpiexec -n 3 slopeavedown -p DEM_3p.tif -fel DEM_3fel.tif -slpd DEM_3slpd.tif
@REM mpiexec -n 3 slopeavedown -p DEM_3p.tif -fel DEM_3fel.tif -slpd DEM_3slpd1.tif -dn 1000

@REM rem test case for tiffio partitions within a stripe
@REM mpiexec -n 6 areadinf -ang topo3fel1ang.tif -sca topo3fel1sca.tif 

@REM rem test case for double precision file
@REM mpiexec -n 4 areadinf -ang demDoubleang.tif -sca demDoublesca.tif -wg demDoublewgt.tif

@REM rem gagewatershed test
@REM mpiexec -n 7 gagewatershed -p DEM_3p.tif -o Outletsmoved.shp -gw DEM_3gw.tif -id gwid.txt
@REM mpiexec -n 4 gagewatershed -p DEM_3p.tif -o Outletsmoved.shp -gw DEM_3gw1.tif 
@REM mpiexec -n 5 gagewatershed -p DEM_3tp.img -o Outletsmoved2.shp -gw DEM_3gw1.tif -id gwid1.txt -upid gwup.txt

@REM rem Connect down
@REM mpiexec -n 8 ConnectDown -p DEM_3p.tif -ad8 DEM_3ad8.tif -w DEM_3gw.tif -o MyOutlets.shp -od MyOutlets_Moved.shp -d 1
