function threebal(a,b,c) {
    var avg = (Math.abs(a)+Math.abs(b)+Math.abs(c))/3;
    var maxcal = Math.max(Math.abs(a-avg),Math.abs(b-avg),Math.abs(c-avg));
    var result = null;
    if(avg == 0){
    	result = 0;
    }
    else{
    	result = maxcal/avg;
    	result = result.toFixed(2);
    }
    return result;
}

function getcurids(id){
	var ids = null;
	$.ajax({
		url:'/XJAP/powerres/listbreakerid/' + id,
		type:'POST',
		data:'{}',
		dataType:'json',
		success: function(strids){
			getcurvalues(strids.data);
		}
	});
	return ids;
}

function getcurvalues(ids){
	var ret_data = null;
	$.ajax({
		url:'http://210.10.40.191:9001/iserver/services/SCRIPTDATA?request=getvalues&dbname=analog_value&id='+ids,
		type:'POST',
		data:'{}',
		headers:{
			'Content-Type':'application/x-www-form-urlencoded'
		},
		dataType:'json',
		success: function(json){
			ret_data = json.value;
			//alert(ret_data);
			getBKJsonData(ret_data);
			getbar(ret_data);
			//alert(threebal(ret_data[0],ret_data[1],ret_data[2]))
			getpie(threebal(9,8,4));
		}
	});
	//return ret_data;
}

