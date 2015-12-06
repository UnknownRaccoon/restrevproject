// This is a simple *viewmodel* - JavaScript that defines the data and behavior of your UI
function adaptiveKeyWords(initialText)
{var i;
var count;
var reviewText;
var keywordsList;
var resultKeyword;
count=0;
reviewText=document.getElementById("review_review").value;
keywordsList=reviewText.split(" ");
resultKeyword="";
for (i=0; i<keywordsList.length; i++) {
if (keywordsList[i].length > 4)
{resultKeyword+=keywordsList[i];
count++;
if (count === 3) { return resultKeyword; } else { resultKeyword+= (keywordsList[1].indexOf(",")>0) ? " ": ", ";}
}
}
return initialText;
}

function changeReview(){
var indexKWlabel;
var initialText;
var reusltText;
indexKWlabel=document.querySelectorAll("[for=review_keywords]");
initialText=indexKWlabel[0].innerHTML;
reusltText=initialText;
if (document.getElementById("review_review").value.split(" ").length > 10) {
reusltText = adaptiveKeyWords(initialText);
if (reusltText!=initialText) {indexKWlabel[0].innerHTML = reusltText} }
}
document.getElementById("review_review").addEventListener("change", function(){changeReview();});
