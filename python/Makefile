 
all:
	# Convert the fst to FOMA type and place it in python data folder
	@mkdir -p mlphon/data
	cp ../fst/syllablizer.a mlphon/data/syllablizer.a
	cp ../fst/ml2ipa.a mlphon/data/ml2ipa.a
	cp ../fst/analysis.a mlphon/data/analysis.a

	python3 setup.py sdist
	pip3 install -e .

clean:
	@rm -f mlphon/data/*.a

upload:
	rm -rf dist
	python setup.py sdist
	twine check dist/*
	twine upload --skip-existing dist/*
