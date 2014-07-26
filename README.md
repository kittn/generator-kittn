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

**`gulp init`**<br>
Für das erste Initialisieren des Projekts.

**`gulp`**<br>
Default Task

**`gulp extended`**<br>
Erweiterter Default Task - überwacht Bilddaten

**`gulp rebuild-js`**<br>
Sämtliche Javascript Dateien werden neu generiert

**`gulp publish`**<br>
Die Projektdaten werden für die Produktion vorbereitet. CSS, JS und Bilddaten werden Komprimiert. Die Dokumenation wird generiert.

**`gulp jade-rebuild`**<br>
Sämtliche Jade Dateien werden auf einen Rutsch neu kompiliert.

**`gulp bump`**<br>
Die Versionsnummer wird gepatcht (0.0.1)

**`gulp bump-minor`**<br>
Die Versionsnummer wird um ein Minor Update erweitert (0.1.0)

**`gulp bump-major`**<br>
Die Versionnummer wird um eine Release Nummer erweitert (1.0.0)

**`gulp grunt-rebuild-images`**<br>
Bilddaten wie `single`, `textures`, `svg` und `sprites` werden aus dem `dist` Verzeichnis gelöscht und neu Integriert.

**`gulp grunt-responsive-images`**<br>
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

Die unterschiedlichen ZIndexes werden auf der Map notiert.

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
`scr/sass/framework/helper/_helper.scss`<br>

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
`scr/sass/framework/helper/_typechecks.scss`<br>

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
`scr/sass/framework/helper/_jacket.scss`<br>

