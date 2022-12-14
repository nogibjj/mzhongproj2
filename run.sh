# read -p "Enter the csv file name: " file
file="world_population.csv"

echo "Enter the operation to take:
1: Show top-10 countries with most population
2: Show top-10 countries with least population
3: Search the data of specified country
4: Show population of countries in NA"

read option
if [ $option -eq 1 ]
then
echo "Show top-10 countries with most population"
cut -f 1,3,6  -d "," $file | sort -k1 -n -t, | head -n 11
elif [ $option -eq 2 ]
then
echo "Show top-10 countries with least population"
cut -f 1,3,6  -d "," $file | sort -k1 -n -r -t, | head -n 10
elif [ $option -eq 3 ]
then
read -p "Enter the country name:" country
cut -f 3,4,5,6  -d "," $file | grep $country
elif [ $option -eq 4 ]
then
echo "Show population of countries in NA"
awk -F ',' '{if($5=="North America") print $3,$6}'  $file
fi