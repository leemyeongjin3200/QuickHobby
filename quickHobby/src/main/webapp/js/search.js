/**
 * 
 */

function search(search){
	var searchForm = document.getElementById("searchForm");
	searchForm.action="listForm.do";
	searchForm.method="get";
	
	var input=document.getElementById("search");
	input.value=search;
	searchForm.submit();
}