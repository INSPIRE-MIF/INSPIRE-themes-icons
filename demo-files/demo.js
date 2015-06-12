if (!('boxShadow' in document.body.style)) {
	document.body.setAttribute('class', 'noBoxShadow');
}

document.body.addEventListener("click", function(e) {
	var target = e.target;
	if (target.tagName === "INPUT" &&
		target.getAttribute('class').indexOf('liga') === -1) {
		target.select();
	}
});

(function() {
	var fontSize = document.getElementById('fontSize'),
		testDrive = document.getElementById('testDrive'),
		testText = document.getElementById('testText');
	function updateTest() {
		testDrive.innerHTML = testText.value || String.fromCharCode(160);
		if (window.icomoonLiga) {
			window.icomoonLiga(testDrive);
		}
	}
	function updateSize() {
		testDrive.style.fontSize = fontSize.value + 'px';
	}
	fontSize.addEventListener('change', updateSize, false);
	testText.addEventListener('input', updateTest, false);
	testText.addEventListener('change', updateTest, false);
	updateSize();
}());


function switchToLang (select) {
  var lang = select[select.selectedIndex].value;
  $('.iti-box.full[class*="-"]').each(function (el) {
    var css = $(this).attr('class');
    $(this).attr('class', css.replace(/[a-z]{2}$/, lang));
  });
}