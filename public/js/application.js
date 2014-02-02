
var i = Number(localStorage.getItem('search-counter')) + 1;
var ids;
var j,k,searchlist;
var $recent = $("ul.a");
function initializeRecent(){
	$("li.recent").remove();
	searchlist = localStorage.getItem('search-ids');
	searchlist = searchlist ? searchlist.split(',') : [];   
	for( j = 0, k = searchlist.length; j < k; j++) {
		$("ul.a").append(
			"<li class='recent'><a href = '/app/Xyz/list?search="
			+ localStorage.getItem("search-"+searchlist[j]) + "' class='ui-link ui-btn ui-shadow ui-corner-all' data-role='button'>"
			+ localStorage.getItem("search-"+searchlist[j]) 
			+ "</a></li>"
		);
	}

}
function checkInArr(a){
	var arr =[];
	searchlist = localStorage.getItem('search-ids');
	searchlist = searchlist ? searchlist.split(',') : [];   
	for( j = 0, k = searchlist.length; j < k; j++) {
			arr.push(localStorage.getItem("search-"+searchlist[j]) );
	}
	if($.inArray(a,arr)==-1) return false;
	else return true;
}
function addToRecent(a) {
	var query =a;

	if(localStorage.getItem('search-ids')!=null){
	ids = localStorage.getItem('search-ids');
	ids = ids+","+i;}
	else{
		ids =i;
	}
	localStorage.setItem("search-"+i,query);
	localStorage.setItem("search-ids", ids);
	localStorage.setItem("search-counter", i);
//	$("ul.a").append(
//	"<li class='ui-li-static ui-body-inherit'><a href = '/app/Xyz/list?search="
//	+ query + "'/>"
//	+ query 
//	+ "</a></li>"
//	);
	i++;
}

function helloWorld() {}