![](http://i.imgur.com/2MtKGwj.jpg)

## Einleitung

„Kittn“ ist ein Toolkit das vorwiegend beim Aufbau von Frontends unterstützen soll. Wer nach einer bunten Mischung aus vorgefertigten Elementen sucht, so wie man es von Bootstrap und Co gewohnt ist, wird mit Kittn nicht glücklich werden. Hier werden vielmehr die Methoden angeboten um solche Elemente auf einem einfachen Weg zu Bilden und zu erweitern.

Um den CSS Part herum, sind noch viele Automatismen eingebaut die dem Developer ebenfalls helfen, sei es um Image Assets zu generieren und zu verteilen, HTML Mockups aufzubauen, die Code Qualität zu kontrollieren, Sprites zu bilden, Fallbacks für SVG Dateien zu generieren. Darum vermeide ich auch den Begriff Framework.

Angst vor dem Terminal sollte man nicht haben :p

## Abhängigkeiten
Um mit Kittn arbeiten zu können müssen einige Extensions und Environments installiert werden. Wer diese Tools schon installiert hat, der kann den Schritt überspringen.

###Environments

> Getestet wurde das Toolkit bislang auf Mac Systemen! Auf Windows Systemen kann es zu Problemen kommen.

- Ruby >= 1.9.0
- Node >= 0.10.10

Auf Mac Systemen ist Ruby schon installiert, hier würde der Schritt enfallen - wer mag kann hier aber auf Ruby 2.12 Updaten.
Um Ruby auf Windows Systemen zu installieren, empfiehlt sich der [One Click Installer](http://rubyinstaller.org/downloads/).

> Ruby wird nur für Sass benötigt, sobald `Libsass` 100% Produktiv verwendbar ist, wird diese Abhängigkeit entfallen.

Node kann auf Mac Systemen entweder über [Brew](http://brew.sh) installiert werden oder man verwendet den [Installer](http://nodejs.org/), gilt dann für beide Systeme.


###Extensions & Compiler

- Sass 3.4.0 rc.1
- Jade 1.3.0
- Gulp 3.8.5
- Grunt 0.4.5
- Bower 1.3.0
- Yeoman 1.2.0
- Git

Der Generator installiert selbstständig Grunt, Bower und auch Yeoman.

####Sass
Hier muss die aktuelle Version 3.4.0 RC1 installiert werden, da das Framework gebrauch vom Scripted Ampersand macht.

```bash
gem install sass --pre
```

####Jade
Nach dem ersten `gulp init` werden damit die ersten HTML Dateien mittels Jade kompiliert. Im weiteren Verlauf kann man sich selbst entscheiden ob man natives HTML schreibt oder weiter mit Jade arbeiten will.

```bash
npm install -g jade
```

####Gulp
Sämtliche Tasks - auch Grunt Tasks - werden über Gulp aktiviert.

```bash
npm install -g gulp
```

####Git
Wer Git noch nicht installiert hat sollte dies bitte jetzt nachholen, da `Bower` direkt auf Github zugreift. [Download](http://git-scm.com/download)

---

## Install Kittn
Wenn die Dependencies installiert sind, folgt die Installation des Generators.

```bash
npm install -g generator-kittn
```

Der Generator wird dabei automatisch Yeoman, Grunt und Bower installieren, wenn diese noch nicht installiert waren. Kittn liegt jetzt aber nur als global installiertes Paket vor.

Um Kittn zu verwenden, erstellt man sich ein Projekt Verzeichnis und aktiviert den Generator:

```bash
yo kittn
```

Der Generator wird jetzt eine Reihe von Fragen stellen, mit denen die `package.json` und die `bower.json` vor konfiguriert werden.

![](http://i.imgur.com/6h8SwsC.gif)

Von stärkerer Bedeutung sind die letzten drei Fragen:

**CSS Filename** : Bestimmt den allgemeinen Dateinamen der CSS Datei.

**Do you need IE8 compatibility?** : Wird diese Frage mit 'Y' beantwortet, werden zwei CSS Files generiert, in den HTML Dateien ist der Aufruf der zwei Dateien dann auch vorhanden (ansonsten wird nur ein CSS File aufgerufen).

**Do you want to use Jade as HTML Compiler?** : Wird diese Frage mit 'Y' beantwortet läuft der Jade Compiler permanent mit. Bei 'n' wird Jade nur für die erste Kompilierung der HTML Files genutzt und dann abgeschaltet.

Nach Beantwortung der letzten Frage, wird Yeoman sämtliche Projektbezogenen Dependencies über `NPM` und `Bower` herunterladen.

---

## Free the kittn
Nach dem die Installation abgeschlossen ist, wird das Projekt **initialisiert**.

```
gulp init
```

Beim Initialisieren werden unterschiedliche Dateien aus dem `src` Verzeichnis in das Verteilerverzeichnis `dist` kopiert. Zusätzlich werden JS Files kombiniert, Bilddaten werden verteilt, HTML und CSS wird Kompiliert.

> Wichtig zum Verständnis. Gearbeitet wird Grundsätzlich im `src` Verzeichnis. Dort werden alle Quelldaten abgelegt, die dann über Gulp Task weiter verarbeitet werden.

Um jetzt mit der Arbeit zu beginnen aktiviert man den Default Task

```bash
gulp
```

Gulp wird den Server aktivieren, der einem in Echtzeit die Preview auf den Browser liefert - der Browser wird bei einer Änderung automatisch refreshed. Innerhalb des `src` Verzeichnisses werden JS, Jade und Sass Files überwacht, bei einer Änderung wird der Compiler aktiv - im Falle von Javascript wird JSHint die Codequality überwachen.

> Ich verwende bewusst kein Coffeescript, weil es gerade in der Teamarbeit zu Verwirrungen geführt hat. Wer dennoch Coffeescript verwenden will, muss sich nur das entsprechende Plugin installieren.

Wer die Überwachung noch auf Bilddaten ausweiten möchte, kann den erweiterten Default Task verwenden.

```bash
gulp extended
```

Folgende Verzeichnisse werden dann mit überwacht:

- `src/stash/images/css-images/svg/`
- `src/stash/images/css-images/svgonly/`
- `src/stash/images/css-images/single-assets/`
- `src/stash/images/css-images/texture-assets/`
- `src/stash/images/css-images/sprite-assets/`

Eine Modifikation der Dateien, ebenso wie Löschen oder Hinzufügen wird auch hier Task aktivieren, z.B. wird aus SVG Dateien automatisch ein PNG Fallback generiert.

### Tasks

#### `gulp init`
Für das erste Initialisieren des Projekts.

#### `gulp`
Default Task

#### `gulp extended`
Erweiterter Default Task - überwacht Bilddaten

#### `gulp rebuild-js`
Sämtliche Javascript Dateien werden neu generiert

#### `gulp publish`
Die Projektdaten werden für die Produktion vorbereitet. CSS, JS und Bilddaten werden Komprimiert. Die Dokumenation wird generiert.

#### `gulp jade-rebuild`
Sämtliche Jade Dateien werden auf einen Rutsch neu kompiliert.

#### `gulp bump`
Die Versionsnummer wird gepatcht (0.0.1)

#### `gulp bump-minor`
Die Versionsnummer wird um ein Minor Update erweitert (0.1.0)

#### `gulp bump-major`
Die Versionnummer wird um eine Release Nummer erweitert (1.0.0)

#### `gulp grunt-rebuild-images`
Bilddaten wie `single`, `textures`, `svg` und `sprites` werden aus dem `dist` Verzeichnis gelöscht und neu Integriert.

#### `gulp grunt-responsive-images`
Bilder die per HTML eingebunden werden, können damit in mehreren Größen generiert werden.

---

## Folder Build
Wie schon erklärt wird man in der Regel immer in `src` arbeiten, das `dist` Verzeichnis spiegelt mehr das Endprodukt dar.

`root`<br>
`.. dist/` Verteiler<br>
`.. src/` Quelldateien

Der innere Aufbau des `dist/` Verzeichnisses sieht wie folgt aus:

`dist/`<br>
`.. assets/`<br>
`.... css/` Fertige CSS dateien<br>
`...... system/` Systembilder wie favicons<br>
`...... single/` Einzel eingebunde Bilder<br>
`...... textures/` Texturen<br>
`.... img/` Per CSS eingebunde Bilder<br>
`.... js/` Javascripte<br>
`.... fonts/` Webfonts & Iconfonts<br>
`.. images/` per html eingebunde Bilder

Falls man damit nicht zufrieden sein sollte, kann man die Struktur über die `package.json` ändern:

![](http://i.imgur.com/NfKvIcv.png)

Das sollte natürlich vor dem `gulp init` passieren, ansonsten muss man die Verzeichnisse manuell umbenennen, oder man löscht `dist` einfach und startet dann den `init`.

Die innere Struktur des `src/` Verzeichnis.

`src/` <br>
`.. jade/` Jade Dateien<br>
`.. js/` Javascript Files<br>
`.. markdown/` Externe Texte im Markdown Format<br>
`.. sass/` Sass Framework<br>
`.. stash/` Ablage<br>
`.... .sytem/` Interne System Daten<br>
`.... bower/` Bower Dependencies<br>
`.... fonts/` Font Files<br>
`.... images/` Image Quellen<br>
`...... css-images/` CSS eingebunde Bilder<br>
`........ single-assets/` Platz für die einzelnen Single Assets<br>
`........ sprite-assets/` Ordner für alle sprite Images<br>
`........ svg-assets/` SVG Images die mit PNG Fallback generiert werden<br>
`........ svgonly-assets/` SVG Images ohne Fallback<br>
`........ texture-assets/` Ordner für die einzelen Texturen<br>
`...... html-images/`<br>
`........ html-assets/` HTML eingebunde Bilder<br>
`.... scripts/` Scriptfiles die nicht über Bower installiert werden<br>

---

## Image Handling
Die Verzeichnisstruktur ist besonders wichtig für die Aufbereitung und Weiterverarbeitung der Bilddaten.

Im Verzeichnis `src/stash/images/css-images/` findet neben den Unterordnern für `svg` und `svgonly` noch drei PSD Dateien. Diese eigenen sich aber erst für Nutzer die schon mit Photoshop CC oder Photoshop CC2014 arbeiten, da hier erst der [Generator](http://blogs.adobe.com/photoshopdotcom/2013/09/introducing-adobe-generator-for-photoshop-cc.html) zur Verfügung steht.

![Generator in Action](http://i.imgur.com/WQo9hGf.gif)

- `src/stash/images/css-images/sprite.psd` Asset File für alle Sprite Images (retina & nonRetina)
- `src/stash/images/css-images/single.psd` Asset File für alle Single Images
- `src/stash/images/css-images/texture.psd` Asset File für alle Texture Images
- `src/stash/images/html-images/html.psd` Asset File für HTML Images

Bei Sprites bitte beachten das der Dateinamen der Retina Sprites immer mit `@2x` endet, bei NonRetina Sprites entfällt das Postfix.

![Ablaufbeispiel mit Sprite](http://i.imgur.com/lMSzjU6.jpg)

Die PSDs sind alle schon mit dem Generator verbunden. Sobald man Ebene/Gruppen gemäß der Generator Syntax beschriftet und speichert, werden die Assets in den jeweiligen Ordnern (mit der Endung `assets`) abgespeichert.

![Generator Syntax Schema](http://i.imgur.com/8J36h63.jpg)

Die Arbeit mit dem Generator ist optional, wenn einem die Arbeit zu umständlich sein sollte, der kann seine Assets auch wie er es gewohnt ist generieren. Wichtig ist nur, das gilt ebenfalls für Nutzer ohne Photoshop CC, das die Bilddateien immer in den entsprechenden Verzeichnissen landen.

> Es ist sehr wichtig darauf zu achten das die PSDs nicht über 100 MB groß werden, daher sollte noch vor dem Commit die Filesize kontrolliert werden. Github reagiert beim Push sehr 'allergisch' auf Dateien über 100 MB, was oft zum Abbruch führt.

---

## Build HTML with Jade
[Jade](http://jade-lang.com/) ist ein HTML Kompilier, der Prinzipiell für die erste Generierung der HTML Dateien verwendet wird, danach steht es dem Entwickler frei selbst zu entscheiden ob er Jade weiter verwenden möchte. Z.B. wer direkt mit Wordpress arbeitet der wird kein Jade benötigen.

Die Jade Files findet man ebenfalls unter `src/`:

`src/` <br>
`.. jade/` Jade Dateien<br>
`.... components/` Jade Componenten<br>
`.... mixins/` unterschiedliche Mixins<br>
`.... templatepart/` Template Segmente, z.B. den Header<br>
`.... templates/` unterschiedliche Template Typen<br>

> Das ganze stellt ehr eine art Boilerplate dar, es bleibt jedem selbst überlassen wie stark er seinen Jade Code segmentieren möchte.

---

## Working with JS Files

### Internal Files
Interne JS Files werden im Verzeichnis `src/js/` abgespeichert, dort wird man die `app.js` Datei entdecken - regulär kann man davon ausgehen das eine Datei ausreicht.

> Die `app.js` wird im HTML immer am Ende geladen.

Sobald der Default Gulp Task aktiv ist, werden alle Dateien in `scr/js/` überwacht, bei einer Änderungen durchlaufen diese einen JSHint Test und werden in `dist/assets/js/` abgespeichert (mit dem gleichen Dateinamen).

### External Files
Kommen wir zu den externen Scriptfiles, diese kann man entweder über [Bower](http://bower.io/) in das Packet laden, falls sie dort nicht gefunden werden, kann man diese über den `scripts` Folder integrieren.

Möchte man z.B. ein zusätzliches Script hinzufügen, wird man als erstes danach suchen - manchmal sind die Pakete unter anderem Namen gespeichert.

```bash
bower search package-name
```

Hat man das entsprechende Packet gefunden, installiert es mittels:

```bash
bower install package-name --save
```

Das entsprechende Paket wird in `src/stash/bower/` installiert und zusätzlich in der `bower.json` notiert. Möchte man ein installiertes Package wieder deinstallieren:

```bash
bower uninstall package-name --save
```

> Der Inhalte des `bower` Folders wird nicht in das externe Git Repo übertragen. Developer die am Projekt mitarbeiten, werden sich die Bower Dependencies über `bower install` herunterladen. Daher ist es wichtig jedes Dependency in der `bower.json` zu notieren.

Natürlich kann es vorkommen das man bestimmte Packages nicht über Bower findet, man kann diese dann entweder selbst registrieren:

```bash
bower register https://url.zum.git.repo package-name
```

Oder man lädt das Packet in `src/stash/scripts/` wo es zur weiteren Verwendung zur Verfügung steht.

Um die JS Dateien zu verwenden, müssen sie erst mit `Gulp` weiterverarbeitet werden. JS Files werden dann entweder in das JS Verzeichnis `dist/assets/js/` kopiert oder sie werden kombiniert und in das JS Verzeichnis kopiert.

Im `gulpfile.js` findet man folgenden Block:

![JS Config im Gulpfile](http://i.imgur.com/OVTiI2k.png)

Alles was unter `copyjs` gelistet wurde, wird einfach nur kopiert, `combinejs` kennzeichnet die Dateien die kombiniert werden. Um den Prozess zu aktivieren:

```bash
gulp rebuild-js
```

> Kombinierte JS Files werden unter dem Filenamen `scripts.js` abgespeichert.

---

## Sass Framework
Das Herzstück des Toolkits besteht aus dem [Sass](http://sass-lang.com) Framework, das Toolkit wurde mehr außen herum gebaut um die fehlenden Funktionen zu ersetzten.

### Structure

Im Verzeichnis `src/sass/` befindet sich der Framework:

`sass/`<br>
`.. framework/` Framework Mixins und Funktionen<br>
`.... helper/` Hilfsfunktionen die als erstes includiert werden müssen<br>
`.... modules/` Mixin, Funktionen, Generatoren<br>
`.... partials/` Vordefinierte Snippets<br>
`.. maps/` Erweiterte Daten Maps<br>
`.. styles/` Möglicher Platz für eigene Partials<br>
`.. _loader.scss` Lädt die einzelnen Dateien (die Reihenfolge ist vorbestimmt)<br>
`.. _setup.scss` Hier befindet sich die gesamte Konfiguration<br>
`.. _workfile.scss` Die Arbeitsdatei<br>
`.. style.scss` Ausgabe<br>
`.. style-ie8.scss` Ausgabe IE8<br>


> Der Name für die Dateien `style.scss` kann abweichen, wenn man beim aktivieren des Toolkits einen anderen Namen vorgegeben hat, ebenso kann es sein das es keine `xxxx-i8.scss` Datei vorhanden ist, wenn die IE8 Kompatibilität abgeschaltet wurde.

---

### Workfile

![](http://i.imgur.com/JSwYDZv.jpg)

Gearbeitet wird immer mit `_workfile.scss` Datei und der Inhalt dieser Datei wird in die jeweilige `style.scss` importiert und über den Compiler zu einem CSS File gewandelt. Öffenen wir einfach mal eine der `style.scss` Dateien:

![](http://i.imgur.com/smb2mSe.png)

Diese Datei wird den Inhalt von `_workfile` importieren, dabei aber bestimmte Inhalte heraus filtern. Z.B. Inhalte die mit der Variable `old` markiert sind, fließen hier nicht mit ein.

Mittels [Jacket](https://github.com/Team-Sass/jacket) kann der Developer an einer Datei arbeiten, spezifische Styles auf unterschiedliche Files routen.

> In Kittn arbeitet man prinzipiell mit zwei Jacket Variablen. `old` markiert Inhalte die in IE8 Stylesheets wandern und `modern` ist nur für Moderne Browser bestimmt. Wer möchte kann das natürlich noch erweitern.

---

### Loader
```
src/sass/_loader.scss
```

Mit der `_loader.scss` Datei werden alle Dateien geladen, die benötigt werden. Die Reihenfolge ist dabei schon fest vorgegeben. Sollte auch nicht mehr geändert werden.

---

### Setup

```
src/sass/_setup.scss
```

Fast alle Einstellungen lassen sich über `_setup.scss` verändern und erweitern. Arbeiten wir uns einmal durch.

`$kittn-global-spacing` Global spacing unit, used for Spacer and Lines Mixins.<br>
`$kittn-default-unit` Default unit for unitless values. Default `px`<br>
`$kittn-bem` BEM Prefixes for Elements and Modifiers<br>
`$kittn-directorys` Kittn Directory Organisation - when you change the structure from `dist/` you need to change here also.<br>
`$kittn-activate` Activate Base Features<br>
`$kittn-sprite` Sprite Configuration<br>
`$kittn-iconfont` Iconfont Configuration<br>
`$kittn-breakpoint-map` Map off all Breakpoints and Behaviors<br>
`$kittn-fontface-map` Load and integrate all FontFaces<br>
`$kittn-typo` Base Typo Setup<br>
`$kittn-active-responsive-fonts` Activates the Responsive Fontsize Generator<br>
`$kittn-typo-margin` Default Margin for Typographic Elements<br>
`$kittn-typo-style` Base Typo and Font Styling<br>
`$kittn-typo-sizes` Base Typo Sizes<br>
`$kittn-global-heading` Global Heading Stylings<br>
`$kittn-typostyles-map` All possible Typostyles in a Map<br>
`$kittn-generate-typostyles` Generate all Fontstyles with classes<br>
`$kittn-color-map` Color Definition Map. This is a collection from all used Colors.<br>
`$kittn-color-generator` Generate the Color Classes from the Color Array<br>
`$kittn-color-route` Route the Colors to the Elements<br>
`$kittn-hairline` Hairline Styling<br>
`$kittn-tables` Table Styling

---

### Maps
Zu der `_setup.scss` Datei kommen noch weitere Map Files.

#### Fontstacks
`src/sass/maps/_fontstacks.scss`

Fonts die über die Font-Family Mixins eingefügt werden, können auf die Fontstacks zugreifen. In der Map sind die gängisten Kombinationen enthalten.

#### Iconmap
`src/sass/maps/_iconfontlist.scss`

Alle Icons einer Iconfont werden in diese Map eingetragen - über die Iconfont Mixins werden daraus dann wieder Klassen generiert.

> Wer seine Iconfonts mit Icomoon erstellt, wird eine CSS Datei geliefert bekommen. Mit etwas Find&Replace kann man diese CSS Datei leicht in eine Map zurück wandeln.

```scss
$kittn-font-icons: (
  news: '\e609',
  works: '\e60a'
);
```

#### Imagemaps
`src/sass/maps/_imagemap.scss`<br>
`src/sass/maps/_sprite.scss`<br>
`src/sass/maps/_sprite-retina.scss`


Diese Maps werden über die `Grunt` Tasks automatisch erstellt. Dort werden Daten notiert wie die Bild Dimensionen, Dateinamen, bei Sprites wird die Position auf der Map gespeichert.

Über die Image Mixins wird auf diese Maps zugegriffen.

#### Connectmap
`src/sass/maps/_connectmap.scss`

In die Connectmap können repeatable Styles eingetragen werden. Die Map wird dann über Mixins eingelesen womit dann Silent Placeholder generiert werden. Diese können dann mit `@extend` verbunden werden, alternativ kann man den Inhalt auch direkt importiert werden.

```scss
$kittn-connect-map: (
  button: (
    height: 30px,
    width: 100%,
    text-align: center
  )
);
```

#### ZMap
`src/sass/maps/_zmap.scss`

Die unterschiedlichen Z-Indexes werden auf der Map notiert.

```scss
$kittn-zlayer-map: (
  'default': 10
);
```
---

### Helper

#### BEM
`scr/sass/framework/helper/_bem.scss`<br>
_@requires `$kittn-bem`_

Diese BEM Mixins verwenden die in `$kittn-bem` eingestellten Prefixes. Ob man diese Mixins verwendet oder nativ seine Selektoren schreiben, bleibt dem Developer überlassen.

(m) **Element**<br>
Build a BEM Element

_@param  {string}  $name - Selector name_

```scss
// Example
.box {
  @include element(element) {
    content: 'the Element';
  }
}

// Result
.box__element {
  content: 'the Element';
}
```

(m) **Modifier**<br>
Build a BEM Modifier, with extend functionality

_@param  {*}      $name           - The selector name<br>
@param  {bool}   $extend (false) - If the Modifier need to be extended with parent_

```scss
// Example
.box {
  height: 50px;
  width: 30px;
  @include modifier(round) {
    border-radius: 10px;
  }
}

.other-box {
  height: 50px;
  width: 30px;
  @include modifier(round, true) { // Extend active
    border-radius: 10px;
  }
}

// Result
.box {
  height: 50px;
  width: 30px;
}
.box--round {
  border-radius: 10px;
}

.other-box, .other-box--round {
  height: 50px;
  width: 30px;
}
.other-box--round {
  border-radius: 10px;
}
```

(m) **Chainroot**<br>
Setup the Root Element for the following chained Modifers


```scss
// Example
.test {
  @include chainroot {
    content: hello;
  }
}

// Result
.test, [class^="test"] {
  content: hello;
}
```

(m) **Chain**<br>
Chain the Modifiers

_@param  {string} $name - Selector name, only the name_

```scss
// Example
.test {
  @include chainroot {
    font-size: 20px;
    line-height: 24px;
  }
  @include chain(wide) {
    width: 200px;
  }
  @include chain(height) {
    height: 100px;
  }
}

// Result
.test, [class^="test"] {
  font-size: 20px;
  line-height: 24px;
}
[class^="test"][class*="--wide"] {
  width: 200px;
}
[class^="test"][class*="--height"] {
  height: 100px;
}

// Usage
<div class="test">...</div>
<div class="test--wide">...</div>
<div class="test--height--wide">...</div>
```

#### Connect
`scr/sass/framework/helper/_connect.scss`<br>
_@requires `$kittn-connect-map`_

Über die Connect Mixins ist es möglich Styles vorzudefienieren und diese Styles dann entweder mittels `@extend` zu verbinden oder den Style direkt in den Selektor zu laden (z.B. wenn man sich in einem MQ aufhält).

Wenn in der `$kittn-connect-map` Map Styles definiert wurden, werden Silent Selectors generiert.

(m) **Connect-Gen**<br>
_@access private_

Damit werden die Selectoren verknüpft oder 'ausgeladen'.

(m) **Connect-Yield**<br>
_@access private_

Das Mixin generiert aus den Elementen der `$kittn-connect-map` Map, Placeholder Selectors. Die dann mittels dem `connect` Mixin mit bestehenden Klassen verbunden werden.

```scss
// Map
$kittn-connect-map: (
  size: (
    height: 20px,
    line-height: 20px
  ),
  connect: (
    color: #fff,
    background-color: #000
  )
);

// Example
@include connect-yield();

// Result
%test {
  height: 20px;
  line-height: 20px;
}
%connect {
  color: #fff;
  background-color: #000;
}
```

(m) **Connect**<br>
Mit dem Connect Mixin können bestehende Elemente mit den Placeholder entweder verbunden werden, oder der Style kann in das Element direkt integriert werden.

```scss
// Example
.one-connect {
  @include connect(size);
}
.two-connect {
  @include connect(size connect);
}
.direct-yield {
  @include connect(size connect, false);
}

// Result
.one-connect, .two-connect {
  height: 20px;
  line-height: 20px;
}
.two-connect {
  color: #fff;
  background-color: #000;
}
.direct-yield {
  height: 20px;
  line-height: 20px;
  color: #fff;
  background-color: #000;
}
```

#### Fonts
`scr/sass/framework/helper/_fonts.scss`<br>

(f) **ff**<br>
_@requires `$kittn-fontstack-map`_

Mittels der FF Function kann man sich einen Fontstack einladen, zusätzlich kann man eigene Font Familys anhängen.

```scss
// Example
.font {
  font-family: ff('helvetica');
}
.with-own-font {
  font-family: ff('helvetica', 'gotham', 'interstate');
}

// Result
.font {
  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
}
.with-own-font {
  font-family: "gotham", "interstate", "Helvetica Neue", Helvetica, Arial, sans-serif;
}
```

(m) **Font-Family**<br>
Ist mehr ein Alias der FF Funktion, dieses mal als Mixin.

```scss
// Example
.font {
  @include font-family('helvetica');
}
.with-own-font {
  @include font-family('helvetica', 'gotham', 'interstate');
}

// Result
.font {
  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
}
.with-own-font {
  font-family: "gotham", "interstate", "Helvetica Neue", Helvetica, Arial, sans-serif;
}
```

(m) **FontFace**<br>
_@requires `$kittn-directorys`_

Das Mixin generiert die Fontfaces

```scss
// Examples
@include fontface('own-font', $svgoption: false);

@include fontface('34923234font.com', 'bettername', $svgoption: false);

@include fontface('own-font');

// Results
@font-face {
  font-family: "own-font";
  src: url("/assets/fonts/own-font.eot");
  src: url("/assets/fonts/own-font.eot?#iefix") format("eot"), url("/assets/fonts/own-font.woff") format("woff"), url("/assets/fonts/own-font.ttf") format("truetype"), url("/assets/fonts/own-font.svg#own-font") format("svg");
  font-weight: normal;
  font-style: normal;
}

@font-face {
  font-family: "bettername";
  src: url("/assets/fonts/34923234font.com.eot");
  src: url("/assets/fonts/34923234font.com.eot?#iefix") format("eot"), url("/assets/fonts/34923234font.com.woff") format("woff"), url("/assets/fonts/34923234font.com.ttf") format("truetype"), url("/assets/fonts/34923234font.com.svg#34923234font.com") format("svg");
  font-weight: normal;
  font-style: normal;
}

@font-face {
  font-family: "own-font";
  src: url("/assets/fonts/own-font.eot");
  src: url("/assets/fonts/own-font.eot?#iefix") format("eot"), url("/assets/fonts/own-font.woff") format("woff"), url("/assets/fonts/own-font.ttf") format("truetype"), url("/assets/fonts/own-font.svg#own-font") format("svg");
  font-weight: normal;
  font-style: normal;
}
@media screen and (-webkit-min-device-pixel-ratio: 0) {
  @font-face {
    font-family: "own-font";
    src: url("/assets/fonts/own-font.svg") format("svg");
    font-weight: normal;
    font-style: normal;
  }
}
```

(m) **Fontface-Generator**<br>
Der Generator generiert über die `$kittn-fontface-map` Map eine Reihe von Fontfaces. Der Generator steht fast am Anfang, Fontfaces werden im CSS immer an erster Stelle implementiert.

```scss
// Example
$kittn-fontface-map: (
  // EXAMPLE
  'ownfont': (
    filename: false,
    weight: normal,
    style: normal,
    svgoption: false
  )
);

// Result
@font-face {
  font-family: "ownfont";
  src: url("/assets/fonts/ownfont.eot");
  src: url("/assets/fonts/ownfont.eot?#iefix") format("eot"), url("/assets/fonts/ownfont.woff") format("woff"), url("/assets/fonts/ownfont.ttf") format("truetype"), url("/assets/fonts/ownfont.svg#ownfont") format("svg");
  font-weight: normal;
  font-style: normal;
}
```

#### Helper
(f) **Strip-Units**<br>
Entfernt die Units von Values

```scss
// Example
$size: 20px;

.test {
  height: strip-units($size);
}

// Result
.test {
  height: 20;
}
```

(f) **Unit-Check**<br>
Hängt die Default Unit an Values

```scss
// Example
$size: 20;

.test {
  height: unit-check($size);
}

// Result
.test {
  height: 20px;
}
```

(m) **Calc**<br>
Über das Mixin kann man den CSS Calc verwenden.

```scss
// Example
.test {
  @include calc(width, '10% + 20px');
  @include calc(height, '20px + 0.5rem');
}

// Result
.test {
  width: calc(10% + 20px);
  height: calc(20px + 0.5rem);
}
```

(f) **Clamp**<br>
Mit dieser Funktion begrenzt man Zahlenwerte.

```scss
// Example
$height: 200;
$width: 23;

.test {
  height: clamp($height, 0, 100) + 0px;
  width: clamp($width, 0, 100) + 0px;
}

// Result
.test {
  height: 100px;
  width: 23px;
}

```

(f) **CP Colorpicker**<br>
_@requires `$kittn-color-map`_

Über den Colorpicker greift man auf die Color Map zu.

> Die Keywords der Farben müssen gequotet notiert werden.

```scss
// Example
.color {
  color: cp('primary');
  background-color: cp('black');
}

// Result
.color {
  color: #f29300;
  background-color: #3c3c3c;
}
```

(m) **Spacer**<br>
_@requires `$kittn-global-spacing`_

Das Spacermixin generiert anhand der Global Spacing Unit Größen.

```scss
// Example
.box {
  height: spacer(2);
  width: spacer(1);
  margin-top: spacer(.25, true);
}

// Result
.color {
  height: 40px;
  width: 20px;
  margin-top: 5px !important;
}
```

(f) **S**<br>
_@requires `$kittn-global-spacing`_

Selbiges wie oben, mit dem Unterschied das diese Funktion per Default keine Units integriert. Wird häufig für interne Mixins verwendet.

```scss
// Example
.box {
  height: s(2, $u: r);
  width: s(1, $u: p);
  margin-top: s(.25, true, p);
  padding-left: s(10) + 0px;
}

// Result
.box {
  height: 40rem;
  width: 20px;
  margin-top: 5px !important;
  padding-left: 200px;
}
```

#### Typechecks
(f) **Is-True**<br>
Prüft ob ein Wert übergeben wurde

```scss
// Example
$check: 1;

.test {
  @if is-true($check) {
    content: 'Treffer';
  }
}

// Result
.test {
  content: 'True';
}
```

(f) **Is-Map**<br>
Prüft ob es sich um eine Map handelt.

```scss
// Example
$check: (
  1: 'hello'
);

.test {
  @if is-map($check) {
    content: 'True';
  }
}

// Result
.test {
  content: 'True';
}
```

(f) **Is-List**<br>
Prüft ob es sich um eine Liste handelt.

```scss
// Example
$check: 'hello' 'welcome' 'to';

.test {
  @if is-list($check) {
    content: 'True';
  }
}

// Result
.test {
  content: 'True';
}
```

(f) **Is-Number**<br>
Prüft ob es sich um eine Nummer handelt.

```scss
// Example
$check: 1;

.test {
  @if is-number($check) {
    content: 'True';
  }
}

// Result
.test {
  content: 'True';
}
```

(f) **Is-String**<br>
Prüft ob es sich um einen String handelt.

```scss
// Example
$check: 'hello';

.test {
  @if is-string($check) {
    content: 'True';
  }
}

// Result
.test {
  content: 'True';
}
```

(f) **Is-Not-String**<br>
Prüft ob es sich **nicht** um einen String handelt.

```scss
// Example
$check: 1;

.test {
  @if is-not-string($check) {
    content: 'True';
  }
}

// Result
.test {
  content: 'True';
}
```

(f) **Is-Nested**<br>
Prüft ob der Selektor verschachtelt wurde.

```scss
// Example
.test {
  @if is-nested() {
    content: 'True';
  }
}

.other-test {
  .other-inner {
    @if is-nested() {
      content: 'True';
    }
  }
}

// Result
.other-test .other-inner {
  content: 'True';
}
```

(f) **Map-Filled**<br>
Überprüft ob die Map gefüllt wurde.

```scss
// Example
$test-1: ();
$test-2: (
  1: 2,
  3: 4
);

.test-1 {
  @if map-filled($test-1) {
    content: 'True';
  }
}
.test-2 {
  @if map-filled($test-2) {
    content: 'True';
  }
}

// Result
.test-2 {
  content: 'True';
}
```

#### Jacket
Nähere [Informationen](https://github.com/Team-Sass/jacket)

#### Sassylists
Da `Kittn` nur ein Bruchteil der Funktionen von Hugo Giraudels [sassylists](http://sassylists.com/) benötigt, ist die Library hier in gekürzter Form integriert.

Folgende Funktionen wurden integriert:

- `sl-has-multiple-values`
- `sl-str-compare`
- `sl-to-list`
- `sl-listify`
- `sl-reverse`
- `sl-mirror`
- `sl-remove-duplicates`
- `sl-unique`
- `sl-sort`
- `sl-order`

#### Debug
_@requires '$kittn-activate'_

Bei Aktivieren werden mögliche Fehler im CSS visuell hervorgehoben.

- `rot` = Fehler
- `gelb` = Zu Überprüfen

---

### Modules

#### Breakpoints

(f) **BP**<br>
_@requires '$kittn-breakpoint-map'_

Wählt anhand des Breakpoint-Key, die entsprechende Größe aus der Breakpoint-Map.

```scss
// Example
.test {
  content: bp(1);
}

// Result
.test {
  content: 320px;
}
```

(m) **Break**<br>
_@requires '$kittn-breakpoint-map'_

Generiert MediaQueries. Wenn Mobile First aktiviert wurde (`$kittn-activate`), arbeiten die MQs per Default immer mit `min` Werten. Im Mode `between` wird das Mixin die zwei Größen zudem immer immer aufsteigend Sortieren.

```scss
// Example
.test {
  height: 200px;

  @include break(2) {
    height: 400px;
  }
}

.other-dir {
  @include break(3,max) {
    height: 200px;
  }
}
.between {
  @include break(2 4, between) {
    display: block;
  }
}

.sort {
  @include break(5 2, between) {
    display: block;
  }
}

// Result
.test {
  height: 200px;
}
@media screen and (min-width: 480px) {
  .test {
    height: 400px;
  }
}

@media screen and (max-width: 561px) {
  .other-dir {
    height: 200px;
  }
}

@media screen and (min-width: 480px) and (max-width: 769px) {
  .between {
    display: block;
  }
}

@media screen and (min-width: 480px) and (max-width: 961px) {
  .sort {
    display: block;
  }
}
```

(m) **EQ**<br>
Mixin für die [ElementQueries](https://github.com/snugug/eq.js) von Sam Richard

```scss
// Example
.test {
  @include eq('small', 'medium', 'large') {
    color: red;
  }

  @include eq('small') {
    p {
      height: 20px;
    }
  }
}

// Result
.test[data-eq-state="small"],
.test[data-eq-state="medium"],
.test[data-eq-state="large"] {
  color: red;
}
.test[data-eq-state="small"] p {
  height: 20px;
}

// Usage
<div data-eq-pts="small: 480, medium: 700, large: 800" class="test">
  <p>Test Block</p>
</div>
```

(m) **Visibility**<br>
Generiert Visibilty/Hidden Classes basierend auf der `$kittn-breakpoint-map` Map. Es werden dabei aber nur Classen generiert wenn diese in der Map mit `visibility: true` eingetragen wurden.

```scss
// Map
$kittn-breakpoint-map: (
  1: (
    size: 320px,
    visibility: true,
    step: true,
    fontsize: false
  ),
  2: (
    size: 480px,
    visibility: false,
    step: false,
    fontsize: 80
  )
);

// Example
@include visibility;

// Result
.hidden-to--1 {
  display: none; }
@media screen and (max-width: 321px) {
  .hidden-to--1 {
    display: inherit;
  }
}

@media screen and (min-width: 320px) {
  .hidden-from--1 {
    display: none;
  }
}

@media screen and (max-width: 321px) {
  .visible-to--1 {
    display: none;
  }
}

.visible-from--1 {
  display: none; }
@media screen and (min-width: 320px) {
  .visible-from--1 {
    display: inherit;
  }
}
```

#### Colors
(f) **Tint**<br>
Mischt eine Farbe mit Weiß

```scss
// Example
.color {
  color: tint(#ff0000,20);
}

// Result
.color {
  color: #ff3333;
}
```

(f) **Shade**<br>
Mischt eine Farbe mit Schwarz

```scss
// Example
.color {
  color: shade(#ff0000,20);
}

// Result
.color {
  color: #cc0000;
}
```

(f) **Luma**<br>
Berechnet die Helligkeit einer Farbe  

```scss
// Example
$color: red;

.color {
  content: luma($color);
}

// Result
.color {
  content: 76.245;
}
```

(f) **Luma-GTE**<br>
Liefert `true` zurück wenn Farbe 1 heller ist als Farbe 2

```scss
// Example
$color-1: red;
$color-2: blue;

.color {
  @if luma-gte($color-1, $color-2) {
    content: 'true'
  }
}

// Result
.color {
  content: "true";
}
```

(f) **Luma-LTE**<br>
Liefert `true` zurück wenn Farbe 1 kleiner ist als Farbe 2

```scss
// Example
$color-1: red;
$color-2: blue;

.color {
  @if luma-lte($color-1, $color-2) {
    content: 'true'
  }
}

// Result
```

(f) **Luma-DIFF**<br>
Berechnet die Differenz zwischen zwischen zwei Farbwerten.

```scss
// Example
$color-1: red;
$color-2: blue;

.color {
  content: luma-diff($color-1, $color-2);
}

// Result
.color {
  content: 47.175;
}
```

(m) **_Color**<br>
_@access private<br>
@requires `$kittn-color-map`_

Zieht Werte aus der Color Map. In dem Mixin ist ebenso ein Fallback für IE integriert - wenn Farben Opacity Werte aufweisen.

```scss
// Example
.color {
  @include _color('primary');
  @include _color('black', background-color);
}

// Result
.color {
  color: #f29300;
  background-color: #3c3c3c;
}
```

(m) **Get-C**<br>
_@requires `$kittn-color-map`_

Generiert auf dem gewählten Farbwert die Textfarbe.

```scss
// Example
.color {
  @include get-c('primary');
}

// Result
.color {
  color: #f29300;
}
```

(m) **Color**<br>
Alias Mixin von `get-c`

(m) **Get-BC**<br>
_@requires `$kittn-color-map`_

Generiert aus dem gewählten Farbwert die Hintergrundfarbe

```scss
// Example
.color {
  @include get-bc('primary');
}

// Result
.color {
  background-color: #f29300;
}
```

(m) **Background-Color**<br>
Alias Mixin von `get-bc`

(m) **Colorgenerator**<br>
_@requires `$kittn-color-map`, `$kittn-color-generator`_

Generiert aus der `$kittn-color-map` Map Farbklassen, entweder `silent` oder als Klasse. In der `$kittn-color-generator` findet man die erforderlichen Einstellungen.

Über den `type` bestimmt man die Art der ColorPlaceholder:
- `c` Color
- `b` Background-Color
- `bc` Background-Color & Color

```scss
// Example
$kittn-color-map: (
  'primary': (
    color: #f29300,
    opacity: false,
    type: bc
  ),
  'black': (
    color: #3c3c3c,
    opacity: false,
    type: bc
  )
);

@include colorgenerator();

// Result
.c--primary {
  color: #f29300;
}
.bc--primary {
  background-color: #f29300;
}
.c--black {
  color: #3c3c3c;
}
.bc--black {
  background-color: #3c3c3c;
}
```

(m) **Ext-C**<br>
Verbindet Elemente mit der gewählten Farbe (`color`) - der Colorgenerator muss dafür aber die ColorPlaceholder generiert haben, ansonsten lädt das Mixin die Farbe direkt in das Element.

```scss
// Example
.first {
  @include ext-c('primary');
}
.second {
  @include ext-c('primary');
}

// Result
.first, .second {
  color: #f29300;
}
```

(m) **Ext-BC**<br>
Verbindet Elemente mit der gewählten Farbe (`background-color`) - der Colorgenerator muss dafür aber die ColorPlaceholder generiert haben, ansonsten lädt das Mixin die Farbe direkt in das Element.

```scss
// Example
.first {
  @include ext-bc('primary');
}
.second {
  @include Ext-bc('primary');
}

// Result
.first, .second {
  background-color: #f29300;
}
```

#### Dimensions
(m) **Size**<br>
(m) **Align-Height**<br>
(m) **Align-Fontsize**<br>
(m) **Center**<br>
(m) **Perfect-Circle**<br>
(m) **Ratio**<br>
(m) **Unratio**<br>
(m) **Tighten-Up**<br>
(m) **Text-Middle**<br>

#### Grid
(f) **Grid-Size**<br>
(m) **Grid-Stepper**<br>
(m) **Grid-Container**<br>
(m) **Grid-Row**<br>
(m) **Grid-Colum**<br>
(m) **Grid-Size**<br>
(m) **Pixel-Grid**<br>
(m) **Grid-Generator**<br>
(m) **Grid-Devide**<br>
(m) **Grid-Offset**<br>
(m) **Grid-Offset-Generator**<br>
(m) **Grid-Pushpull**<br>
(m) **Grid-Pushpull-Generator**<br>
(m) **Grid-Normalizer**<br>

#### Iconfont
(f) **Icon**<br>
(m) **Iconfont**<br>
(m) **Icon-Font-Generator**<br>
(m) **Icon-Generator**<br>
(m) **Icon**<br>
(m) **Ext-Icon**<br>

#### Images
(m) **GetImageDimensions**<br>
(m) **Image**<br>
(m) **SVGPNG**<br>
(m) **Texture**<br>
(m) **SVG**<br>
(m) **Sprite-Generator**<br>
(m) **Sprite**<br>

#### Lines
(f) **Rem**<br>
(m) **Remsize**<br>
(m) **Pxsize**<br>
(m) **Rem**<br>
(m) **Lineheight**<br>
(m) **Marginbottom**<br>
(m) **Margintop**<br>
(m) **Marginleft**<br>
(m) **Marginright**<br>
(m) **Paddingtop**<br>
(m) **Paddingbottom**<br>
(m) **Paddingleft**<br>
(m) **Paddingright**<br>
(m) **Height**<br>
(m) **Fontsize**<br>
(m) **Fontcalc**<br>

#### Modernizr
(m) **Modernizr**<br>
(m) **Yep**<br>
(m) **Nope**<br>

#### Positioning
(m) **Set-Position**<br>
(m) **Relative**<br>
(m) **Absolute**<br>
(m) **Fixed**<br>
(m) **Static**<br>
(m) **Bar**<br>
(m) **Bar-Top**<br>
(m) **Bar-Bottom**<br>
(m) **Position-Translate**<br>
(m) **Pivot**<br>
(m) **Slide**<br>
(m) **Pivot-Center**<br>
(m) **Absolute-Middle**<br>
(m) **Element-Middle**<br>
(f) **Z**<br>
(m) **Z**<br>
(m) **Shift**<br>
(m) **Overlap**<br>

#### Shorthands
(m) **Clearfix**<br>
(m) **Center**<br>
(m) **Word-Wrap**<br>
(m) **Text-Truncate**<br>
(m) **Vertical-Center**<br>
(m) **Cleartext**<br>
(m) **Cleartext-Complex**<br>
(m) **Cleartext-Simpler**<br>
(m) **Decollapse**<br>
(m) **Performance**<br>
(m) **Antialias**<br>

#### Spacer
(m) **Margin-Padding**<br>
(m) **Padding**<br>
(m) **Margin**<br>
(m) **Spacer**<br>
(m) **Spacer-Reset**<br>

#### Triangle
(m) **Triangle**<br>


#### Typography
(f) **TW**<br>
(m) **Typogenerator**<br>
(m) **Responsive-Fontsizes**<br>
(m) **Get-Fontsize**<br>

---

### Partials

#### Normalize

#### Tables

#### Pre-Generators

#### Post-Generators

---

## Special Thanks to

- Hugo Giraudel (@HugoGiraudel) - for his awesome Sass Scripts
- Daniel Guillan (@danielguillan) - Modernizr Mixins
- Team Sass - Jacket
- Sam Richard (@Snugug) - EQ.js

## License

MIT
