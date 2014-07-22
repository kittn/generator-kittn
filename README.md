![](https://cloud.githubusercontent.com/assets/442468/3564677/85e7f014-0a93-11e4-93b7-95137d7cf008.png)

# generator-kittn

## Introduction

Why you name it 'Kittn'? Simple, the most People loves Kitten, and its time to bring more cuteness in tech industry :D

Kittn is a Toolkit, a collection of several components that will help the developers to work on the frontend. The most based on my own Experience.

The CSS does not offer Part prefabricated elements, like Bootstrap, it gives the developer rather the mixins in hand, to generate elements.

Around the CSS part is a set of Grunt / Gulp task, bringing the eigentiche work is automated. My goal was to minimize errors in the daily Development by rules.

## Dependencies

- Sass 3.4.0.rc1
- Gulp 3.8.0
- Grunt 0.4.5
- Jade 1.3.0
- Yeoman 1.2.0

## Installation

Please install or update your Ruby and Node environment. Optional install Homebrew.

Install the Dependencies - only when you don't have it installed on your Machine.

Install SASS
```bash
gem install sass --pre
```

Install Jade
```bash
npm install -g jade
```

Install Gulp
```bash
npm install -g gulp
```

Install Grunt
```bash
npm install -g grunt-cli
```

Install Yeoman
```bash
npm install -g yeoman
```

Install Bower
```bash
npm install -g bower
```

Install Graphicsmagick
```bash
brew install graphicsmagick
```

Install libpng
```bash
brew install libpng
```

## Using

To install generator-kittn from npm, run:

```bash
$ npm install -g generator-kittn
```

Finally, initiate the generator:

```bash
$ yo kittn
```

After the Installation is finished, its time to initiate the Project.

```bash
gulp init
```

Gulp will start to build JS Files and Copy it from 'src' to the 'dist' directory. Be aware that you work only on the 'src' directory, anything in 'dist' will be produced (it will be overwritten).

Now the begin the Magic

```bash
gulp
```

Dead Simple. Gulp will now activate the watch tasks, a change on Sass, Jade or JS Files will active the Compilers (in the Case of Jade only a JSHint). Also will start a Server, you will see your Changes on the Browser without a manually reload.

You can also activate an extende Watch Task, Gulp will now watch also on Images Changes.

```bash
gulp extended
```

The Image files are 'src/stash/images/css-images/', any change here, the Files will be copied in your 'dist' directory. Any Image-Data (name, widht, height), will be saved in a Imagemap, Sprites will be rerendered. You can use a Sass Mixin to include in a easy way Image Files in your Sass File.

Sass, yes. You work on a '_workfile', don't touch 'style.scss'. Any change on the Workfile flows in the style.scss that compiled to a style.css File. I work on one central File, specific Styles will be routed to different Files - https://github.com/Team-Sass/jacket.

### Image Assets
Put your Image Assets in the 'src/stash/images/' Folder. The PSDs are for Photoshop CC Users, in this case you put all Images on the PSDs and the Photoshop Generator will do the Rest :) (http://blogs.adobe.com/photoshopdotcom/2013/09/introducing-adobe-generator-for-photoshop-cc.html. )

- sprite.psd => Your Images for Sprites
- single.psd => Image Files that not used as textures
- texture.psd => Image Files that used as texture

When the PS Generator have saved the Assets for you, than you can Update you Image Assets

```bash
gulp grunt-imageUpdate
```

In this Case is a Grunt Task. First your Imagefiles in 'dist' will be cleaned, that a new Sprite will be generated, SVG will be minified and build a PNG Fallback. Single and Texture Images will be copied to 'dist', and a new image map is generated.

### JS Files
- need to be finished

### Generate CSS
- need to be finished

### Generate HTML
- need to be finished

### Various Grunt&Gulp Tasks
- need to be finished

---- 

## Getting To Know Yeoman

Yeoman has a heart of gold. He's a person with feelings and opinions, but he's very easy to work with. If you think he's too opinionated, he can be easily convinced.

If you'd like to get to know Yeoman better and meet some of his friends, [Grunt](http://gruntjs.com) and [Bower](http://bower.io), check out the complete [Getting Started Guide](https://github.com/yeoman/yeoman/wiki/Getting-Started).

--- 

## Special Thanks to

- Hugo Giraudel (@HugoGiraudel) - for his awesome Sass Scripts
- Daniel Guillan (@danielguillan) - Modernizr Mixins

## License

MIT
