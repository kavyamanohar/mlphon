 
all:
	# Convert the fst to FOMA type and place it in python data folder
	@mkdir -p mlphon/data
	hfst-fst2fst -F ../syllablizer.a > mlphon/data/syllablizer.a
	hfst-fst2fst -F ../ml2ipa.a > mlphon/data/ml2ipa.a
	hfst-fst2fst -F ../g2p.a > mlphon/data/g2p.a

	python3 setup.py sdist
	pip3 install -e .

clean:
	@rm -f mlphon/data/*.a

upload:
	rm -rf dist
	python setup.py sdist
	twine upload --skip-existing --sign dist/*
