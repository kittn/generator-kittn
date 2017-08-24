# Generator-Kittn

[![Build Status](https://travis-ci.org/kittn/generator-kittn.svg?branch=master)](https://travis-ci.org/kittn/generator-kittn) [![bitHound Overall Score](https://www.bithound.io/github/kittn/generator-kittn/badges/score.svg)](https://www.bithound.io/github/gisu/generator-kittn) [![bitHound Dependencies](https://www.bithound.io/github/kittn/generator-kittn/badges/dependencies.svg)](https://www.bithound.io/github/kittn/generator-kittn/master/dependencies/npm)

![kittn-generator](https://cloud.githubusercontent.com/assets/442468/10710315/3347b1d6-7a55-11e5-868e-0fcb9ebed9ad.png)

Yeoman Generator for the Kittn Toolkit. Scaffolds and Prepare the Toolkit for you.

[Documentation](http://kittn.de/). 

**IMPORTANT:** You need Node >= `7.6` for this generator. 

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

## New in 4.1.0
Autoprefixer and Babel now use the browserslist-variable from the package.json.

## New in 5.1.0
If you want to create modules or components, you can use the new file generator. This creates the necessary Sass, JS and Structure Files and assigns them to the respective directories. The Sassfile you then only to the Application.scss connect.
In the root folder of your project, you call up the file generator:

```shell
yo kittn:module
```

## Contentbuilder
To make it easier to work with Craft or Wordpress, we have built contentbuilders. You will get the necessary plugins, CSS, JS and the modules to build the site after the installation.

Further steps in the documentation.

## Dependencies

- Node >= 8
- Gulp 3.9.1
- Yeoman 2.0.0
- Git CLI
- Wget 
- [WP CLI](http://wp-cli.org/de/)
- mysql CLI

## Special Thanks to
- David Hellmann (@davidhellmann) - for his Fluidtype Mixin
- Martin Herweg (@martinherweg) - for his Support with the new generator
- Hugo Giraudel (@HugoGiraudel) - for his awesome Sass Scripts
- Team Sass - Jacket

## Authors
- Sascha Fuchs @gisugosu
- Lars Eichler @cinkon
- Martin Herweg @martinherweg

## Licence
MIT
