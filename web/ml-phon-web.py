import sys
import os
from flask import Flask, jsonify, render_template, request
import regex

os.chdir(os.path.dirname(os.path.realpath(__file__)))
sys.path.insert(0, '../python')

from fsa import Fsa
app = Flask(__name__)
#app.config['DEBUG'] = True

syllablizer = Fsa('../syllablizer.a')
g2p = Fsa('../g2p.a')
ml2ipa = Fsa('../ml2ipa.a')

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
	syllables = syllablizer.analyse(text);
	syls = regex.findall('<BoS>([ം-ൿ]+)<EoS>', syllables[0][0])
	return jsonify({'text': text,'syllables': syls})

@app.route("/api/g2panalyse", methods=['GET', 'POST'])
def g2p_analyse():
	grapheme_analyse = {}
	if request.method == 'POST':
		text = request.json.get('text')
	else:
		text = request.args.get('text')
	text = text.strip()
	IPAandTags = g2p.analyse(text);
	# IPAandTags[0][0] = <BoS>k<plosive><voiceless><unaspirated><velar>a<schwa><EoS><BoS>l<lateral><other>a<schwa><EoS>
	sylBoundary_paser = regex.compile( r"<BoS>(.+?)<EoS>")
	phoneme_parser = regex.compile( r"((?P<phonemes>([^<])+)(?P<tags>(<[^>]+>)+))+" )
	tag_parser =  regex.compile(r"<([a-z_]+)>+?")
	syllables = sylBoundary_paser.findall(IPAandTags[0][0])
	#syllables = [k<plosive><voiceless><unaspirated><velar>a<schwa>, l<lateral><other>a<schwa>]
	result=[]
	for rindex in range(len(syllables)):
		phonemes = []
		match = phoneme_parser.match(syllables[rindex])
		ipa = match.captures("phonemes")
		tags = match.captures("tags")
		for pindex in range(len(ipa)):
			tagsequence = tag_parser.findall(tags[pindex])
			phonemes.append({'ipa': ipa[pindex], 'tags': tagsequence})
		result.append({'phonemes': phonemes})
	#result = [[{'ipa': 'k', 'tags': ['plosive', 'voiceless', 'unaspirated', 'velar']}, {'ipa': 'a', 'tags': ['schwa']}], [{'ipa': 'l', 'tags': ['lateral', 'other']}, {'ipa': 'a', 'tags': ['schwa']}]]
	return jsonify({'text': text, 'syllables':result})

@app.route("/api/getipa", methods=['GET', 'POST'])
def getipa():
	getipa = {}
	if request.method == 'POST':
		text = request.json.get('text')
	else:
		text = request.args.get('text')
	IPA = ml2ipa.analyse(text);
	return jsonify({'text': text, 'IPA':IPA })

@app.route("/api/g2pgenerate", methods=['GET'])
def g2p_generate():
	grapheme_generate = {}
	text = request.args.get('text')
	graphemes = g2p.generate(text);
	return jsonify(graphemes)

if __name__ == "__main__":
    app.run()
