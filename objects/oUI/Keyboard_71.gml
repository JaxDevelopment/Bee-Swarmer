
if (oFood.Score == Needed) or (oFood.Score > Needed)
{
	instance_create_layer(oHive.x,oHive.y,"Instances",oBee)
	oFood.Score = oFood.Score - Needed
	Needed++
	
	
}	