Nähere [Informationen](https://github.com/Team-Sass/jacket)

#### Sassylists
`scr/sass/framework/helper/_sassylists.scss`<br>

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
`scr/sass/framework/helper/_debug.scss`<br>

_@requires '$kittn-activate'_

Bei Aktivieren werden mögliche Fehler im CSS visuell hervorgehoben.

- `rot` = Fehler
- `gelb` = Zu Überprüfen

---

### Modules

#### Breakpoints
`scr/sass/framework/modules/_breakpoints.scss`<br>

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
`scr/sass/framework/modules/_color.scss`<br>

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
`scr/sass/framework/modules/_dimensions.scss`<br>

(m) **Size**<br>
Integriert Breite und Höhe.

```scss
// Example
.square {
  @include size(50);
}
.rectangle {
  @include size(50 100);
}
.with-lineheight {
  @include size(50,true);
}
.with-individual-lineheight {
  @include size(50,80);
}

// Result
.square {
  width: 50px;
  height: 50px;
}
.rectangle {
  width: 50px;
  height: 100px;
}
.with-lineheight {
  width: 50px;
  height: 50px;
  line-height: 50px;
}
.with-individual-lineheight {
  width: 50px;
  height: 50px;
  line-height: 80px;
}
```

(m) **Align-Height**<br>
Höhe und Lineheight einfach einfügen.

```scss
// Example
.height {
  @include align-height(50);
}
.height-different-factor {
  @include align-height(50,1.5);
}

// Result
.height {
  height: 50px;
  line-height: 50px;
}
.height-different-factor {
  height: 50px;
  line-height: 75px;
}
```

(m) **Align-Fontsize**<br>
Align Fontsize und Lineheight

```scss
// Example
.font {
  @include align-fontsize(20);
}
.font-other-factor {
  @include align-fontsize(20,0.8);
}

// Result
.font {
  font-size: 20px;
  line-height: 24px;
}
.font-other-factor {
  font-size: 20px;
  line-height: 16px;
}
```

(m) **Center**<br>
Zentriert, Mittelt und gibt einem Element eine Größe

```scss
// Example
.box {
  @include center(20);
}
.box2 {
  @include center(20 50);
}

// Result
.box {
  width: 20px;
  height: 20px;
  line-height: 20px;
  text-align: center;
}

.box2 {
  width: 20px;
  height: 50px;
  line-height: 50px;
  text-align: center;
}
```

(m) **Perfect-Circle**<br>
Passt den Border-Radius an die Größe des Elements an.

```scss
// Example
.circle {
  @include perfect-circle(20);
}

// Result
.circle {
  width: 20px;
  height: 20px;
  line-height: 20px;
  text-align: center;
  border-radius: 20px;
}
```

(m) **Ratio**<br>
Stellt bei einem Element das Breiten und Größenverhältniss gemäß der Ratio ein.

```scss
// Example
.ratio {
  @include ratio(16 9);
}
.box {
  @include ratio(16 9, '.box__inner');
}

// Result
.ratio {
  overflow: hidden;
  position: relative;
}
.ratio:before {
  content: '';
  display: block;
  height: 0;
  padding-top: 56.25%;
}
.ratio > * {
  position: absolute;
  left: 0;
  top: 0;
  height: 100%;
  width: 100%;
}
.box {
  overflow: hidden;
  position: relative;
}
.box:before {
  content: '';
  display: block;
  height: 0;
  padding-top: 56.25%;
}
.box > .box__inner {
  position: absolute;
  left: 0;
  top: 0;
  height: 100%;
  width: 100%;
}
```

(m) **Unratio**<br>
Entfernt bestehende Ratios wieder.

```scss
// Example
.box {
  @include unratio('.box__inner');
}

// Result
.box:before {
  height: auto;
  padding-top: 0;
}
.box > .box__inner {
  position: inherit;
  left: inherit;
  top: inherit;
  height: inherit;
  width: inherit;
}
```

(m) **Tighten-Up**<br>
'Spannt' ein inneres Element auf die gleiche Dimension des äußeren Elements auf.

```scss
// Example
.box {
  @include tighten-up;
}

// Result
.box {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
}
```

(m) **Text-Middle**<br>
Positioniert Textelemente in der Vertikalen Mitte.

```scss
// Example
.middle {
  @include text-middle;
}

// Result
.middle:before {
  content: '';
  display: inline-block;
  height: 100%;
  vertical-align: middle;
  }
.middle > * {
  display: inline-block;
  vertical-align: middle;
}
```


#### Grid
`scr/sass/framework/modules/_grid.scss`<br>

(f) **Grid-Size**<br>
Berechnet die Breite der Colums

```scss
// Example
.box {
  width: grid-size(3);
}

// Result
.box {
  width: 25%;
}
```

(m) **Grid-Adaptive**<br>
_@requires `$kittn-breakpoint-map`_

Die Seitenbreite verändert sich damit Adaptiv. Der jeweilige Threshold wird über `$kittn-breakpoint-map` eingestellt in dem bei Breakpoint `step` auf `true` gestellt wird. Die Reihenfolge der MediaQueries richtet sich nach `$kittn-activate(mobile-first)`.

Das Mixin muss in einem Selektor aufgerufen werden.

```scss
// Example
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
  ),
  3: (
    size: 560px,
    visibility: false,
    step: true,
    fontsize: false
  )
);

.container {
  @include grid-adaptive();
}

// Result
.container {
  width: 320px;
}
@media screen and (min-width: 560px) {
  .container {
    width: 560px;
  }
}
```

(m) **Grid-Container**<br>
Generiert den Seiten Container, der zum einen die Seite im Viewport positioniert (default: center), zum anderen bestimmt er die Seitenbreite.

Wenn man das `grid-adaptive` Mixin verwendet wird, sollte die Seitenbreite deaktiviert werden.

- `width` {list|bool} Bei einem Wert ist der Container Statisch, zwei Werte geben min und max vor, kann auch auf `false` gestellt werden.
- `pos` Position des Container. Values: `center`, `left`,  `right`
- `gutter` Nur aktiv wenn `pos: left` oder `pos:right` eingestellt wurde, der Gutter bestimmt dann den Abstand zum Viewport.
- `static-ie` {Bool} Wenn aktiviert, bekommt der IE8 einen statischen Seitencontainer.

```scss
// Example
.container-adaptive {
  @include grid-stepper();
  @include grid-container((
      width: false
  ));
}

.container-fluid {
  @include grid-container((
      width: 400 900
  ));
}

.container-static {
  @include grid-container((
      width: 800
  ));
}

// Result
.container-adaptive {
  width: 320px;
  margin-left: auto;
  margin-right: auto;
  padding-left: 10px;
  padding-right: 10px;
}
@media screen and (min-width: 560px) {
  .container-adaptive {
    width: 560px;
  }
}

.container-fluid {
  margin-left: auto;
  margin-right: auto;
  width: 100%;
  min-width: 400px;
  max-width: 900px;
  padding-left: 10px;
  padding-right: 10px;
}

.container-static {
  margin-left: auto;
  margin-right: auto;
  width: 800px;
  padding-left: 10px;
  padding-right: 10px;
}
```

(m) **Grid-Row**<br>
Über die `rows` wird das Display Verhalten der einzelnen `colums` eingestellt. zusätzlich wird dafür gesorgt das Floats nicht überlaufen.

- `spacing` Seitlicher Abstand
- `layout` Values: `block`, `inline`, `table`, `flex`
- `valign` Gilt nur bei `layout:inline`. Values: `top`, `bottom`, `baseline`, `middle`
- `align` Values: `justify`, `center`, `right`, `left`

```scss
// Example
.row-block {
  @include grid-row(());
}

.row-table {
  @include grid-row((
   layout: table
  ));
}

// Result
.row-block:after {
  content: '';
  display: table;
  clear: both;
}
.row-block .row-block {
  margin-left: -10px;
  margin-right: -10px;
}

.row-table {
  display: table;
  width: 100%;
}
```

(m) **Grid-Colum**<br>
Bildet den Basisstyle für alle `colums`.

- `spacing` Seitlicher Abstand
- `layout` Values: `block`, `inline`, `table`, `flex`
- `extras` {Bool} Inkludiert Extra Klassen für die Colums
- `valign` Gilt nur bei `layout:inline`. Varianten: `top`, `bottom`, `baseline`, `middle`
- `align` Values: `justify`, `center`, `right`, `left`

```scss
// Example
.colum {
  @include grid-colum(());
}

.colum {
  @include grid-colum((
    layout: inline
  ));
}

// Result
.colum {
  padding-left: 10px;
  padding-right: 10px;
  display: block;
  float: left;
}
.colum:last-child {
  float: right;
}

.colum-inline {
  padding-left: 10px;
  padding-right: 10px;
  display: inline-block;
  letter-spacing: normal;
  word-spacing: normal;
  white-space: normal;
  vertical-align: top;
  text-align: left;
}
```

(m) **Grid-Size**<br>
Definiert die Breite einer Colum.

- `size` Spaltenbreite
- `max` Die maximale Anzahl an Spalten (als Berechnungsgrundlage)
- `flex` {Bool} Aktiviert die Flexbox Funktion

```scss
// Example
.colum {
  @include grid-size((size: 5));
}
.colum-flex {
  @include grid-size((
    size: 200,
    flex: true
  ));
}

// Result
.colum {
  width: 41.666667%; }

.colum-flex {
  -webkit-box-flex: 12;
  -webkit-flex: 12;
      -ms-flex: 12;
          flex: 12;
}
```

(m) **Pixel-Grid**<br>
Definiert die Breite einer Colum in Pixel.


- `size` Spaltenbreite
- `max` Die maximale Anzahl an Spalten
- `margin` Seitlicher Abstand
- `space` Breite des äußeren Wrappers

```scss
// Example
.pixel {
  @include pixel-grid((
    size: 5,
    max: 12,
    space: 1200
  ));
}
.pixel-2 {
  @include pixel-grid((
    size: 10,
    max: 24,
    space: 1000
  ));
}

// Result
.pixel {
  width: 480px;
  margin-left: 10px;
  margin-right: 10px;
}
.pixel-2 {
  width: 396.666667px;
  margin-left: 10px;
  margin-right: 10px;
}
```

(m) **Grid-Generator**<br>
Generiert eine definierte Anzahl von Colums

_Einstellungen_
- `colums` Maximale Colums
- `select` {bool|list} Hier kann spezifiziert werden welche Colums generiert werden sollen
- `name` {bool|*} Wenn das Mixin nicht innerhalb einer Klasse aufgerufen wird, kann man den Selektor übermitteln
- `extend` {bool|*} Damit werden die generierten Klassen mit anderen Klassen verbunden.

```scss
// Example
%colum {
  @include grid-colum(());
}

.width {
  @include grid-generator((
    colums: 6,
    extend: '%colum'
  ));
}

.span {
  @include grid-generator((
    colums: 24,
    select: 1 14 8 8 10
  ));
}

// Result
.width--1, .width--2, .width--3, .width--4, .width--5, .width--6 {
  padding-left: 10px;
  padding-right: 10px;
  display: block;
  float: left;
}
.width--1:last-child, .width--2:last-child,
.width--3:last-child, .width--4:last-child,
.width--5:last-child, .width--6:last-child {
  float: right;
}

.width--1 {
  width: 16.666667%; }
.width--2 {
  width: 33.333333%; }
.width--3 {
  width: 50%; }
.width--4 {
  width: 66.666667%; }
.width--5 {
  width: 83.333333%; }
.width--6 {
  width: 100%; }

.span--1 {
  width: 4.166667%; }
.span--8 {
  width: 33.333333%; }
.span--10 {
  width: 41.666667%; }
.span--14 {
  width: 58.333333%; }
```

(m) **Grid-Devide**<br>
Das Mixin kann ein bestehendes Grid 'teilen', ein 12er Grid kann damit in eine 6er Grid umgewandelt werden. Funktioniert aber nur wenn nicht Mobile-First gearbeitet wird.

- `colums` Maximale Colums
- `name` {bool|*} Wenn das Mixin nicht innerhalb einer Klasse aufgerufen wird, kann man den Selektor übermitteln
- `devide` {number} Teiler

```scss
// Example
.width {
  @include grid-devide((
    colums: 12,
    devide: 3
  ));
}

.span {
  @include grid-devide((
    colums: 6,
  ));
}

// Result
.width--1, .width--5, .width--9 {
  width: 25%; }
.width--2, .width--6, .width--10 {
  width: 50%; }
.width--3, .width--7, .width--11 {
  width: 75%; }
.width--4, .width--8, .width--12 {
  width: 100%; }

.span--1, .span--4 {
  width: 33.333333%; }
.span--2, .span--5 {
  width: 66.666667%; }
.span--3, .span--6 {
  width: 100%; }
```

(m) **Grid-Offset**<br>
Generiert den Offset

- `size` Spaltenbreite
- `max` Die maximale Anzahl an Spalten
- `direction` Values: `left`, `right`
 => The Direction off the Offset (default: left)

```scss
// Example
.offset {
  @include grid-offset((
    size: 2
  ));
}
.offset-right {
  @include grid-offset((
    size: 5,
    direction: right
  ));
}

// Result
.offset {
  margin-left: 16.666667%;
}
.offset-right {
  margin-right: 41.666667%;
}
```

(m) **Grid-Offset-Generator**<br>
Generiert die Offset Klassen.

- `max` Die maximale Anzahl an Spalten
  => The Maximum Colums (default: 12)
- `name` {bool|*} Wenn das Mixin nicht innerhalb einer Klasse aufgerufen wird, kann man den Selektor übermitteln

```scss
// Example
.offset {
  @include grid-offset-generator((
    max: 3,
  ));
}

// Result
.offset-left--1 {
  margin-left: 33.333333%; }
.offset-right--1 {
  margin-right: 33.333333%; }
.offset-left--2 {
  margin-left: 66.666667%; }
.offset-right--2 {
  margin-right: 66.666667%; }
```

(m) **Grid-Pushpull**<br>
Generiert Push and Pull Sizes

- `size` Spaltenbreite
- `max` Die maximale Anzahl an Spalten
- `direction` Values: `push`, `pull`
- `extend` {bool|*} Damit werden die generierten Klassen mit anderen Klassen verbunden.

```scss
// Example
%relative {
  position: relative;
}

.push {
  @include grid-pushpull((
    extend: '%relative'
  ));
}

.pull {
  @include grid-pushpull((
    size: 4,
    direction: pull,
    extend: '%relative'
  ));
}

// Result
.push, .pull {
  position: relative; }

.push {
  left: 8.333333%; }

.pull {
  right: 33.333333%; }
```

(m) **Grid-Pushpull-Generator**<br>
Generiert eine bestimmte Anzahl an Push and Pull Klassen.

- `max` Die maximale Anzahl an Spalten
- `name` {bool|*} Wenn das Mixin nicht innerhalb einer Klasse aufgerufen wird, kann man den Selektor übermitteln
- `extend` {bool|*} Damit werden die generierten Klassen mit anderen Klassen verbunden.

```scss
// Example
.move {
  @include grid-pushpull-generator((
    max: 4
  ));
}

// Result
.move-push--1 {
  position: relative;
  left: 25%; }
.move-pull--1 {
  position: relative;
  right: 25%; }
.move-push--2 {
  position: relative;
  left: 50%; }
.move-pull--2 {
  position: relative;
  right: 50%; }
.move-push--3 {
  position: relative;
  left: 75%; }
.move-pull--3 {
  position: relative;
  right: 75%; }
```

(m) **Grid-Normalizer**<br>
Über den Normalizer können die spezifischen Einstellungen wieder resetet werden.

- `name` Name des Selectors der Reseted werden soll
- `option` Values: `blockgrid`, `inlinetable`, `offset`, `pushpull`
- `important` {Bool} Fügt !important an

```scss
// Example
@include grid-normalizer((
  name: 'move',
  option: pushpull
));

@include grid-normalizer((
  name: 'colum'
))

// Result
[class^="move-push--"],
[class*=" move-push--"] {
  left: 0; }

[class^="move-pull--"],
[class*=" move-pull--"] {
  right: 0; }

[class^="colum"],
[class*="colum"] {
  float: none;
  width: 100%; }
```


#### Iconfont
`scr/sass/framework/modules/_iconfont.scss`<br>

(f) **Icon**<br>
_@requires `$kittn-font-icons`_

Bezieht den Content Code aus der Iconfont Map.

```scss
// Example
$kittn-font-icons: (
  test: '/e023'
);

.icon {
  &:before {
    content: icon(test);
  }
}

// Result
.icon:before {
  content: "/e023";
}
```

(m) **Iconfont**<br>
Generiert den Basisstyle für alle Icons.

```scss
// Example
%icon {
    @include iconfont('iconfont');
}
.test {
  @extend %icon;

  &:before {
    content: icon(test);
  }
}

// Result
.test {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  display: inline-block;
  font-family: "iconfont";
  font-style: normal;
  font-weight: normal !important;
  speak: none;
  text-decoration: inherit;
  line-height: 1; }

.test:before {
  content: "/e023"; }
```

(m) **Icon-Font-Generator**<br>
_@requires `$kittn-iconfont`_

Generiert den Basis Icon-Font Style.

```scss
// Example
@include icon-font-generator('iconfont');

// Result
[class^="f-icon__"]:before,
[class*=" f-icon__"]:before,
[data-icon]:before {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  display: inline-block;
  font-family: "iconfont";
  font-style: normal;
  font-weight: normal !important;
  speak: none;
  text-decoration: inherit;
  line-height: 1; }

[data-icon]:before {
  content: attr(data-icon); }
```

(m) **Icon-Generator**<br>
_@requires `$kittn-font-icons`, `$kittn-iconfont`_

Generiert alle Icons als Klassen.

```scss
// Example
@include icon-generator;

// Result
.f-icon__test:before {
  content: "/e023"; }

.f-icon__logo:before {
  content: "/e024"; }
```

(m) **Icon**<br>
Fügt Icon Inhalte in eine Klasse.

```scss
// Example
%icon {
  @include iconfont('iconfont');
}

.test {
  &:before {
    @include icon(test,(
      extend: '%icon'
    ));
  }
}

.lego {
  &:before {
    @include icon(logo,(
      font: 'iconfont'
    ));
  }
}

// Result
.test:before {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  display: inline-block;
  font-family: "iconfont";
  font-style: normal;
  font-weight: normal !important;
  speak: none;
  text-decoration: inherit;
  line-height: 1; }

.test:before {
  content: "/e023"; }

.lego:before {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  display: inline-block;
  font-family: "iconfont";
  font-style: normal;
  font-weight: normal !important;
  speak: none;
  text-decoration: inherit;
  line-height: 1;
  content: "/e024"; }
```

(m) **Ext-Icon**<br>
Erweitert eigene Klassen mit den Iconklassen.

```scss
// Example
@include icon-font-generator('iconfont');
@include icon-generator();

.box {
  @include ext-icon(test);
}

// Result
[class^="f-icon__"]:before,
[class*=" f-icon__"]:before,
[data-icon]:before {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  display: inline-block;
  font-family: "iconfont";
  font-style: normal;
  font-weight: normal !important;
  speak: none;
  text-decoration: inherit;
  line-height: 1; }

[data-icon]:before {
  content: attr(data-icon); }

.f-icon__test:before, .box:before {
  content: "/e023"; }

.f-icon__logo:before {
  content: "/e024"; }
```


#### Images
`scr/sass/framework/modules/_images.scss`<br>

(m) **_GetImageDimensions**<br>
_@access private_

Wird für die interne Berechnung der Bilddaten verwendet.

(m) **Image**<br>
Fügt die Single Images ein. Die erforderlichen Daten werden dabei über die `Gulp` Tasks in die jeweilige Imagemap geschrieben.

- @param  {*}    $image       - Name of the Image
- @param  {*}    $dimensions  - 'both' = height & width, 'width' = width, 'height' = height
- @param  {*}    $pos         - The Image Position - can be 'false'
- @param  {Bool} $retina      - With set on 'true' the retina fallback will be included

```scss
// Example
.box {
  @include image(blue);
}

.box-2 {
  @include image(icon, width);
}

// Result
.box {
  background-image: url("/assets/img/single/blue.png");
  background-repeat: no-repeat;
  width: 184px;
  height: 176px; }

.box-2 {
  background-image: url("/assets/img/single/icon.png");
  background-repeat: no-repeat;
  width: 281px; }
```

(m) **Texture**<br>
Fügt die Texture Images ein.

- @param  {*} $image  - Name of the Image
- @param  {*} $repeat - How the Image would be repeated. `x`: repeat-x, `y`: repeat-y
- @param  {List|Bool} $pos - The Image Position - can be `false`
- @param  {Bool} $retina - With set on 'true' the retina fallback will be included

```scss
// Example
.texture {
  @include texture(pattern);
}
.texture-2 {
  @include texture(pattern, $repeat: x);
}
.texture-3 {
  @include texture(pattern, $repeat: y);
}

// Result
.texture {
  background-image: url("/assets/img/textures/pattern.png");
}
.texture-2 {
  background-image: url("/assets/img/textures/pattern.png");
  background-repeat: repeat-x;
  height: 393px;
}
.texture-3 {
  background-image: url("/assets/img/textures/pattern.png");
  background-repeat: repeat-y;
  width: 373px;
}
```

(m) **SVGPNG**<br>
Fügt SVG Images ein, integriert dabei auch das Fallback Image.

- @param  {*} $image - Name of the Image - the SVG File must be in the Same directory
- @param  {*} $dimensions  - 'both' = height & width | 'width' = width | 'height' = height
- @param  {List} $pos - The Image Position - can be 'false'

```scss
// Example
.image {
  @include svgpng(illu);
}

// Result
.image {
  background-image: url("/assets/img/svg/illu.png");
  background-repeat: no-repeat;
  width: 1019px;
  height: 357px;
}
.svg .image {
  background-image: url("/assets/img/svg/illu.svg");
  -webkit-background-size: 1019px 357px;
          background-size: 1019px 357px;
}
```

(m) **SVG**<br>
Für SVG Images ohne Fallback ein.

- @param  {*} $image - The Name of the SVG Image
- @param  {List} $dimensions  - The Dimensions of the Image Container - can be 100%
- @param  {List} $pos - Native CSS Image Positions
- @param  {Bool} $repeat - Image Repeat - native CSS Declaration

```scss
// Example
.vector {
  @include svg(illu)
}
.repeat-vector {
  @include svg(illu, $repeat: repeat-x);
}
.resize-vector {
  @include svg(illu, $dimensions: 40px 30px);
}

// Result
.vector {
  background-image: url("/assets/img/svgonly/illu.svg");
  background-repeat: no-repeat;
  -webkit-background-size: 100% 100%;
          background-size: 100% 100%;
  width: 100%;
  height: 100%;
}

.repeat-vector {
  background-image: url("/assets/img/svgonly/illu.svg");
  background-repeat: repeat-x;
  -webkit-background-size: 100% 100%;
          background-size: 100% 100%;
  width: 100%;
  height: 100%;
}

.resize-vector {
  background-image: url("/assets/img/svgonly/illu.svg");
  background-repeat: no-repeat;
  -webkit-background-size: 40px 30px;
          background-size: 40px 30px;
  width: 40px;
  height: 30px;
}
```

(m) **Sprite-Generator**<br>
_@access private<br>
@requires `$kittn-sprite`_

Generiert den SpriteMap Container. Wird automatisch zu geschaltet.

(m) **Sprite**<br>
Fügt das gewünschte Sprite ein.

- @param  {*} $name - Name of the Sprite
- @param  {Bool} $retina - With set on `true` the retina fallback will be included
- @param  {*} $dimensions - `both`: height & width, `width`: width, `height`: height
- @param  {Number} $offset-x - Offset the Background Position on the x axis
- @param  {Number} $offset-y - Offset the Background Position on the y axis
- @param  {*} $display - The display mode

```scss
// Example
.sprite {
  @include sprite(cross);
}

.sprite-and-retina {
  @include sprite(cross, $retina: true);
}

// Result
.sprite {
  background-position: 0px 0px;
  width: 590px;
  height: 466px;
  display: inline-block;
}

.sprite-and-retina {
  background-position: 0px 0px;
  width: 590px;
  height: 466px;
  display: inline-block;
}
@media (-webkit-min-device-pixel-ratio: 2), (min-resolution: 192dpi) {
  .sprite-and-retina {
    background-position: 0px 0px;
    -webkit-background-size: 590px 466px;
            background-size: 590px 466px;
  }
}
```

#### Lines
`scr/sass/framework/modules/_lines.scss`<br>

(f) **Rem**<br>
_@requires `$kittn-typo`_

Rechnet Px in REM um.

- @param {Number} $px - The Size in PX
- @param {Number} $base - The Base for the 

```scss
// Example
.test {
  width: rem(200px);
}

// Result
.test {
  width: 14.705882rem; 
}
```

(m) **Remsize**<br>
_@requires `$kittn-typo`<br>
@access private_

Berechnet Größen anhand der Base Line-Height. Die Umberechnung findet aber nur statt wenn in der `$kittn-typo` die `unit` auf `rem` gestellt wurde. IE8 erhält sein eigenes Fallback mittels PX Werten.

- @param {*} $arg - Attribute
- @param {Number} $size - Lines

```scss
// Example
.test {
  @include _remsize(height, 4);
  @include _remsize(margin-top, .5);
}

// Result
.test {
  height: 6.176471rem;
  margin-top: 0.772059rem; 
}
```

(m) **Pxsize**<br>
_@requires `$kittn-typo`<br>
@access private_

Berechnet PX Werte in REM um. Die Umberechnung findet aber nur statt wenn in der `$kittn-typo` die `unit` auf `rem` gestellt wurde. IE8 erhält sein eigenes Fallback mittels PX Werten.

- @param {*} $arg - Attribute
- @param {Number} $size - Value

```scss
// Example
.test {
  @include _pxsize(height, 16);
  @include _pxsize(margin-top, 32);
}

// Result
.test {
  height: 1.176471rem;
  margin-top: 2.352941rem; 
}
```

(m) **Rem**<br>
Berechnet die Größen Dynamisch. Dabei kann die Größe einmal über Lines (berechnung mittel Multiplikation der Baselineheight), oder über Pixel erfolgen die dann in REM umgerechnet werden. IE8 erhält bei aktiver IE8 Kompatiblität einen Pixel Fallback.

- @param  {*}       $arg      - Attribute
- @param  {Number}  $size     - Size
- @param  {Bool}    $baseline - When 'true', the Value follow the Baselinerule

```scss
// Example
.test {
  @include rem(width, 600);
  @include rem(margin-top, 50);
}

// Result
.test {
  width: 44.117647rem;
  margin-top: 3.676471rem; 
}
```

(m) **Lineheight**<br>
Basiert auf dem `rem` Mixin.

- @param {Number} $size - Size

```scss
// Example
.test {
  @include lineheight(40);
}

// Result
.test {
  line-height: 2.941176rem; 
}
```

(m) **Marginbottom**<br>
Basiert auf dem `rem` Mixin.

- @param {Number} $size - Size

```scss
// Example
.test {
  @include marginbottom(20);
}

// Result
.test {
  margin-bottom: 1.470588rem; 
}
```

(m) **Margintop**<br>
Basiert auf dem `rem` Mixin.

- @param {Number} $size - Size

```scss
// Example
.test {
  @include margintop(20);
}

// Result
.test {
  margin-top: 1.470588rem; 
}
```

(m) **Marginleft**<br>
Basiert auf dem `rem` Mixin.

- @param {Number} $size - Size

```scss
// Example
.test {
  @include marginleft(10);
}

// Result
.test {
  margin-left: 0.735294rem; 
}
```

(m) **Marginright**<br>
Basiert auf dem `rem` Mixin.

- @param {Number} $size - Size

```scss
// Example
.test {
  @include marginright(10);
}

// Result
.test {
  margin-right: 0.735294rem; 
}
```

(m) **Paddingtop**<br>
Basiert auf dem `rem` Mixin.

- @param {Number} $size - Size

```scss
// Example
.test {
  @include paddingtop(20);
}

// Result
.test {
  padding-top: 1.470588rem; 
}
```

(m) **Paddingbottom**<br>
Basiert auf dem `rem` Mixin.

- @param {Number} $size - Size

```scss
// Example
.test {
  @include paddingbottom(20);
}

// Result
.test {
  padding-bottom: 1.470588rem; 
}
```

(m) **Paddingleft**<br>
Basiert auf dem `rem` Mixin.

- @param {Number} $size - Size

```scss
// Example
.test {
  @include paddingleft(10);
}

// Result
.test {
  padding-left: 0.735294rem; 
}
```

(m) **Paddingright**<br>
Basiert auf dem `rem` Mixin.

- @param {Number} $size - Size

```scss
// Example
.test {
  @include paddingright(10);
}

// Result
.test {
  padding-right: 0.735294rem; 
}
```

(m) **Height**<br>
Basiert auf dem `rem` Mixin.

- @param {Number} $size - Size

```scss
// Example
.test {
  @include height(100);
}#
// Result
.test {
  height: 7.352941rem; 
}
```

(m) **Fontsize**<br>
Basiert auf dem `rem` Mixin.

- @param {Number} $size - Size

```scss
// Example
.test {
  @include fontsize(16);
}

// Result
.test {
  font-size: 1.176471rem; 
}
```

(m) **Fontcalc**<br>
Basiert auf dem `rem` Mixin. Berechnet neben der Fontsize auch die Line-Height

- @param {Number} $fontsize - Font Size
- @param {Bool|Number} $lineheight (false) - Lineheight for the Font - can be false than used the factor
- @param {Number} $factor (1.2) - The Calculationfactor

```scss
// Example
.test {
  @include fontcalc(16, 20);
}
.test-2 {
  @include fontcalc(16, $factor: 2);
}

// Result
.test {
  font-size: 1.176471rem;
  line-height: 1.470588rem; 
}
.test-2 {
  font-size: 1.176471rem;
  line-height: 2.352941rem; 
}
```

#### Modernizr
`scr/sass/framework/modules/_modernizr.scss`<br>

(m) **Modernizr**<br>
_@access private_

Über die integrierten Feature-Check Klassen von Modernizr, kann man Fallbacks integrieren. 

(m) **Yep**<br>
Wird aktiv bei positiven Feature-Check Klassen.

```scss
// Example
.test {
  @include yep(box-shadow) {
    box-shadow: 0 0 3px rgba(0,0,0,0.5);
  }
}

// Result
.box-shadow .test {
  -webkit-box-shadow: 0 0 3px rgba(0, 0, 0, 0.5);
          box-shadow: 0 0 3px rgba(0, 0, 0, 0.5); 
}
```

(m) **Nope**<br>
Wird aktiv bei negativen Feature-Check Klassen

```scss
// Example
.test {
  @include nope(box-shadow) {
    border: 3px solid #ccc;
  }
}

// Result
.no-js .test, .no-box-shadow .test {
  border: 3px solid #ccc; 
}
```


#### Positioning
`scr/sass/framework/modules/_positioning.scss`<br>

(m) **Set-Position**<br>
```scss
// Example
// Result
```

(m) **Relative**<br>
```scss
// Example
// Result
```

(m) **Absolute**<br>
```scss
// Example
// Result
```

(m) **Fixed**<br>
```scss
// Example
// Result
```

(m) **Static**<br>
```scss
// Example
// Result
```

(m) **Bar**<br>
```scss
// Example
// Result
```

(m) **Bar-Top**<br>
```scss
// Example
// Result
```

(m) **Bar-Bottom**<br>
```scss
// Example
// Result
```

(m) **Position-Translate**<br>
```scss
// Example
// Result
```

(m) **Pivot**<br>
```scss
// Example
// Result
```

(m) **Slide**<br>
```scss
// Example
// Result
```

(m) **Pivot-Center**<br>
```scss
// Example
// Result
```

(m) **Absolute-Middle**<br>
```scss
// Example
// Result
```

(m) **Element-Middle**<br>
```scss
// Example
// Result
```

(f) **Z**<br>
```scss
// Example
// Result
```

(m) **Z**<br>
```scss
// Example
// Result
```

(m) **Shift**<br>
```scss
// Example
// Result
```

(m) **Overlap**<br>
```scss
// Example
// Result
```


#### Shorthands
`scr/sass/framework/modules/_shorthands.scss`<br>

(m) **Clearfix**<br>
```scss
// Example
// Result
```

(m) **Center**<br>
```scss
// Example
// Result
```

(m) **Word-Wrap**<br>
```scss
// Example
// Result
```

(m) **Text-Truncate**<br>
```scss
// Example
// Result
```

(m) **Vertical-Center**<br>
```scss
// Example
// Result
```

(m) **Cleartext**<br>
```scss
// Example
// Result
```

(m) **Cleartext-Complex**<br>
```scss
// Example
// Result
```

(m) **Cleartext-Simpler**<br>
```scss
// Example
// Result
```

(m) **Decollapse**<br>
```scss
// Example
// Result
```

(m) **Performance**<br>
```scss
// Example
// Result
```

(m) **Antialias**<br>
```scss
// Example
// Result
```


#### Spacer
`scr/sass/framework/modules/_spacer.scss`<br>

(m) **Margin-Padding**<br>
```scss
// Example
// Result
```

(m) **Padding**<br>
```scss
// Example
// Result
```

(m) **Margin**<br>
```scss
// Example
// Result
```

(m) **Spacer**<br>
```scss
// Example
// Result
```

(m) **Spacer-Reset**<br>
```scss
// Example
// Result
```


#### Triangle
`scr/sass/framework/modules/_triangle.scss`<br>

(m) **Triangle**<br>

```scss
// Example
// Result
```



#### Typography
`scr/sass/framework/modules/_typography.scss`<br>

(f) **TW**<br>
```scss
// Example
// Result
```

(m) **Typogenerator**<br>
```scss
// Example
// Result
```

(m) **Responsive-Fontsizes**<br>
```scss
// Example
// Result
```

(m) **Get-Fontsize**<br>
```scss
// Example
// Result
```


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
