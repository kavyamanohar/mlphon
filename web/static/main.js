function onSyllablizeClick(){
	let text = document.getElementById('text_to_analyse').value;
	let syllablizeRequest = syllablize(text);
	syllablizeRequest.then( showSyllables );
}

function showSyllables(results){
	let resultsContainer = document.getElementById('syllable_results');
	resultsContainer.innerHTML='';
	for (let i=0;i<results.syllables.length;i++){
		let syllable = document.createElement('span')
		syllable.className='syllable';
		syllable.innerHTML=results.syllables[i];
		resultsContainer.appendChild(syllable);
	}
}
/**
 * @param {String} text
 * @returns {Promise}
 */
function syllablize(text) {
	return fetch('/api/syllablize', {
		method: "POST",
		headers: {
			"Content-Type": "application/json; charset=utf-8",
		},
		body: JSON.stringify({ text})
	}).then(result => result.json());
}

window.onload = function () {
	document.getElementById('syllablize').onclick = onSyllablizeClick;
};
