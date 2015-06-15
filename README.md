# Generator-Kittn

![kittn-generator](https://cloud.githubusercontent.com/assets/442468/8157040/9e662dd2-1351-11e5-999d-50ce79792d14.png)

Yeoman Generator for the Kittn Toolkit. Scaffolds and Prepare the Toolkit for you.

[Documentation](http://kittn.de). 

## Install

```bash
$ npm install -g generator-kittn
```

## Usage
Jump in your Working Directory and type: 

```bash
yo kittn
```

The Generator will ask you some questions, at the end it will prepare the Project. 

## Commands

**`gulp init`**<br>
Intialize your Project

**`gulp`**<br>
Default Task with BrowserSync (CSS and HTML Injection)

**`gulp publish`**<br>
Publish the Project for Production - you can Bump the Version with Enviroment Vars. Like $ gulp publish --type=major => for a Major Release

**`gulp rebuild-js`**<br>
Rebuild all JS files, copy - combine - rename.

**`gulp rebuild-jade`**<br>
Rebuild all Jade Files.

**`gulp rebuild-images`**<br>
Rebuild all Image Files, copy it to distribution, build Bitmap- and Vector Sprites.

**`gulp move-image`**<br>
Move Image Files from src/stash/images/bitmap-assets and scr/stash/images/svgsingle to distribution

## Dependencies

- Ruby >= 1.9.0
- Node >= 0.10.0
- Sass 3.4.0
- Jade 1.3.0
- Gulp 3.8.11
- Git

The Generator will install this Dependencies, when there are not available:

- Bower >= 1.4.0
- Yeoman 1.2.0

## Special Thanks to

- Hugo Giraudel (@HugoGiraudel) - for his awesome Sass Scripts
- Daniel Guillan (@danielguillan) - Modernizr Mixins
- Team Sass - Jacket

## Author
Sascha Fuchs @gisugosu

## Licence
(MIT License)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
