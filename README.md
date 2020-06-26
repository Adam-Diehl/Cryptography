# Cryptography
A project for making/solving cryptographic puzzles. 

## About
### Project Description
This is a collection of Haskell scripts designed to support hobby cryptography. (There will be little, if any, attempt to make any of the encryption or decryption routines suitable for industrial use.) The core functionality/UX is in the process of being scoped out, and support for different ciphers will expand once these decisions become stable. 

### Version Information
- Version 0.4: Added support for a decryption mode (for the Caesar shift cipher). Refactored accordingly. Changed print to putStrLn to remove extraneous quote marks from console.
- Version 0.3: Added basic unit tests (see **Examples** below). Moved around a few pieces of code for clarity. Cleaned some documentation. 
- Version 0.2: Added the "encryption router" to handle different encryption methods and their various inputs. Simplified (internal) documentation for Caesar shift cypher.
- Version 0.1: Minimally viable product, supports basic Caesar encryption in the (English) Latin alphabet through an interactive CLI.

### Installation
There are two options for installation: 
- Download or clone the repository and compile from source ($ ghc -o Crypto CryptoMain.hs -O2).
- A docker image *of the executable only* is available at https://hub.docker.com/r/adamdiehl/cryptography-v04. Note that you cannot run the tests from the docker image (to keep the image size down by not including GHCI). 
```
docker pull adamdiehl/cryptography-v04
```

## Examples
Note that the basic Caesar shift cipher (with arbitrary shift, so for instance ROT 13 is included) is the only cipher supported at this early stage of development.

### Caeser Shift Cipher (ROT n)
The cipher takes as input the plain text (lowercase, unspaced/"Patristocrat" plain texts are explicitely supported by means of Data.Ord, other inputs used at own risk) and an integer encryption key that denotes the "offset" or "shift." For instance, a key of 3 is the classic Caesar shift cipher, A -> D, B -> E, etc. 

#### Command Line Interface
Encryption:
```
$ ./Crypto
Provide encryption method (string):
Caesar
Choose mode: encrypt/decrypt (string): 
encrypt
Provide the plain text (string): 
attackatdawn
Provide the encryption key (integer): 
3
Cipher text: dwwdfndwgdzq
```

Decryption:
```
Provide encryption method (string):
Caesar
Choose mode: encrypt/decrypt (string): 
decrypt
Provide the cipher text (string): 
dwwdfndwgdzq
Generating possible plaintexts: 
>>> dwwdfndwgdzq
>>> exxegoexhear
... [some results hidden] ...
>>> tmmtvdtmwtpg
>>> zsszbjzsczvm
>>> attackatdawn [our solution was found!]
>>> buubdlbuebxo
>>> cvvcemcvfcyp
```

#### From a configuration file
A configuration file containing the arguments can be piped in through cat (or some other appropriate command line function). For instance, if Config.txt is:
```
Caesar
encrypt
abcdefghijklmnopqrstuvwxyz
3
```

Then the following output is produced:
```
$ cat Config.txt | ./Crypto
Provide encryption method (string):
Choose mode: encrypt/decrypt (string): 
Provide the plain text (string): 
Provide the encryption key (integer): 
Cipher text: defghijklmnopqrstuvwxyzabc
```

### Tests
Tests can be run through GHCI. 
```
Prelude> :l TestingSuite
[1 of 3] Compiling LibCiphers.Caesar ( LibCiphers/Caesar.hs, interpreted )
[2 of 3] Compiling Tests.UnitTests_Ciphers ( Tests/UnitTests_Ciphers.hs, interpreted )
[3 of 3] Compiling Main             ( TestingSuite.hs, interpreted )
Ok, 3 modules loaded.
*Main> runTestTT unitTests
Cases: 2  Tried: 2  Errors: 0  Failures: 0
Counts {cases = 2, tried = 2, errors = 0, failures = 0}
```
