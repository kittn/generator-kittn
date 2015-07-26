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

**`gulp deploy:manual`**<br>
Publish the Project for Production - you can Bump the Version with Enviroment Vars.<br>Example $ gulp publish --type=major => for a Major Release

**`gulp deploy:auto`**<br>
Minify JS, Images, CSS. Is for a automated Build Process, comes after a Gulp Init.

**`gulp rebuild:js`**<br>
Rebuild all JS files, copy - combine - rename.

**`gulp rebuild:images`**<br>
Rebuild all Image Files, copy it to distribution, build Bitmap- and Vector Sprites.

**`gulp copy:bitmaps`**<br>
Move Image Files from src/stash/images/bitmap-assets to distribution

**`gulp copy:vectors`**<br>
Move Image Files from scr/stash/images/svgsingle to distribution

## Dependencies

- Node >= 0.10.0
- Gulp 3.9.0
- Bower 1.4.0
- Yeoman 1.4.0

## Optional Dependencies
- Ruby >= 1.9.0
- Sass 3.4.0

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
MIT
