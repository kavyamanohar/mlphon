import sys
import os
from flask import Flask, jsonify, render_template, request

os.chdir(os.path.dirname(os.path.realpath(__file__)))
sys.path.insert(0, '../python')

from fsa import Fsa
app = Flask(__name__)
app.config['DEBUG'] = True

ipa = Fsa('../IPAGenerator.a')
g2p = Fsa('../PhoneAnalyser.a')

@app.route("/")
def index():
	return render_template('index.html',)

@app.route("/IPA", methods=['GET'])
def generate():
	generate_ipa = {}
	text = request.args.get('text')
	ipagen = ipa.generate(text);
	return jsonify(ipagen)

@app.route("/g2pgenerate", methods=['GET'])
def g2p_generate():
	generate_ipaandtags = {}
	text = request.args.get('text')
	IPAandTags = g2p.generate(text);
	return jsonify(IPAandTags)

@app.route("/g2panalyse", methods=['GET'])
def g2p_analyse():
	analyse_ipaandtags = {}
	text = request.args.get('text')
	graphemes = g2p.analyse(text);
	return jsonify(graphemes)

if __name__ == "__main__":
    app.run()
