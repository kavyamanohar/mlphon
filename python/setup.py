from setuptools import setup

setup(
    zip_safe=False,
    version=open('VERSION').read().strip(),
    entry_points={
        'console_scripts': [
            'mlphoneticanalysis = mlphon.phonetic_analysis:main',
            'mlipa = mlphon.ml2ipa:main',
            'mlsyllablize = mlphon.syllablizer:main'
        ],
    }
)
 
