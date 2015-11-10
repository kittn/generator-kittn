# Generator-Kittn

![kittn-generator](https://cloud.githubusercontent.com/assets/442468/10710315/3347b1d6-7a55-11e5-868e-0fcb9ebed9ad.png)

Yeoman Generator for the Kittn Toolkit. Scaffolds and Prepare the Toolkit for you.

[Documentation](http://gisu.github.io/generator-kittn/). 

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

**`gulp rebuild:js`**<br>
Rebuild all JS files, copy - combine - rename.

**`gulp rebuild:images`**<br>
Rebuild all Image Files, copy it to distribution, build Bitmap- and Vector Sprites.

**`gulp copy:bitmaps`**<br>
Move Image Files from src/stash/images/bitmap-assets to distribution

**`gulp copy:vectors`**<br>
Move Image Files from scr/stash/images/svgsingle to distribution

**`gulp deploy:manual`**<br>
Publish the Project for Production - you can Bump the Version with Enviroment Vars.<br>Example $ gulp publish --type=major => for a Major Release

**`gulp deploy:auto`**<br>
Minify JS, Images, CSS. Is for a automated Build Process, comes after a Gulp Init.

## Dependencies

- Node >= 4.4.x
- Gulp 3.9.0
- Bower 1.4.0
- Yeoman 1.4.8

## Optional Dependencies
- Ruby >= 1.9.0
- Ruby-Sass 3.4.18 

## Special Thanks to

- Hugo Giraudel (@HugoGiraudel) - for his awesome Sass Scripts
- Team Sass - Jacket

## Author
Sascha Fuchs @gisugosu

## Licence
MIT
