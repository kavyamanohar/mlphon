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
	print(syllables)
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
	return jsonify({'text': text, 'IPAandTags':IPAandTags })

@app.route("/api/g2pgenerate", methods=['GET'])
def g2p_generate():
	grapheme_generate = {}
	text = request.args.get('text')
	graphemes = g2p.generate(text);
	return jsonify(graphemes)

if __name__ == "__main__":
    app.run()
