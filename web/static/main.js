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
		syllable.innerText = results.syllables[i];
		resultsContainer.appendChild(syllable);
	}
}

function onAnalyseClick(){
	let text = document.getElementById('text_to_analyse').value;
	let analyseRequest = analyse(text);
	analyseRequest.then( showIPAandTags );
}

function showIPAandTags(results){
	let resultsContainer = document.getElementById('analysis_results');
	resultsContainer.innerHTML='';
	console.log(results);
	for (let i=0;i<results.IPAandTags.length;i++){
		let IPAandTags = document.createElement('span')
		IPAandTags.className = 'IPAandTags';
		IPAandTags.innerText=results.IPAandTags[i][0];
		resultsContainer.appendChild(IPAandTags);
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

function analyse(text) {
	return fetch('/api/g2panalyse', {
		method: "POST",
		headers: {
			"Content-Type": "application/json; charset=utf-8",
		},
		body: JSON.stringify({text})
	}).then(result => result.json());
}

window.onload = function () {
	document.getElementById('syllablize').onclick = onSyllablizeClick;
	document.getElementById('analyse').onclick = onAnalyseClick;
};
