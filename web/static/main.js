function onSyllablizeClick() {
  let text = document.getElementById("text_to_analyse").value;
  let syllablizeRequest = syllablize(text);
  syllablizeRequest.then(showSyllables);
}

function showSyllables(results) {
  let resultsContainer = document.getElementById("syllable_results");
  resultsContainer.innerHTML = "";
  for (let i = 0; i < results.syllables.length; i++) {
    let syllable = document.createElement("span");
    syllable.className = "syllable";
    syllable.innerText = results.syllables[i];
    resultsContainer.appendChild(syllable);
  }
}

function onAnalyseClick() {
  let text = document.getElementById("text_to_analyse").value;
  let analyseRequest = analyse(text);
  analyseRequest.then(showIPAandTags);
}

function showIPAandTags(results) {
  let syllables = results.syllables;
  let resultsContainer = document.getElementById("analysis_results");
  resultsContainer.innerHTML = "";
  for (let i = 0; i < syllables.length; i++) {
    let syllable = syllables[i];
    let phonemes = syllable.phonemes;
    let syllableNode = document.createElement("div");
    syllableNode.className = "syllable";
    for (let j = 0; j < phonemes.length; j++) {
      let phoneme = phonemes[j];
      let phonemeNode = document.createElement("div");
      phonemeNode.className = "phoneme";
      let ipa = phoneme.ipa;
      let ipaNode = document.createElement("div");
      ipaNode.className = "ipa";
      ipaNode.innerText = ipa;
      phonemeNode.appendChild(ipaNode);
      let tagsNode = document.createElement("div");
      tagsNode.className = "tags";
      phonemeNode.appendChild(tagsNode);
      let tags = phoneme.tags;
      for (let k = 0; k < tags.length; k++) {
        let tag = tags[k];
        let tagNode = document.createElement("div");
        tagNode.className = "tag";
        tagNode.innerText = tag;
        tagsNode.appendChild(tagNode);
      }
      syllableNode.append(phonemeNode);
    }
    resultsContainer.appendChild(syllableNode);
  }
}

function OnIPAClick() {
  let text = document.getElementById("text_to_analyse").value;
  let IPARequest = ml2ipa(text);
  IPARequest.then(showIPA);
}

function showIPA(results) {
  let resultsContainer = document.getElementById("ipa_results");
  resultsContainer.innerHTML = "";
  for (let i = 0; i < results.IPA.length; i++) {
    let IPA = document.createElement("span");
    IPA.className = "IPA";
    IPA.innerText = results.IPA[i][0];
    resultsContainer.appendChild(IPA);
  }
}

/**
 * @param {String} text
 * @returns {Promise}
 */
function syllablize(text) {
  return fetch("/api/syllablize", {
    method: "POST",
    headers: {
      "Content-Type": "application/json; charset=utf-8"
    },
    body: JSON.stringify({ text })
  }).then(result => result.json());
}

function analyse(text) {
  return fetch("/api/g2panalyse", {
    method: "POST",
    headers: {
      "Content-Type": "application/json; charset=utf-8"
    },
    body: JSON.stringify({ text })
  }).then(result => result.json());
}

function ml2ipa(text) {
  return fetch("/api/getipa", {
    method: "POST",
    headers: {
      "Content-Type": "application/json; charset=utf-8"
    },
    body: JSON.stringify({ text })
  }).then(result => result.json());
}

window.onload = function() {
  document.getElementById("syllablize").onclick = onSyllablizeClick;
  document.getElementById("analyse").onclick = onAnalyseClick;
  document.getElementById("getipa").onclick = OnIPAClick;
};
