#! /bin/sh
benchmark_plus_1=(
	mpg_guard1
	mpg_guard2
	mpg_guard3
	mpg_guard4
)
benchmark_plus_2=(
	mpg_plane1
)

benchmark_plus_3=(
	mpg_plane3
	mpg_plane2
	mpg_ite1
	mpg_ite2
	array_sum_2_5
	array_sum_2_15
	array_sum_3_5
	array_sum_3_15
	array_sum_4_5
	array_sum_4_15
	array_sum_5_5
	array_sum_5_15
	array_sum_6_5
	array_sum_6_15
	array_sum_7_5
	array_sum_7_15
	array_sum_8_5
	array_sum_8_15
mpg_example1
mpg_example2
mpg_example3
mpg_example4
mpg_example5
)
benchmark_plus_4=(
	array_search_2
	array_search_3
)

currenttime=`date +"%d%H%M"`
path="benchmarks/CLIA_Track_PLUS_Pos/"

> "result.txt"
> "error_log.txt"
echo "Category: limitedPlus" >> "result.txt"

for s in "${benchmark_plus_1[@]}"; do
	echo "processing $s in $path"
	count=0
	sumEx=0
	sumT=0.0
	for ((i=1; i<2; i++)); do
		python run.py $path$s"/grammar.sl" $path$s"/example"$i".txt"  
	done 

done
for s in "${benchmark_plus_2[@]}"; do
	echo "processing $s in $path"
	count=0
	sumEx=0
	sumT=0.0
	for ((i=1; i<2; i++)); do
		python run.py $path$s"/grammar.sl" $path$s"/example"$i".txt"  
	done 


done
for s in "${benchmark_plus_3[@]}"; do
	echo "processing $s in $path"
	count=0
	sumEx=0
	sumT=0.0
	for ((i=1; i<2; i++)); do
		python run.py $path$s"/grammar.sl" $path$s"/example"$i".txt"  
	done 


done
for s in "${benchmark_plus_4[@]}"; do
	echo "processing $s in $path"
	count=0
	sumEx=0
	sumT=0.0
	for ((i=1; i<2; i++)); do
		python run.py $path$s"/grammar.sl" $path$s"/example"$i".txt"  
	done 


done


benchmark_if=(
fg_max2
fg_max3
fg_max4
fg_max5
fg_max6
fg_max7
fg_max8
fg_max9
fg_max10
fg_max11
fg_max12
fg_max13
fg_max14
fg_max15
fg_sum_2_5
fg_sum_2_15
fg_sum_3_5
fg_sum_3_15
fg_sum_4_5
fg_sum_4_15
fg_sum_5_5
fg_sum_5_15
fg_sum_6_5
fg_sum_6_15
fg_sum_7_5
fg_sum_7_15
fg_sum_8_5
fg_sum_8_15
fg_sum_9_5
fg_sum_9_15
fg_sum_10_5
fg_sum_10_15
fg_mpg_example1
fg_mpg_example2
fg_mpg_example3
fg_mpg_example4
fg_mpg_example5
fg_guard1
fg_guard2
fg_guard3
fg_guard4
search_2
search_3
search_4
search_5
search_6
search_7
search_8
search_9
search_10
search_11
search_12
search_13
search_14
search_15
fg_mpg_ite1
fg_mpg_ite2
)

path="benchmarks/CLIA_Track_IF/"
echo "" >> "result.txt"
echo "Category: limitedIf" >> "result.txt"

for s in "${benchmark_if[@]}"; do
	echo "processing $s in $path"
	count=0
	sumEx=0
	sumT=0.0
	for ((i=1; i<2; i++)); do
		python run.py $path$s"/grammar.sl" $path$s"/example"$i".txt"  
	done 


done


benchmark_const=(
example1
example2
example3
example4
example5
fg_search_2
fg_search_3
fg_search_4
fg_search_5
fg_search_6
fg_search_7
fg_search_8
fg_search_9
fg_search_10
fg_search_11
fg_search_12
fg_search_13
fg_search_14
fg_search_15
guard1
guard2
guard3
guard4
ite1
ite2
plane2
plane3
sum_2_5
sum_2_15
sum_3_5
sum_3_15
sum_4_5
sum_4_15
sum_5_5
sum_5_15
sum_6_5
sum_6_15
sum_7_5
sum_7_15
sum_8_5
sum_8_15
sum_9_5
sum_9_15
sum_10_5
sum_10_15
)

path="benchmarks/CLIA_Track_Const/"

echo "Category: limitedConst" >> $out_detail
echo "Category: limitedConst" >> $out_path

for s in "${benchmark_const[@]}"; do
	echo "processing $s in $path"
	count=0
	sumEx=0
	sumT=0.0
	for ((i=1; i<2; i++)); do
		python run.py $path$s"/grammar.sl" $path$s"/example"$i".txt"  
	done 

done
