# ml-g2p
Malayalam grapheme to phoneme converter using finite state transducer

# How to Use

You need SFST to compile and use this generator. The Makefile provided compiles  all the sources and produces the binary FSA 'g2p.a'. Assuming you have fst-compiler-utf8 from SFST in your path, in POSIX systems typing 'make compile' should be enough to get started.

In a debian/ubuntu based GNU/Linux, SFST can be installed as follows
````
  $ sudo apt install sfst
````
Clone or download this git repository to your machine.

Build the FST by
````
  $ make
````
To generate IPA from malayalam script
````
  $ fst-mor g2p.a
  reading transducer...
  finished.
  analyze>
  generate> വരൻ
  <BoW>ʋa<inherentvowel><otherconsonant>ɾa<inherentvowel><otherconsonant>n<chil><EoW>
````
To analyse the IPA and tags for conversion to malayalam script

````
  $ fst-mor g2p.a
  reading transducer...
  finished.
  analyze> <BoW>t͡ʃa<inherentvowel><palatalconsonant>n̪<dentalconsonant><virama>t̪<dentalconsonant>u<vowelsign><EoW>
  ചന്തു

````
