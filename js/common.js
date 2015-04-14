function strToJson(str)
{
	var json = (new Function("return " + str))();
	return json;
}