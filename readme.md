```
▒█▄░▒█ ▀█▀ ▒█▀▀█ ▒█░▒█ ▀▀█▀▀ 　 ▒█░░▒█ ▒█▀▀█ ▀█▀ ▀▀█▀▀ ▒█▀▀▀ ▒█▀▀█
▒█▒█▒█ ▒█░ ▒█░▄▄ ▒█▀▀█ ░▒█░░ 　 ▒█▒█▒█ ▒█▄▄▀ ▒█░ ░▒█░░ ▒█▀▀▀ ▒█▄▄▀
▒█░░▀█ ▄█▄ ▒█▄▄█ ▒█░▒█ ░▒█░░ 　 ▒█▄▀▄█ ▒█░▒█ ▄█▄ ░▒█░░ ▒█▄▄▄ ▒█░▒█
```
## Table of contents
* [General info](#general-info)
* [Screenshots](#screenshots)
* [Learning Goals/Areas of Focus](#learning-goals/areas-of-focus)
* [Technologies](#technologies)
* [Setup](#setup)
* [Features](#features)
* [Status](#status)
* [Contact](#contact)

## General info
This project is a Ruby implementation of an automated English-Braille
translator, using the command line to open and read a document, converting the
characters and creating a file for the translated output.

_Night writing_ - once a proposed method for soldiers to communicate silently at
 night - was later introduced to blind students including Louis Braille, who
 developed it into the well-known six-dot cell system.

## Screenshots
<add images here>

## Learning Goals/Areas of Focus
* Practice breaking a program into logical components
* Testing components in isolation and in combination
* Applying enumerable techniques in a real context
* Reading text from and writing text to files

## Technologies
Project is created with:
* Ruby version: 2.5.3

## Setup
To run this program, save a copy of this repository locally. In the MacOS
application 'Terminal,' navigate into the _night writer_ directory. Next, place
a text file (.txt) to be translated in the same directory. Then, run it using
ruby (note: '$' is not typed).

1. Clone the repo
   ```
   git clone https://github.com/joemecha/night_writer.git
   ```
2. Change into the directory
   ```
   $ cd ../night_writer.rb
   ```
3. Add your text file.
4. Run _night_writer_ by entering the following into Terminal
   ```
   $ ruby ./lib/night_writer.rb <text file name>.txt <new file name>.txt
   ```
   To convert Braille to English, run _night_reader_ by entering the following into Terminal
      ```
      $ ruby ./lib/night_reader.rb <braille file name>.txt <new file name>.txt
      ```

## Features
List of features ready and TODOs for future development
* __Night Writer__ uses command line ARGV and a File I/O module for external file reading
  and writing
* English messages are translated into Braille characters, which are written to
  an external file.
* Companion class __Night Reader__ reads braille text files and writes the
  English translation to the designated file.
* Input validation:
   - Valid characters are defined by regex: " !',.?abcdefghijklmnopqrstuvwxyzABC
    DEFGHIJKLMNOPQRSTUVWXYZ" _Note: uppercase letters are currently rendered_
    _as lowercase_
   - Program handles invalid characters by returning "▽" using #gsub
* Text wrapping of any line length greater than 80 characters (40 in Braille)

To-do list:
* Project is currently in _"Iteration 4"_ of development
* Fix incorrect output from _night_reader_ when inputing more than 5 lines of
  Braille (15 lines of dots)
* Improve support for numeric characters. Currently can handle English messages
  up to 40 characters that contain numerals

## Status
Project is: _in progress_

## Contact
Created by
* [@joemecha](https://github.com/joemecha)

~ feel free to contact me ~

![Night writing image](/images/knight-rider-barbier-de-la-serr.jpg "Night writing inventor Charles Barbier de la Serre")
