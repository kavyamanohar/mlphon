from setuptools import setup

setup(
    zip_safe=False,
    version=open('VERSION').read().strip(),
    entry_points={
        'console_scripts': [
            'mlg2p = mlphon.g2p:main',
            'mlipa = mlphon.ml2ipa:main',
            'mlsyllablize = mlphon.syllablizer:main'
        ],
    }
)
 
