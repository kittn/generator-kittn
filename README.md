# Generator-Kittn

[![Build Status](https://travis-ci.org/kittn/generator-kittn.svg?branch=master)](https://travis-ci.org/kittn/generator-kittn) [![bitHound Overall Score](https://www.bithound.io/github/kittn/generator-kittn/badges/score.svg)](https://www.bithound.io/github/gisu/generator-kittn) [![bitHound Dependencies](https://www.bithound.io/github/kittn/generator-kittn/badges/dependencies.svg)](https://www.bithound.io/github/kittn/generator-kittn/master/dependencies/npm)

![kittn-generator](https://cloud.githubusercontent.com/assets/442468/10710315/3347b1d6-7a55-11e5-868e-0fcb9ebed9ad.png)

Yeoman Generator for the Kittn Toolkit. Scaffolds and Prepare the Toolkit for you.

[Documentation](http://kittn.de/). 

## Install

```bash
$ npm install -g generator-kittn
```

## Optional 
You can use now Yarn with Kittn, instead off NPM. https://yarnpkg.com/


## Usage
Jump in your Working Directory and type: 

```bash
yo kittn
```

The Generator will ask you some questions, at the end it will prepare the Project. 

## Commands

_With Webpack you have to use NPM Script Commands_

**`npm run init`**<br>
Intialize your Project and the Sass Documentation (/sassdocs/)

**`npm run dev`**<br>
Main development task with BrowserSync and Webpack

**`npm run devdashboard`**<br>
Main development task with Webpack Dashboard - More NASA Style :D

**`npm run build`**<br>
Minify JS, Images, CSS. Is for a automated Build Process, comes after a Gulp Init.

**`npm run scripts`**<br>
Rebuild all JS Files except the Application JS File

**`npm run uiimages`**<br>
Rebuild all Image Files for CSS, copy it to distribution, build Bitmap- and Vector Sprites.

**`npm run htmlassets`**<br>
Copy all Imagefiles for Documentusage.

**`npm run template`**<br>
Copy all or Generate the Template Files.

**`npm run favicon`**<br>
Generate Favicons and the HTML Snippet (generated Files you will find in `src/.system/`)

## Starterpacks
To make it easier for you to work with Craft or Wordpress, we have also integrated Starterpacks. With the Starterpack you get a Contentbuilder (in the case of Wordpress you still need ACF 5 Pro) and the necessary templates, plugins (free), SCSS and JS files you need.

There is a rudimentary styling, not pretty but functional, as you will usually begin to adapt the existing elements to your project.

In order to activate the Starterpack, you have to decide for a `Wordpress` or `Craft` project and decide on the CSS methodology for `ITCSS`. Then you can install the Starterpack.

Further steps in the documentation.

## Dependencies

- Node >= 6.x
- Gulp 3.9.1
- Yeoman 1.4.8
- Git CLI
- Wget 
- WP CLI

## Optional Dependencies
- Bower 1.4.0

## Special Thanks to
- David Hellmann (@davidhellmann) - for his Fluidtype Mixin
- Hugo Giraudel (@HugoGiraudel) - for his awesome Sass Scripts
- Team Sass - Jacket
- LukyVj (@LukyVj) - for Family.scss

## Authors
- Sascha Fuchs @gisugosu
- Lars Eichler @cinkon
- Martin Herweg @martinherweg

## Licence
MIT
