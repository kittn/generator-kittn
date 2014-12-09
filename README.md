# Generator-Kittn

![kittn-generator](https://cloud.githubusercontent.com/assets/442468/5358767/f7f9c01c-7fb7-11e4-9a0c-133327aacbf1.jpg)

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
Default Task with BrowserSync

**`gulp extended`**<br>
Extended Default Task. Additionally watch the image directory.

**`gulp rebuild-js`**<br>
Rebuild all JS files, copy - combine - rename.

**`gulp publish`**<br>
Prepare the Project for Production.

**`gulp jade-rebuild`**<br>
Rebuild all Jade Files.

**`gulp bump`**<br>
Patch the Version Number from `package.json` and `bower.json`

**`gulp bump-minor`**<br>
Extend the Minor Version Number from `package.json` and `bower.json`

**`gulp bump-major`**<br>
Extend to the next Release Number from `package.json` and `bower.json`

**`gulp grunt-rebuild-images`**<br>
Rebuild all Image Files.

**`gulp grunt-responsive-images`**<br>
Build different Sizes from HTML Images

## Dependencies

- Ruby >= 1.9.0
- Node >= 0.10.10
- Sass 3.4.0 rc.1
- Jade 1.3.0
- Gulp 3.8.5
- Git

The Generator will install this Dependencies, when there are not available:

- Bower 1.3.0
- Yeoman 1.2.0
- Grunt 0.4.5

## Special Thanks to

- Hugo Giraudel (@HugoGiraudel) - for his awesome Sass Scripts
- Daniel Guillan (@danielguillan) - Modernizr Mixins
- Team Sass - Jacket
- Sam Richard (@Snugug) - EQ.js


## Licence
(MIT License)

Copyright (c) 2014 Sascha Fuchs

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
