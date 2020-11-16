
xmin=`awk 'BEGIN{min=1.0e100}{rec=substr($0, 1, 6); if(rec=="ATOM  " || rec=="HETATM"){x=substr($0, 31,8); if(x+0 < min){min=x+0;}}} END{print min}' $1`
ymin=`awk 'BEGIN{min=1.0e100}{rec=substr($0, 1, 6); if(rec=="ATOM  " || rec=="HETATM"){x=substr($0, 39,8); if(x+0 < min){min=x+0;}}} END{print min}' $1`
zmin=`awk 'BEGIN{min=1.0e100}{rec=substr($0, 1, 6); if(rec=="ATOM  " || rec=="HETATM"){x=substr($0, 47,8); if(x+0 < min){min=x+0;}}} END{print min}' $1`
xmax=`awk 'BEGIN{max=-1.0e100}{rec=substr($0, 1, 6); if(rec=="ATOM  " || rec=="HETATM"){x=substr($0, 31,8); if(x+0 > max){max=x+0;}}} END{print max}' $1`
ymax=`awk 'BEGIN{max=-1.0e100}{rec=substr($0, 1, 6); if(rec=="ATOM  " || rec=="HETATM"){x=substr($0, 39,8); if(x+0 > max){max=x+0;}}} END{print max}' $1`
zmax=`awk 'BEGIN{max=-1.0e100}{rec=substr($0, 1, 6); if(rec=="ATOM  " || rec=="HETATM"){x=substr($0, 47,8); if(x+0 > max){max=x+0;}}} END{print max}' $1`
xspan=`echo "$xmax - $xmin" | bc`
yspan=`echo "$ymax - $ymin" | bc`
zspan=`echo "$zmax - $zmin" | bc`
maxspan=`printf "$xspan\n$yspan\n$zspan" | sort -nr | head -n1`
targetgsize=301
#echo "$targetgsize/($maxspan*1.43)"
scale=`awk -v ms="$maxspan" -v tgs="$targetgsize" '{printf "%0.1f", tgs/(ms*1.43);if(NR==1){exit;}}' $1`
echo $scale
