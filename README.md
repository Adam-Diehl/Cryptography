# Cryptography
A project for making/solving cryptographic puzzles. 

## About
### Description
This is a collection of Haskell scripts designed to support hobby cryptography. (There will be little, if any, attempt to make any of the encryption or decryption routines suitable for industrial use.) The core functionality/UX is in the process of being scoped out, and support for different ciphers will expand once these decisions become stable. 

### Version
- Version 0.2: Added the "encryption router" to handle different encryption methods and their various inputs. Simplified (internal) documentation for Caesar shift cypher.
- Version 0.1: Minimally viable product, supports basic Caesar encryption in the (English) Latin alphabet through an interactive CLI.

### Installation
Download or clone the repository and compile from source.

## Examples
Note that the basic Caesar shift cipher (with arbitrary shift, so for instance ROT 13 is included) is the only cipher supported at this early stage of development.

### Caeser Shift Cipher (ROT n)
The cipher takes as input the plain text (lowercase, unspaced/"Patristocrat" plain texts are explicitely supported by means of Data.Ord, other inputs used at own risk) and an integer encryption key that denotes the "offset" or "shift." For instance, a key of 3 is the classic Caesar shift cipher, A -> D, B -> E, etc. 

#### Command Line Interface
```
$ ./Crypto
>>> "Provide encryption method (string):"
>>> Caesar
>>> "Provide the plain text (string):"
>>> attackatdawn
>>> "Provide the encryption key (integer):"
>>> 3
>>> "Cipher text: dwwdfndwgdzq"
```

#### From a configuration file
A configuration file containing the arguments can be piped in through cat (or some other appropriate command line function). For instance, if Config.txt is:
```
Caesar
abcdefghijklmnopqrstuvwxyz
3
```
Then the following output is produced
```
$ cat Config.txt | ./Crypto
"Provide encryption method (string):"
"Provide the plain text (string):"
"Provide the encryption key (integer):"
"Cipher text: defghijklmnopqrstuvwxyzabc"
```
