//Parameters for the coalescence simulation program : fsimcoal2.exe
2 samples to simulate :
//Population effective sizes (number of genes)
$pop0_Verb_nigrum$
$pop1_Verb_thapsus$
//Samples sizes and samples age 
10
22
//Growth rates : negative growth implies population expansion
0
0
//Number of migration matrices : 0 implies no migration between demes
3
//Migration matrix 0: No migration
0  0    
0  0
//Migration matrix 1
0 $mig10$
$mig01$ 0
//Migration matrix 2: No migration
0  0   
0  0
//historical event: time, source, sink, migrants, new deme size, new growth rate, migration matrix index
2   historical event
$TMIG$ 0 0 0 1 0 1
$TDIV$ 1 0 1 $RESIZE$ 0 2
//Number of independent loci [chromosome] 
1 0
//Per chromosome: Number of contiguous linkage Block: a block is a set of contiguous loci
1
//per Block:data type, number of loci, per generation recombination and mutation rates and optional parameters
FREQ 1 0 7.0e-9 OUTEXP