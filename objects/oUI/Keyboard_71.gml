
if (oHive.Score == Needed) or (oHive.Score > Needed)
{
	instance_create_layer(oHive.x,oHive.y,"Instances",oBee)
	oHive.Score = oHive.Score - Needed
	Needed++
	
	
}	