import sys
import os
from flask import Flask, jsonify, render_template, request
import regex
from mlphon import IPA, G2P, Syllablizer, getPhonemelist, getPhonemetaglist
app = Flask(__name__)
#app.config['DEBUG'] = True

@app.route("/")
def index():
	return render_template('index.html',)

@app.route("/api/syllablize", methods=['GET', 'POST'])
def syllablize():
	syllablize = {}
	if request.method == 'POST':
		text = request.json.get('text')
	else:
		text = request.args.get('text')
	text = text.strip()
	syllablizer = Syllablizer()
	syllables = syllablizer.syllablize(text);
	return jsonify({'text': text,'syllables': syllables})

@app.route("/api/g2panalyse", methods=['GET', 'POST'])
def g2p_analyse():
	grapheme_analyse = {}
	if request.method == 'POST':
		text = request.json.get('text')
	else:
		text = request.args.get('text')
	text = text.strip()
	g2p = G2P()
	IPAandTags = g2p.analyse(text)
	# IPAandTags[0][0] = <BoS>k<plosive><voiceless><unaspirated><velar>a<schwa><EoS><BoS>l<lateral><other>a<schwa><EoS>
	# result = [{'phonemes': [{'ipa': 'k', 'tags': ['plosive', 'voiceless', 'unaspirated', 'velar']}, {'ipa': 'a', 'tags': ['schwa']}]}, {'phonemes': [{'ipa': 'l', 'tags': ['lateral', 'alveolar']}, {'ipa': 'a', 'tags': ['schwa']}]}]
	result = getPhonemetaglist(IPAandTags[0][0])
	return jsonify({'text': text, 'syllables':result})

@app.route("/api/getipa", methods=['GET', 'POST'])
def getipa():
	getipa = {}
	if request.method == 'POST':
		text = request.json.get('text')
	else:
		text = request.args.get('text')
	ml2ipa = IPA()
	ipa = ml2ipa.analyse(text);
	return jsonify({'text': text, 'IPA':ipa })

@app.route("/api/g2pgenerate", methods=['GET'])
def g2p_generate():
	grapheme_generate = {}
	text = request.args.get('text')
	g2p = G2P()
	graphemes = g2p.generate(text);
	return jsonify(graphemes)

if __name__ == "__main__":
    app.run(debug=True,host='0.0.0.0',port=int(os.environ.get('PORT', 8080)))
