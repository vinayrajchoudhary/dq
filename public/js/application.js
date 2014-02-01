var i = Number(localStorage.getItem('search-counter')) + 1;
var ids =[];
var j,k,searchlist;
var $recent = $("ul.a");
$(function(){ 
$recent = $("ul.a");
	
searchlist = localStorage.getItem('search-ids');
searchlist = searchlist ? searchlist.split(',') : [];   
for( j = 0, k = searchlist.length; j < k; j++) {
	$recent.append(
		"<li class='ui-li-static ui-body-inherit'>"
		+ localStorage.getItem("search-"+searchlist[j]) 
		+ "</li>"
	);
}
});
function addToRecent(a) {
	var query =a;
	ids.push(i);
	localStorage.setItem("search-"+i,query);
	localStorage.setItem("search-ids", ids.join(","));
	localStorage.setItem("search-counter", i);
	$("ul.a").append(
	"<li class='ui-li-static ui-body-inherit'>"
	+ query 
	+ "</li>"
	);
	i++;
}
function helloWorld() {}