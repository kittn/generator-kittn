# Generator-Kittn

![kittn-generator](https://cloud.githubusercontent.com/assets/442468/10710315/3347b1d6-7a55-11e5-868e-0fcb9ebed9ad.png)

[![bitHound Overall Score](https://www.bithound.io/github/gisu/generator-kittn/badges/score.svg)](https://www.bithound.io/github/gisu/generator-kittn)[![bitHound Dependencies](https://www.bithound.io/github/gisu/generator-kittn/badges/dependencies.svg)](https://www.bithound.io/github/gisu/generator-kittn/master/dependencies/npm)

Yeoman Generator for the Kittn Toolkit. Scaffolds and Prepare the Toolkit for you.

[Documentation](http://kittn.de/). 

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

_With 3.10.0 i added NPM Script Shorthands_

**`npm run init`**<br>
Intialize your Project and the Sass Documentation (/sassdocs/)

**`npm run server`**<br>
Default Task with BrowserSync

**`npm run js`**<br>
Rebuild all JS files, copy - combine - rename.

**`npm run inlineimages`**<br>
Rebuild all Image Files for CSS, copy it to distribution, build Bitmap- and Vector Sprites.

**`npm run contentimages`**<br>
Rebuild all Image Files for HTML, copy it to distribution, build Bitmap- and Vector Sprites.

**`gulp copy:bitmaps`**<br>
Move Image Files from src/stash/images/bitmap-assets to distribution

**`gulp copy:vectors`**<br>
Move Image Files from scr/stash/images/svgsingle to distribution

**`npm run publish`**<br>
Publish the Project for Production - you can Bump the Version with Enviroment Vars.
Example: `$ gulp publish --type=major` => for a Major Release

**`npm run deploy`**<br>
Minify JS, Images, CSS. Is for a automated Build Process, comes after a Gulp Init.

## Dependencies

- Node >= 4.2.x
- Gulp 3.9.0
- Yeoman 1.4.8

## Optional Dependencies
- Ruby >= 1.9.0
- Ruby-Sass 3.4.18 
- Bower 1.4.0

## Special Thanks to

- Hugo Giraudel (@HugoGiraudel) - for his awesome Sass Scripts
- Team Sass - Jacket

## Author
Sascha Fuchs @gisugosu

## Licence
MIT
