![](http://i.imgur.com/2MtKGwj.jpg)

<!-- MarkdownTOC depth=7 -->

- Einleitung
- Abhängigkeiten
  - Environments
  - Extensions & Compiler
    - Sass
    - Jade
    - Gulp
    - Git
- Install Kittn
- Free the kittn
  - Tasks
- Folder Build
- Image Handling
- Build HTML with Jade
- Working with JS Files
  - Internal Files
  - External Files
- Sass Framework
  - Structure
  - Workfile
  - Loader
  - Setup
  - Maps
    - Fontstacks
    - Iconmap
    - Imagemaps
    - Connectmap
    - ZMap
  - Helper
    - BEM
      - element <small>(m)</small>
      - modifier <small>(m)</small>
      - chainroot <small>(m)</small>
      - chain <small>(m)</small>
    - Connect
      - connect-Gen <small>(m)</small>
      - connect-Yield <small>(m)</small>
      - connect <small>(m)</small>
    - Fonts
      - ff <small>(f)</small>
      - font-family <small>(m)</small>
      - fontface <small>(m)</small>
      - fontface-generator <small>(m)</small>
    - Helper
      - strip-units <small>(f)</small>
      - unit-check <small>(f)</small>
      - calc <small>(m)</small>
      - clamp <small>(f)</small>
      - cp <small>(f)</small>
      - spacer <small>(f)</small>
      - s <small>(f)</small>
    - Typechecks
      - is-true <small>(f)</small>
      - is-map <small>(f)</small>
      - is-list <small>(f)</small>
      - is-number <small>(f)</small>
      - is-string <small>(f)</small>
      - is-not-string <small>(f)</small>
      - is-nested <small>(f)</small>
      - map-filled <small>(f)</small>
    - Jacket
    - Sassylists
    - Debug
  - Modules
    - Breakpoints
      - bp <small>(f)</small>
      - break <small>(m)</small>
      - eq <small>(m)</small>
      - visibility <small>(m)</small>
    - Colors
      - tint <small>(f)</small>
      - shade <small>(f)</small>
      - luma <small>(f)</small>
      - luma-gte <small>(f)</small>
      - luma-lte <small>(f)</small>
      - luma-diff <small>(f)</small>
      - _color <small>(m)</small>_
      - get-c <small>(m)</small>
      - color <small>(m)</small>
      - get-bc <small>(m)</small>
      - background-color <small>(m)</small>
      - colorgenerator <small>(m)</small>
      - ext-c <small>(m)</small>
      - ext-bc <small>(m)</small>
    - Dimensions
      - size <small>(m)</small>
      - align-height <small>(m)</small>
      - align-fontsize <small>(m)</small>
      - center <small>(m)</small>
      - perfect-circle <small>(m)</small>
      - ratio <small>(m)</small>
      - unratio <small>(m)</small>
      - tighten-up <small>(m)</small>
      - text-middle <small>(m)</small>
    - Grid
      - grid-size <small>(f)</small>
      - grid-adaptive <small>(m)</small>
      - grid-container <small>(m)</small>
      - grid-row <small>(m)</small>
      - grid-colum <small>(m)</small>
      - grid-size <small>(m)</small>
      - pixel-grid <small>(m)</small>
      - grid-generator <small>(m)</small>
      - grid-devide <small>(m)</small>
      - grid-offset <small>(m)</small>
      - grid-offset-generator <small>(m)</small>
      - grid-pushpull <small>(m)</small>
      - grid-pushpull-generator <small>(m)</small>
      - grid-normalizer <small>(m)</small>
    - Iconfont
      - icon <small>(f)</small>
      - iconfont <small>(m)</small>
      - icon-font-generator <small>(m)</small>
      - icon-generator <small>(m)</small>
      - icon <small>(m)</small>
      - ext-icon <small>(m)</small>
    - Images
      - _getImageDimensions <small>(m)</small>
      - image <small>(m)</small>
      - texture <small>(m)</small>
      - svgpng <small>(m)</small>
      - svg <small>(m)</small>
      - sprite-generator <small>(m)</small>
      - sprite <small>(m)</small>
    - Lines
      - rem <small>(f)</small>
      - remsize <small>(m)</small>
      - pxsize <small>(m)</small>
      - rem <small>(m)</small>
      - lineheight <small>(m)</small>
      - marginbottom <small>(m)</small>
      - margintop <small>(m)</small>
      - marginleft <small>(m)</small>
      - marginright <small>(m)</small>
      - paddingtop <small>(m)</small>
      - paddingbottom <small>(m)</small>
      - paddingleft <small>(m)</small>
      - paddingright <small>(m)</small>
      - height <small>(m)</small>
      - fontsize <small>(m)</small>
      - fontcalc <small>(m)</small>
    - Modernizr
      - Modernizr <small>(m)</small>
      - yep <small>(m)</small>
      - nope <small>(m)</small>
    - Positioning
      - z <small>(f)</small>
      - z <small>(m)</small>
      - shift <small>(m)</small>
      - set-position <small>(m)</small>
      - relative <small>(m)</small>
      - absolute <small>(m)</small>
      - fixed <small>(m)</small>
      - static <small>(m)</small>
      - bar <small>(m)</small>
      - bar-top <small>(m)</small>
      - bar-bottom <small>(m)</small>
      - position-translate <small>(m)</small>
      - pivot <small>(m)</small>
      - slide <small>(m)</small>
      - pivot-center <small>(m)</small>
      - absolute-middle <small>(m)</small>
      - overlap <small>(m)</small>
    - Shorthands
      - clearfix <small>(m)</small>
      - block-center <small>(m)</small>
      - word-wrap <small>(m)</small>
      - text-truncate <small>(m)</small>
      - vertical-center <small>(m)</small>
      - cleartext <small>(m)</small>
      - cleartext-complex <small>(m)</small>
      - cleartext-simpler <small>(m)</small>
      - decollapse <small>(m)</small>
      - performance <small>(m)</small>
      - antialias <small>(m)</small>
    - Spacer
      - margin-padding <small>(m)</small>
      - padding <small>(m)</small>
      - margin <small>(m)</small>
      - spacer <small>(m)</small>
      - Spacer-Reset <small>(m)</small>
    - Triangle
      - Triangle <small>(m)</small>
    - Typography
      - tw <small>(f)</small>
      - typogenerator <small>(m)</small>
      - responsive-fontsizes <small>(m)</small>
      - get-fontsize <small>(m)</small>
      - ext-typo <small>(m)</small>
  - Partials
    - Normalize
    - Tables
    - Pre-Generators
    - Post-Generators
- Special Thanks to
- License

<!-- /MarkdownTOC -->

## Einleitung

„Kittn“ ist ein Toolkit das vorwiegend beim Aufbau von Frontends unterstützen soll. Wer nach einer bunten Mischung aus vorgefertigten Elementen sucht, so wie man es von Bootstrap und Co gewohnt ist, wird mit Kittn nicht glücklich werden. Hier werden vielmehr die Methoden angeboten um solche Elemente auf einem einfachen Weg zu Bilden und zu erweitern.

Um den CSS Part herum, sind noch viele Automatismen eingebaut die dem Developer ebenfalls helfen, sei es um Image Assets zu generieren und zu verteilen, HTML Mockups aufzubauen, die Code Qualität zu kontrollieren, Sprites zu bilden, Fallbacks für SVG Dateien zu generieren. Darum vermeide ich auch den Begriff Framework.

Angst vor dem Terminal sollte man nicht haben :p

## Abhängigkeiten
Um mit Kittn arbeiten zu können müssen einige Extensions und Environments installiert werden. Wer diese Tools schon installiert hat, der kann den Schritt überspringen.

### Environments

> Getestet wurde das Toolkit bislang auf Mac Systemen! Auf Windows Systemen kann es zu Problemen kommen.

- Ruby >= 1.9.0
- Node >= 0.10.10

Auf Mac Systemen ist Ruby schon installiert, hier würde der Schritt enfallen - wer mag kann hier aber auf Ruby 2.12 Updaten.
Um Ruby auf Windows Systemen zu installieren, empfiehlt sich der [One Click Installer](http://rubyinstaller.org/downloads/).

> Ruby wird nur für Sass benötigt, sobald `Libsass` 100% Produktiv verwendbar ist, wird diese Abhängigkeit entfallen.

Node kann auf Mac Systemen entweder über [Brew](http://brew.sh) installiert werden oder man verwendet den [Installer](http://nodejs.org/), gilt dann für beide Systeme.


### Extensions & Compiler

- Sass 3.4.0 rc.1
- Jade 1.3.0
- Gulp 3.8.5
- Grunt 0.4.5
- Bower 1.3.0
- Yeoman 1.2.0
- Git

Der Generator installiert selbstständig Grunt, Bower und auch Yeoman.

#### Sass
Hier muss die aktuelle Version 3.4.0 RC1 installiert werden, da das Framework gebrauch vom Scripted Ampersand macht.

```bash
gem install sass --pre
```

#### Jade
Nach dem ersten `gulp init` werden damit die ersten HTML Dateien mittels Jade kompiliert. Im weiteren Verlauf kann man sich selbst entscheiden ob man natives HTML schreibt oder weiter mit Jade arbeiten will.

```bash
npm install -g jade
```

#### Gulp
Sämtliche Tasks - auch Grunt Tasks - werden über Gulp aktiviert.

```bash
npm install -g gulp
```

#### Git
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

```bash
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

> Um die CSS3 Prefixes braucht man sich nicht zu kümmern, der Autoprefixer wird bei jedem Compile die Prefixes einfügen.

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
`file: src/sass/_loader.scss`

Mit der `_loader.scss` Datei werden alle Dateien geladen, die benötigt werden. Die Reihenfolge ist dabei schon fest vorgegeben. Sollte auch nicht mehr geändert werden.

---

### Setup
`file: src/sass/_setup.scss`

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
`file: src/sass/maps/_fontstacks.scss`

Fonts die über die Font-Family Mixins eingefügt werden, können auf die Fontstacks zugreifen. In der Map sind die gängisten Kombinationen enthalten.

#### Iconmap
`file: src/sass/maps/_iconfontlist.scss`

Alle Icons einer Iconfont werden in diese Map eingetragen - über die Iconfont Mixins werden daraus dann wieder Klassen generiert.

> Wer seine Iconfonts mit Icomoon erstellt, wird eine CSS Datei geliefert bekommen. Mit etwas Find&Replace kann man diese CSS Datei leicht in eine Map zurück wandeln.

```scss
$kittn-font-icons: (
  news: '\e609',
  works: '\e60a'
);
```

#### Imagemaps
`file: src/sass/maps/_imagemap.scss`<br>
`file: src/sass/maps/_sprite.scss`<br>
`file: src/sass/maps/_sprite-retina.scss`

Diese Maps werden über die `Grunt` Tasks automatisch erstellt. Dort werden Daten notiert wie die Bild Dimensionen, Dateinamen, bei Sprites wird die Position auf der Map gespeichert.

Über die Image Mixins wird auf diese Maps zugegriffen.

#### Connectmap
`file: src/sass/maps/_connectmap.scss`

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
`file: src/sass/maps/_zmap.scss`

Die unterschiedlichen Z-Indexes werden auf der Map notiert.

```scss
$kittn-zlayer-map: (
  'default': 10
);
```

---

### Helper

#### BEM
`file: scr/sass/framework/helper/_bem.scss`

Diese BEM Mixins verwenden die in `$kittn-bem` eingestellten Prefixes. Ob man diese Mixins verwendet oder nativ seine Selektoren schreiben, bleibt dem Developer überlassen.

##### element <small>(m)</small>
Build a BEM Element, will add the defined BEM Prefixes.

- @requires `$kittn-bem`
- @param {*} `$name` - Selector name

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

##### modifier <small>(m)</small>
Build a BEM Modifier, with an optional extend functionality

- @requires `$kittn-bem`
- @param {*} `$name` - The selector name
- @param {bool} `$extend` (false) - If the Modifier need to be extended with parent

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

##### chainroot <small>(m)</small>
Setup the Root Element for the chained Modifers. Must be included in a Selector.

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

##### chain <small>(m)</small>
Chain the Modifiers in a more simple way.

- @requires `$kittn-bem`
- @param {string} `$name` - Selector name

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
`file: scr/sass/framework/helper/_connect.scss`

Über die Connect Mixins ist es möglich Styles vorzudefienieren und diese Styles dann entweder mittels `@extend` zu verbinden oder den Style direkt in den Selektor zu laden (z.B. wenn man sich in einem MQ aufhält).

Wenn in der `$kittn-connect-map` Map Styles definiert wurden, werden Silent Selectors generiert.

##### connect-Gen <small>(m)</small>
Damit werden die Selectoren verknüpft oder 'ausgeladen'.

- @access `private`
- @requires `$kittn-connect-map`
- @param {list} `$key` - Tageted Styles, can be more than one
- @param {bool} `$extend` (true) - On `false` the Style will be directly yielded in the selector.
- @param {map} `$map` ($kittn-connect-map) - Connect Map

##### connect-Yield <small>(m)</small>
Das Mixin generiert aus den Elementen der `$kittn-connect-map` Map, Placeholder Selectors. Die dann mittels dem `connect` Mixin mit bestehenden Klassen verbunden werden.

- @access `private`
- @requires `$kittn-connect-map`
- @param {map} `$map` ($kittn-connect-map) - Connect Map

```scss
// Map
// file: src/sass/maps/connectmap.scss

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
```

```scss
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

##### connect <small>(m)</small>
Mit dem Connect Mixin können bestehende Elemente mit den Placeholder entweder verbunden werden, oder der Style kann in das Element direkt integriert werden.

- @requires `$kittn-connect-map`
- @param {list} `$key` - Tageted Styles, can be more than one
- @param {bool} `$extend` (true) - On `false` the Style will be directly yielded in the selector.
- @param {map} `$map` ($kittn-connect-map) - Connect Map

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

##### ff <small>(f)</small>
Mittels der `ff` Funktion kann man sich einen Fontstack aus der Map herauspicken und einfügen, zusätzlich kann man eigene Font Families anhängen.

- @requires `$kittn-fontstack-map`
- @param {*} `$family` - FontStack Family
- @param {argList} `$append` - The Fonts that need to be prepended

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

##### font-family <small>(m)</small>
Ist mehr ein Alias der FF Funktion, dieses mal als Mixin.

- @requires `$kittn-fontstack-map`
- @param {*} `$family` - FontStack Family
- @param {argList} `$append` - The Fonts that need to be prepended

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

##### fontface <small>(m)</small>
Das Mixin generiert die Fontfaces, fügt bei Bedarf noch einen zusätzlichen SVG Fontstack ein - der auf Windows Plattformen für besseres Fontrendering sorgt (Firefox, Chrome)

- @requires `$kittn-directorys`
- @param {*} `$filename` - The Filename of the Fontname
- @param {*} `$fontname` - The Desired Fontname
- @param {*} `$fontweight` (normal) - Fontweight
- @param {*} `$fontstyle` (normal) - Fontstyle
- @param {bool} `$svgoption` (true) - Activate the addition route to the SVG Font

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

##### fontface-generator <small>(m)</small>
Der Generator generiert über die `$kittn-fontface-map` Map eine Reihe von Fontfaces. Der Generator steht fast am Anfang, Fontfaces werden im CSS immer an erster Stelle implementiert.

- @access `private`
- @requires `$kittn-fontface-map`

```scss
// Map
// file: src/sass/setup.scss

$kittn-fontface-map: (
  'ownfont': (
    filename: false,
    weight: normal,
    style: normal,
    svgoption: false
  )
);
```

```scss
// Example
@include fontface-generator();

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
`file: scr/sass/framework/helper/_helper.scss`

##### strip-units <small>(f)</small>
Entfernt die Units von Values

- @param {Number} `$number` - Value
- @returns {Number}

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

##### unit-check <small>(f)</small>
Fügt die default Unit an Unitless Values an.

- @requires `$kittn-default-unit`
- @param {Number} `$number` - Value
- @returns {Number}

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

##### calc <small>(m)</small>
Um die CSS Calc Funktion Browserüberbreifend zu verwenden (weil in diesem Fall der Autoprefixer nicht aktiv wird), behilft man sich mit dem Mixin.

- @param {*} `$property` - Property that calculated
- @param {*} `$expression` - Formula (need to be quoted)

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

##### clamp <small>(f)</small>
Mit dieser Funktion begrenzt man Zahlenwerte.

- @param {Number} `$value` - The Value that need to be clamped
- @param {Number} `$min` - The posible minimal value
- @param {Number} `$max` - The possible max Value
- @returns {Number} - Clamped Value

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

##### cp <small>(f)</small>
Der Colorpicker ist mit der Color Map (`$kittn-color-map`) verbunden und holt damit die entsprechenden Color Values.

> Die Keywords der Farben müssen gequotet notiert werden.

- @requires `$kittn-color-map`
- @param {*} `$target` - Desired color
- @param {map} `$map` - Color Map
- @returns {Color}

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

##### spacer <small>(f)</small>
Das Spacer-Mixin generiert anhand der Global Spacing Unit Größen.

- @requires `$kittn-global-spacing`
- @param {Number} `$lines` - Multiplicator for Spacing
- @param {Bool} `$hard` (false) - For including an `!important`
- @param {Number} `$size` ($kittn-global-spacing) - Connection to the Base Spacing

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

##### s <small>(f)</small>
Selbiges wie oben, mit dem Unterschied das diese Funktion per Default keine Units integriert. Wird häufig für interne Mixins verwendet.

- @requires `$kittn-global-spacing`
- @param {Number} `$lines` - Multiplicator for Spacing
- @param {Bool} `$imp` (false) - For including an !important
- @param {*} `$u` (false) - Unit
- @param {Number} `$size` ($kittn-global-spacing) - Connection to the Base Spacing
- @returns {Number}

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
`file: scr/sass/framework/helper/_typechecks.scss`

##### is-true <small>(f)</small>
Prüft ob ein Wert übergeben wurde

- @param {*} `$value` - Value to check
- @returns {Bool}

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

##### is-map <small>(f)</small>
Prüft ob es sich um eine Map handelt.

- @param {*} `$value` - Value to check
- @returns {Bool}

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

##### is-list <small>(f)</small>
Prüft ob es sich um eine Liste handelt.

- @param {*} `$value` - Value to check
- @returns {Bool}

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

##### is-number <small>(f)</small>
Prüft ob es sich um eine Nummer handelt.

- @param {*} `$value` - Value to check
- @returns {Bool}

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

##### is-string <small>(f)</small>
Prüft ob es sich um einen String handelt.

- @param {*} `$value` - Value to check
- @returns {Bool}

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

##### is-not-string <small>(f)</small>
Prüft ob es sich **nicht** um einen String handelt.

- @param {*} `$value` - Value to check
- @returns {Bool}

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

##### is-nested <small>(f)</small>
Prüft ob der Selektor verschachtelt wurde.

- @returns {Bool}

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

##### map-filled <small>(f)</small>
Überprüft ob die Map gefüllt wurde.

- @param {*} `$value` - Value to check
- @returns {Bool}

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
`file: scr/sass/framework/helper/_jacket.scss`

Nähere [Informationen](https://github.com/Team-Sass/jacket)

#### Sassylists
`file: scr/sass/framework/helper/_sassylists.scss`

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
`file: scr/sass/framework/helper/_debug.scss`

Bei Aktivieren werden mögliche Fehler im CSS visuell hervorgehoben.

`rot` = Fehler<br>
`gelb` = Zu Überprüfen

- @requires '$kittn-activate'

---

### Modules

#### Breakpoints
`scr/sass/framework/modules/_breakpoints.scss`

##### bp <small>(f)</small>
Wählt anhand des Breakpoint-Key, die entsprechende Größe aus der Breakpoint-Map.

- @requires `$kittn-breakpoint-map`
- @param {*} `$target` - The required Breakpoint
- @param {Map} `$entrys` ($kittn-breakpoint-map) - Connection to the Breakpoint Map
- @returns {Number}

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

##### break <small>(m)</small>
Generiert MediaQueries. Wenn Mobile First aktiviert wurde (`$kittn-activate`), arbeiten die MQs per Default immer mit `min` Werten. Im Mode `between` wird das Mixin die zwei Größen zudem immer immer aufsteigend Sortieren.

- @requires `$kittn-breakpoint-map`, `$kittn-activate`
- @param {*} `$target` - Required Breakpoint
- @param {*} `$mode` - Media Query Mode. Values: `between`, `max`, `min`, `auto` (default - setup with mobile-first:true/false)
- @param {Map} `$list` ($kittn-breakpoint-map) - Connection to the Breakpoint Map

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

##### eq <small>(m)</small>
Mixin für das [ElementQueries](https://github.com/snugug/eq.js) Script, von Sam Richard.

- @param {argList} $states - The Different Querie Types

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

##### visibility <small>(m)</small>
Generiert Visibilty/Hidden Classes basierend auf der `$kittn-breakpoint-map` Map. Es werden dabei aber nur Classen generiert wenn diese in der Map mit `visibility: true` eingetragen wurden.

- @requires `$kittn-breakpoint-map`

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
```

```scss
// Example
@include visibility;

// Result
.hidden-to--1 {
  display: none;
}
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
  display: none;
}
@media screen and (min-width: 320px) {
  .visible-from--1 {
    display: inherit;
  }
}
```

#### Colors
`scr/sass/framework/modules/_color.scss`<br>

##### tint <small>(f)</small>
Mischt eine Farbe mit Weiß

- @param {Color} `$color` - The Color value
- @param {Number} `$amount` - The Mix Value
- @param {color} `$tint-color` (#fff) - Mix Color
- @returns {Color}

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

##### shade <small>(f)</small>
Mischt eine Farbe mit Schwarz

- @param {Color} `$color` - The Color value
- @param {Number} `$amount` - The Mix Value
- @param {color} `$shade-color` (#000) - Mix Color
- @returns {Color}

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

##### luma <small>(f)</small>
Berechnet die Helligkeit einer Farbe.

- @param {Color} `$color` - Color Value
- @returns {Number}

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

##### luma-gte <small>(f)</small>
Liefert `true` zurück wenn Farbe 1 heller ist als Farbe 2

- @param {Color} `$color1` - Color Value
- @param {Color} `$color2` - Color Value
- @returns {Bool}

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

##### luma-lte <small>(f)</small>
Liefert `true` zurück wenn Farbe 1 kleiner ist als Farbe 2

- @param {Color} `$color1` - Color Value
- @param {Color} `$color2` - Color Value
- @returns {Bool}

```scss
// Example
$color-1: red;
$color-2: blue;

.color {
  @if luma-lte($color-1, $color-2) {
    content: 'true'
  }
}
```

##### luma-diff <small>(f)</small>
Berechnet die Differenz zwischen zwischen zwei Farbwerten.

- @param {Color} `$color1` - Color Value
- @param {Color} `$color2` - Color Value
- @returns {Bool}

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

##### _color <small>(m)</small>_
Zieht Werte aus der Color Map. In dem Mixin ist ebenso ein Fallback für IE integriert - wenn Farben Opacity Werte aufweisen.

- @access private
- @requires `$kittn-color-map`
- @param {*} `$target` - Color Key from Map
- @param {*} `$attrib` (color) - The Color Attribute
- @param {Bool} `$imp` (false) - For !important setting
- @param {Map} `$map` (stylecolors) - Color Map

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

##### get-c <small>(m)</small>
Generiert auf dem gewählten Farbwert die Textfarbe.

- @requires `$kittn-color-map`
- @param {*} `$target` - The Color Key
- @param {Bool} `$hard`- For !important setting

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

##### color <small>(m)</small>
Alias Mixin von `get-c`

##### get-bc <small>(m)</small>
Generiert aus dem gewählten Farbwert die Hintergrundfarbe

- @requires `$kittn-color-map`
- @param {*} `$target` - The Color Key
- @param {Bool} `$hard`- For !important setting

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

##### background-color <small>(m)</small>
Alias Mixin von `get-bc`

##### colorgenerator <small>(m)</small>
Generiert aus der `$kittn-color-map` Map Farbklassen, entweder `silent` oder als Klasse. In der `$kittn-color-generator` findet man die erforderlichen Einstellungen.

- @access private
- @requires `$kittn-color-map`, `$kittn-color-generator`
- @type {Map} `$colors` - The Desired Map

```scss
// Map
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
```

Mit `type` bestimmt man die Art der ColorPlaceholder:
- `c` Color
- `b` Background-Color
- `bc` Background-Color & Color

```scss
// Example
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

##### ext-c <small>(m)</small>
Verbindet Elemente mit der gewählten Farbe (`color`) - der Colorgenerator muss dafür aber die ColorPlaceholder generiert haben, ansonsten lädt das Mixin die Farbe direkt in das Element.

- @requires `$kittn-color-generator`
- @param {*} `$name` - Color Key

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

##### ext-bc <small>(m)</small>
Verbindet Elemente mit der gewählten Farbe (`background-color`) - der Colorgenerator muss dafür aber die ColorPlaceholder generiert haben, ansonsten lädt das Mixin die Farbe direkt in das Element.

- @requires `$kittn-color-generator`
- @param {*} `$name` - Color Key

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
`file: scr/sass/framework/modules/_dimensions.scss`<br>

##### size <small>(m)</small>
Implementiert die Dimensionen eines Elements.

- @param {List} `$size` - Size can be includes with a Single Value (square) or with two value 'width' & 'height'
- @param {Bool} `$lineheight` (false) - On 'true' lineheight will be set to the same $size, otherwise use a Number

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

##### align-height <small>(m)</small>
Shorthand um Höhe und Line-Height über ein Value zu übermitteln.

- @param {Number} `$height` - Heightvalue
- @param {Number} `$factor` - The multiply factor

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

##### align-fontsize <small>(m)</small>
Shorthand um Font-Size und Line-Height über ein Value zu übermitteln.

- @param {Number} `$size` - Fontsize
- @param {Number} `$factor` - The multiply factor

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

##### center <small>(m)</small>
Zentriert, mittelt und gibt einem Element eine Größe

- @param {List} `$size` - Dimensions

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

##### perfect-circle <small>(m)</small>
Passt den Border-Radius an die Größe des Elements an.

- @param {Number} `$size` - The Size of the Circle

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

##### ratio <small>(m)</small>
Stellt bei einem Element das Breiten und Größenverhältniss gemäß der Ratio ein.

- @param {list} `$ratio` (1) - Ratio between width and height
- @param {string} `$selector` (false) - Target selector

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

##### unratio <small>(m)</small>
Entfernt bestehende Ratios wieder.

- @param {string} `$selector` (false) - Target selector

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

##### tighten-up <small>(m)</small>
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

##### text-middle <small>(m)</small>
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
`file: scr/sass/framework/modules/_grid.scss`

##### grid-size <small>(f)</small>
Berechnet die Breite der Colums

- @param {Number} `$colums` - Colums
- @param {Number} `$maxColums` - Max Colums
- @returns {Number} - Percentage Value

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

##### grid-adaptive <small>(m)</small>
Die Seitenbreite verändert sich damit Adaptiv. Der jeweilige Threshold wird über `$kittn-breakpoint-map` eingestellt in dem bei Breakpoint `step` auf `true` gestellt wird. Die Reihenfolge der MediaQueries richtet sich nach `$kittn-activate(mobile-first)`.

_Das Mixin muss in einem Selektor aufgerufen werden._

- @requires `$kittn-breakpoint-map`

```scss
// Map
// file: src/sass/setup.scss
$kittn-breakpoint-map: (
  1: (
    size: 320px,
    visibility: true,
    step: true, // Trigger for 'grid-adaptive'
    fontsize: false
  ),
  2: (
    size: 480px,
    visibility: false,
    step: false, // Trigger for 'grid-adaptive'
    fontsize: 80
  ),
  3: (
    size: 560px,
    visibility: false,
    step: true, // Trigger for 'grid-adaptive'
    fontsize: false
  )
);
```

```scss
// Example
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

##### grid-container <small>(m)</small>
Generiert den Seiten Container, der zum einen die Seite im Viewport positioniert (default: center), zum anderen bestimmt er die Seitenbreite.

Wenn man das `grid-adaptive` Mixin verwendet wird, sollte die Seitenbreite deaktiviert werden.

- @param {Map} `$container`
  - {List|Bool} `width` - Bei einem Wert ist der Container Statisch, zwei Werte geben min und max vor, kann auch auf `false` gestellt werden.
  - {*} `pos` - Position des Container. Values: `center`, `left`,  `right`
  - {Number} `gutter` - Nur aktiv wenn `pos: left` oder `pos:right` eingestellt wurde, der Gutter bestimmt dann den Abstand zum Viewport.
  - {Bool} `static-ie` - Wenn aktiviert, bekommt der IE8 einen statischen Seitencontainer.

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

##### grid-row <small>(m)</small>
Über die `rows` wird das Display Verhalten der einzelnen `colums` eingestellt. zusätzlich wird dafür gesorgt das Floats nicht überlaufen.

- @param {Map} `$row`
  - {Number} `spacing` - Seitlicher Abstand
  - {*} `layout` -  Values: `block`, `inline`, `table`, `flex`
  - {*} `valign` - Gilt nur bei `layout:inline`. Values: `top`, `bottom`, `baseline`, `middle`
  - {*} `align` - Values: `justify`, `center`, `right`, `left`

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

##### grid-colum <small>(m)</small>
Bildet den Basisstyle für alle `colums`.

- @requires `$kittn-bem`
- @param {Map} `$colums`
  - {Number} `spacing` - Seitlicher Abstand
  - {*} `layout` - Values: `block`, `inline`, `table`, `flex`
  - {Bool} `extras` - Inkludiert Extra Klassen für die Colums
  - {*} `valign` -  Gilt nur bei `layout:inline`. Varianten: `top`, `bottom`, `baseline`, `middle`
  - {*} `align` - Values: `justify`, `center`, `right`, `left`

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

##### grid-size <small>(m)</small>
Definiert die Breite einer Colum.

- @param {Map} `$grid`
  - {Number} `size` - Spaltenbreite
  - {Number} `max` - Die maximale Anzahl an Spalten (als Berechnungsgrundlage)
  - {Bool} `flex` - Aktiviert die Flexbox Funktion

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

##### pixel-grid <small>(m)</small>
Definiert die Breite einer Colum in Pixel.

-@param {Map} `$grid`
  - {Number} `size` - Spaltenbreite
  - {Number} `max` - Die maximale Anzahl an Spalten
  - {Number} `margin` - Seitlicher Abstand
  - {Number} `space` - Breite des äußeren Wrappers

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

##### grid-generator <small>(m)</small>
Generiert eine definierte Anzahl von Colums

- @requires `$kittn-bem`
- @param {Map} `$generator`
  - {Number} `colums` - Maximale Colums
  - {bool|list} `select` - Hier kann spezifiziert werden welche Colums generiert werden sollen
  - {bool|*} `name` - Wenn das Mixin nicht innerhalb einer Klasse aufgerufen wird, kann man den Selektor übermitteln
  - {bool|*} `extend` - Damit werden die generierten Klassen mit anderen Klassen verbunden.

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

##### grid-devide <small>(m)</small>
Das Mixin kann ein bestehendes Grid 'teilen', ein 12er Grid kann damit in eine 6er Grid umgewandelt werden. Funktioniert aber nur wenn nicht Mobile-First gearbeitet wird.

- @requires `$kittn-bem`
- @param {Map} `$devide`
  - {Number} `colums` - Maximale Colums
  - {Bool|*} `name` - Wenn das Mixin nicht innerhalb einer Klasse aufgerufen wird, kann man den Selektor übermitteln
  - {Number} `devide` - Teiler

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

##### grid-offset <small>(m)</small>
Generiert den Offset

- @param {Map} `$offset`
  - {Number} `size` - Spaltenanzahl
  - {Number} `max` - Die maximale Anzahl an Spalten
  - {*} `direction` - Values: `left`, `right`

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

##### grid-offset-generator <small>(m)</small>
Generiert die Offset Klassen.

- @requires `$kittn-bem`
- @param {Map} `$offset`
  - {Number} `max` - Maximale Anzahl an Spalten
  - {Bool|*} `name` - Wenn das Mixin nicht innerhalb einer Klasse aufgerufen wird, kann man den Selektor übermitteln

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

##### grid-pushpull <small>(m)</small>
Generiert Push and Pull Sizes

- @param {Map} `$pushpull`
  - {Number} `size` - Spaltenanzahl
  - {Number} `max` - Maximale Anzahl an Spalten
  - {*} `direction` - Values: `push`, `pull`
  - {Bool|*} `extend` - Die generierten Klassen werden mit anderen Klassen verbunden.

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

##### grid-pushpull-generator <small>(m)</small>
Generiert eine bestimmte Anzahl an Push and Pull Klassen.

- @requires `$kittn-bem`
- @param {Map} `$pushpull`
  - {Number} `max` - Maximale Anzahl an Spalten
  - {Bool|*} `name` - Wenn das Mixin nicht innerhalb einer Klasse aufgerufen wird, kann man den Selektor übermitteln
  - {Bool|*} `extend` - Die generierten Klassen werden mit anderen Klassen verbunden.

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

##### grid-normalizer <small>(m)</small>
Über den Normalizer können die spezifischen Einstellungen wieder resetet werden.

- @requires `$kittn-bem`
- @param {Map} `$normalize`
  - {*} `name` - Name des Selectors der Reseted werden soll
  - {*} `option` - Values: `blockgrid`, `inlinetable`, `offset`, `pushpull`
  - {Bool} `important` - Fügt !important an

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
`file: scr/sass/framework/modules/_iconfont.scss`

##### icon <small>(f)</small>
Bezieht den Content Code aus der Iconfont Map.

- @requires `$kittn-font-icons`
- @param {*} `$name` - Key to the Map Entry
- @returns {*}

```scss
// Map
// file: src/sass/maps/iconfontlist.scss

$kittn-font-icons: (
  test: '/e023'
);
```

```scss
// Example
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

##### iconfont <small>(m)</small>
Generiert den Basisstyle für alle Icons.

- @access private
- @param {*} `$iconFontName` - Name off the Icon Font

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
  line-height: 1;
}
.test:before {
  content: "/e023";
}
```

##### icon-font-generator <small>(m)</small>
Generiert den Basis Icon-Font Style.

- @requires `$kittn-iconfont`, `$kittn-bem
- @param {*} `$iconFontName` - Name off the Icon Font

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

##### icon-generator <small>(m)</small>
Generiert sämtliche Icons der Icon-Map als Klassen.

- @requires `$kittn-font-icons`, `$kittn-iconfont`
- @param {Map} `$icons` ($kittn-font-icons) - Icon Font Map

```scss
// Example
@include icon-generator;

// Result
.f-icon__test:before {
  content: "/e023";
}
.f-icon__logo:before {
  content: "/e024";
}
```

##### icon <small>(m)</small>
Fügt Icon Inhalte in eine Klasse.

- @param {*} `$name` - Key to the Map Entry
- @param {Map} `$options`
  - {Bool|*} `extend` (false) - When the Icon need Extend with a Class
  - {Bool|*} `font` (false) - When the Icon need the Iconfont Attributes. Needed when sitting in a Media Query

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
  line-height: 1;
}
.test:before {
  content: "/e023";
}
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
  content: "/e024";
}
```

##### ext-icon <small>(m)</small>
Erweitert eigene Klassen mit den Iconklassen.

- @requires `$kittn-bem`, `$kittn-iconfont`
- @param {*} $name - Name off the Icon (from the Map)

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
`file: scr/sass/framework/modules/_images.scss`

##### _getImageDimensions <small>(m)</small>
Wird für die interne Berechnung der Bilddaten verwendet.

- @access private

##### image <small>(m)</small>
Fügt die Single Images ein. Die erforderlichen Daten werden dabei über die `Gulp` Tasks in die jeweilige Imagemap geschrieben.

- @requires `$kittn-directorys
- @param {*} `$image` - Name of the Image
- @param {*} `$dimensions` - 'both' = height & width, 'width' = width, 'height' = height
- @param {*} `$pos` - The Image Position - can be 'false'
- @param {Bool} `$retina` - With set on 'true' the retina fallback will be included

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
  height: 176px;
}
.box-2 {
  background-image: url("/assets/img/single/icon.png");
  background-repeat: no-repeat;
  width: 281px;
}
```

##### texture <small>(m)</small>
Fügt die Texture Images ein.

- @requires `$kittn-directorys
- @param {*} `$image` - Name of the Image
- @param {*} `$repeat` - How the Image would be repeated. `x`: repeat-x, `y`: repeat-y
- @param {List|Bool} `$pos` - The Image Position - can be `false`
- @param {Bool} `$retina` - With set on 'true' the retina fallback will be included

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

##### svgpng <small>(m)</small>
Fügt SVG Images ein, integriert dabei auch das Fallback Image.

- @requires `$kittn-directorys
- @param {*} `$image` - Name of the Image - the SVG File must be in the Same directory
- @param {*} `$dimensions` - 'both' = height & width | 'width' = width | 'height' = height
- @param {List} `$pos` - The Image Position - can be 'false'

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
  background-size: 1019px 357px;
}
```

##### svg <small>(m)</small>
Für SVG Images ohne Fallback ein.

- @requires `$kittn-directorys
- @param {*} `$image` - The Name of the SVG Image
- @param {List} `$dimensions`  - The Dimensions of the Image Container - can be 100%
- @param {List} `$pos` - Native CSS Image Positions
- @param {Bool} `$repeat` - Image Repeat - native CSS Declaration

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
  background-size: 100% 100%;
  width: 100%;
  height: 100%;
}

.repeat-vector {
  background-image: url("/assets/img/svgonly/illu.svg");
  background-repeat: repeat-x;
  background-size: 100% 100%;
  width: 100%;
  height: 100%;
}

.resize-vector {
  background-image: url("/assets/img/svgonly/illu.svg");
  background-repeat: no-repeat;
  background-size: 40px 30px;
  width: 40px;
  height: 30px;
}
```

##### sprite-generator <small>(m)</small>
Generiert den SpriteMap Container. Wird automatisch zu geschaltet.

- @access private
- @requires `$kittn-sprite`

##### sprite <small>(m)</small>
Fügt das gewünschte Sprite ein.

- @param {*} `$name` - Name of the Sprite
- @param {Bool} `$retina` - With set on `true` the retina fallback will be included
- @param {*} `$dimensions` - `both`: height & width, `width`: width, `height`: height
- @param {Number} `$offset-x` - Offset the Background Position on the x axis
- @param {Number} `$offset-y` - Offset the Background Position on the y axis
- @param {*} `$display` - The display mode

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
    background-size: 590px 466px;
  }
}
```

#### Lines
`file: scr/sass/framework/modules/_lines.scss`

##### rem <small>(f)</small>
Rechnet Px in REM um.

- @requires `$kittn-typo`
- @param {Number} `$px` - The Size in PX
- @param {Number} `$base` - The Base for the

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

##### remsize <small>(m)</small>
Berechnet Größen anhand der Base Line-Height. Die Umberechnung findet aber nur statt wenn in der `$kittn-typo` die `unit` auf `rem` gestellt wurde. IE8 erhält sein eigenes Fallback mittels PX Werten.

- @access private
- @requires `$kittn-typo`
- @param {*} `$arg` - Attribute
- @param {Number} `$size` - Multiplicator

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

##### pxsize <small>(m)</small>
Berechnet PX Werte in REM um. Die Umberechnung findet aber nur statt wenn in der `$kittn-typo` die `unit` auf `rem` gestellt wurde. IE8 erhält sein eigenes Fallback mittels PX Werten.

- @access private
- @requires `$kittn-typo`<br>
- @param {*} `$arg` - Attribute
- @param {Number} `$size` - Value

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

##### rem <small>(m)</small>
Berechnet die Größen Dynamisch. Dabei kann die Größe einmal über Lines (berechnung mittel Multiplikation der Baselineheight), oder über Pixel erfolgen die dann in REM umgerechnet werden. IE8 erhält bei aktiver IE8 Kompatiblität einen Pixel Fallback.

- @param {*} `$arg` - Attribute
- @param {Number} `$size` - Size
- @param {Bool} `$baseline` - When 'true', the Value follow the Baselinerule

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

##### lineheight <small>(m)</small>
Basiert auf dem `rem` Mixin.

- @param {Number} `$size` - Size

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

##### marginbottom <small>(m)</small>
Basiert auf dem `rem` Mixin.

- @param {Number} `$size` - Size

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

##### margintop <small>(m)</small>
Basiert auf dem `rem` Mixin.

- @param {Number} `$size` - Size

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

##### marginleft <small>(m)</small>
Basiert auf dem `rem` Mixin.

- @param {Number} `$size` - Size

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

##### marginright <small>(m)</small>
Basiert auf dem `rem` Mixin.

- @param {Number} `$size` - Size

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

##### paddingtop <small>(m)</small>
Basiert auf dem `rem` Mixin.

- @param {Number} `$size` - Size

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

##### paddingbottom <small>(m)</small>
Basiert auf dem `rem` Mixin.

- @param {Number} `$size` - Size

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

##### paddingleft <small>(m)</small>
Basiert auf dem `rem` Mixin.

- @param {Number} `$size` - Size

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
##### paddingright <small>(m)</small>
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

##### height <small>(m)</small>
Basiert auf dem `rem` Mixin.

- @param {Number} `$size` - Size

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

##### fontsize <small>(m)</small>
Basiert auf dem `rem` Mixin.

- @param {Number} `$size` - Size

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

##### fontcalc <small>(m)</small>
Basiert auf dem `rem` Mixin. Berechnet neben der Fontsize auch die Line-Height

- @param {Number} `$fontsize` - Font Size
- @param {Bool|Number} `$lineheight` (false) - Lineheight for the Font - can be false than used the factor
- @param {Number} `$factor` (1.2) - The Calculationfactor

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
`file: scr/sass/framework/modules/_modernizr.scss`

##### Modernizr <small>(m)</small>
Über die integrierten Feature-Check Klassen von Modernizr, kann man Fallbacks integrieren.

- @access private

##### yep <small>(m)</small>
Wird aktiv bei positiven Feature-Check Klassen.

- @param {argList} `$features` - Checked Features 

```scss
// Example
.test {
  @include yep(box-shadow) {
    box-shadow: 0 0 3px rgba(0,0,0,0.5);
  }
}

// Result
.box-shadow .test {
  box-shadow: 0 0 3px rgba(0, 0, 0, 0.5);
}
```

##### nope <small>(m)</small>
Wird aktiv bei negativen Feature-Check Klassen

- @param {argList} `$features` - Checked Features 

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
`scr/sass/framework/modules/_positioning.scss`

##### z <small>(f)</small>
Pickt den entsprechenden Z-Index auf der zlayer Map.

- @requires `$kittn-zlayer-map`
- @param {*} `$layer` - The layer to use
- @param {Map} `$z-layers` ($kittn-zlayer-map) - Connection through Z-Map
- @returns {Number}

```scss
// Example
.z {
  z-index: z(default);
}

// Result
.z {
  z-index: 10;
}
```

##### z <small>(m)</small>
Pickt den entsprechenden Z-Index von der Map, generiert dabei einen Z-Index den man mit Offset noch manipulieren kann.

- @requires `$kittn-zlayer-map`
- @param {*} `$layer` - The layer to use
- @param {Number} `$offset` - Add or substract an offset

```scss
// Example
.z {
  @include z(default);
}
.z-offset {
  @include z(default, 5);
}
.z-negative-offset {
  @include z(default, -2);
}

// Result
.z {
  z-index: 10;
}
.z-offset {
  z-index: 15;
}
.z-negative-offset {
  z-index: 8;
}
```

##### shift <small>(m)</small>
Vergibt dem Element einen Z-Index und bestimmt auch die Positionsart.

- @param {Number} `$index` - Z-index
- @param {Number} `$offset` - Offset
- @param {Bool|*} `$position` - Position. Values: `r` relative, `a` absolute, `f` fixed

```scss
// Example
.z-1 {
  @include shift(10)
}
.z-2 {
  @include shift(10,0,r)
}
.z-3 {
  @include shift(z(default), 4, a);
}

// Result
.z-1 {
  z-index: 10;
}
.z-2 {
  position: relative;
  z-index: 10;
}
.z-3 {
  position: absolute;
  z-index: 14;
}
```

##### set-position <small>(m)</small>
Stellt die Position für die Position Mixins ein.

- @access private
- @param {List} `$position`
  - Ein Position Value: `top`
  - Zwei Position Values: `top`, `left`
  - Vier Position Values: `top`, `right`, `bottom`, `left`

Das Mixin wertet Werte wie `0` nicht aus, sie dient nur als Platzhalter. Möchte man die Position auf `0` setzen trägt man `z` für Zero ein.

##### relative <small>(m)</small>
Stellt das Element auf `Position: Relative`

- @param {List} `$position`
  - Ein Position Value: `top`
  - Zwei Position Values: `top`, `left`
  - Vier Position Values: `top`, `right`, `bottom`, `left`
  
```scss
// Example
.test-1 {
  @include relative;
}
.test-2 {
  @include relative(10);
}
.test-3 {
  @include relative(1rem 10 0 4%);
}
.test-z {
  @include relative(1rem z z 4%);
}

// Result
.test-1 {
  position: relative;
}
.test-2 {
  position: relative;
  top: 10px;
}
.test-3 {
  position: relative;
  top: 1rem;
  right: 10px;
  left: 4%;
}
.test-z {
  position: relative;
  top: 1rem;
  right: 0;
  bottom: 0;
  left: 4%;
}
```

##### absolute <small>(m)</small>
Stellt das Element auf `Position: Absolute`

- @param {List} `$position`
  - Ein Position Value: `top`
  - Zwei Position Values: `top`, `left`
  - Vier Position Values: `top`, `right`, `bottom`, `left`

```scss
// Example
.test-1 {
  @include absolute;
}
.test-2 {
  @include absolute(10 2%);
}
.test-3 {
  @include absolute(20 10 z 4%);
}

// Result
.test-1 {
  position: absolute;
}
.test-2 {
  position: absolute;
  top: 10px;
  left: 2%;
}
.test-3 {
  position: absolute;
  top: 20px;
  right: 10px;
  bottom: 0;
  left: 4%;
}
```

##### fixed <small>(m)</small>
Stellt das Element auf `Position: Fixed`

- @param {List} `$position`
  - Ein Position Value: `top`
  - Zwei Position Values: `top`, `left`
  - Vier Position Values: `top`, `right`, `bottom`, `left`
  
```scss
// Example
.test-1 {
  @include fixed;
}
.test-2 {
  @include fixed(10 2%);
}
.test-3 {
  @include fixed(z z);
}

// Result
.test-1 {
  position: fixed;
}
.test-2 {
  position: fixed;
  top: 10px;
  left: 2%;
}
.test-3 {
  position: fixed;
  top: 0;
  left: 0;
}
```

##### static <small>(m)</small>
Restet die Einstellungen der Position Mixins.

```scss
// Example
.reset {
  @include static;
}

// Result
.reset {
  position: static;
  left: inherit;
  right: inherit;
  top: inherit;
  bottom: inherit;
}
```

##### bar <small>(m)</small>
Generiert ein Bar Element.

- @param {*} `$variant`  - `f` for fixed, `a` for absolute
- @param {*} `$position` - `t` Top, `b` Bottom, `l` Left, `r` Right
- @param {Number} `$z-index` - The Z-Index

```scss
// Example
.bar-left {
  @include bar(f, l);
}
.bar-top {
  @include bar(a, t);
}

// Result
.bar-left {
  position: fixed;
  z-index: 9000;
  left: 0;
  top: 0;
  height: 100%;
}
.bar-top {
  position: absolute;
  z-index: 9000;
  top: 0;
  left: 0;
  width: 100%;
}
```

##### bar-top <small>(m)</small>
Generiert ein Bar Element - Top Position.

- @param {value} `$z` - The Z-Index
- @param {*} `$variant` - `f`: fixed, `a`: absolute

```scss
// Example
.bar {
  @include bar-top;
}
.bar-2 {
  @include bar-top($variant: a);
}

// Result
.bar {
  position: fixed;
  z-index: 9000;
  top: 0;
  left: 0;
  width: 100%;
}
.bar-2 {
  position: absolute;
  z-index: 9000;
  top: 0;
  left: 0;
  width: 100%;
}
```

##### bar-bottom <small>(m)</small>
Generiert ein Bar Element - Bottom Position.

- @param {value} `$z` - The Z-Index
- @param {*} `$variant` - `f`: fixed, `a`: absolute

```scss
// Example
.bar {
  @include bar-bottom;
}
.bar-2 {
  @include bar-bottom(10, a);
}

// Result
.bar {
  position: fixed;
  z-index: 9000;
  bottom: 0;
  left: 0;
  width: 100%;
}
.bar-2 {
  position: absolute;
  z-index: 10;
  bottom: 0;
  left: 0;
  width: 100%;
}
```

##### position-translate <small>(m)</small>

Wird für die Beerechnng des `pivot-points` benötigt.

- @access private
- @param  {*|number|bool} `$pos` - Position Value. Values: `left`, `center`, `right`, `top`, `middle`, `bottom`
- @param  {*} `$axis` - The Position Axis. Values: `vert`, `horz`

##### pivot <small>(m)</small>
Positioniert den Punkt von dem die weitere Positionierung ausgeht.

- @param {*|number|bool} `$vert` (middle) - Vertical Position from the Pivot Point. Values: `top` ,`middle` ,`bottom`
- @param {*|number|bool} `$horz` (false)  - Horizontal Position from the Pivot Point. Values: `left`, `center`, `right`

```scss
// Example
.test-1 {
  @include pivot(middle);
}
.test-2 {
  @include pivot(middle,center);
}
.test-3 {
  @include pivot(70,center);
}

// Result
.test-1 {
  transform: translate(-50%, 0);
}
.test-2 {
  transform: translate(-50%, -50%);
}
.test-3 {
  transform: translate(-70%, -50%);
}
```

##### slide <small>(m)</small>
Verschiebt ein Element.

- @param {*|number|bool} `$vert` (middle) - Vertical Position from the Pivot Point. Values: `top` ,`middle` ,`bottom`
- @param {*|number|bool} `$horz` (false)  - Horizontal Position from the Pivot Point. Values: `left`, `center`, `right`

```scss
// Example
.slide-1 {
  @include slide(middle);
}
.slide-2 {
  @include slide(middle,center);
}
.slide-3 {
  @include slide(70,center);
}

// Result
.slide-1 {
  position: absolute;
  top: 50%;
}
.slide-2 {
  position: absolute;
  top: 50%;
  left: 50%;
}
.slide-3 {
  position: absolute;
  top: 70%;
  left: 50%;
}
```

##### pivot-center <small>(m)</small>
Positioniert ein Element in die absolute Mitte.

```scss
// Example
.center {
  @include pivot-center;
}

// Result
.center {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
```

##### absolute-middle <small>(m)</small>
Definiert die Größe eines Elements und positioniert es mittig. Eignet sich nicht für Elemente die ihre Dimension dynamisch ändern.

- @param {List} `$element` - Width and the Height of the Element

```scss
// Example
.middle-1 {
  @include absolute-middle;
}
.middle-2 {
  @include absolute-middle(100 300);
}

// Result
.middle-1 {
  height: 0px;
  width: 0px;
  position: absolute;
  left: 50%;
  top: 50%;
  margin-top: 0px;
  margin-left: 0px;
}
.middle-2 {
  height: 300px;
  width: 100px;
  position: absolute;
  left: 50%;
  top: 50%;
  margin-top: -150px;
  margin-left: -50px;
}
```

##### overlap <small>(m)</small>
Damit können Element andere Elemente seitlich überlappen.

- @param {list} `$size` - The Sidevalues, one value can be used for two sides, two values first for left second for right

```scss
// Example
.overlap-1 {
  @include overlap(20);
}
.overlap-2 {
  @include overlap(.5rem 10);
}

// Result
.overlap-1 {
  margin-left: -20px;
  margin-right: -20px;
}
.overlap-2 {
  margin-left: -0.5rem;
  margin-right: -10px;
}
```

#### Shorthands
`file: scr/sass/framework/modules/_shorthands.scss`

Regulär ist es empfehlenswert die Shorthand Mixins in ein Placeholder Selector zu laden und dann mittels `@extend` weiter zu arbeiten.

```scss
// Example
%clearfix {
  @include clearfix;
}
%center {
  @include block-center();
}

.test-1 {
  @extend %clearfix;
}
.colum {
  @extend %clearfix, %center;
}

// Result
.test-1:after, .colum:after {
  content: '';
  display: table;
  clear: both;
}

.colum {
  display: block;
  margin-left: auto;
  margin-right: auto;
}
```

##### clearfix <small>(m)</small>
Fügt den Clearfix ein.

```scss
// Example
.clearfix {
  @include clearfix;
}

// Result
.clearfix:after {
  content: '';
  display: table;
  clear: both;
}
```

##### block-center <small>(m)</small>
Zentriert ein Element.

```scss
// Example
.center {
  @include block-center();
}

// Result
.center {
  display: block;
  margin-left: auto;
  margin-right: auto;
}
```

##### word-wrap <small>(m)</small>
Bricht lange Wortketten um.

```scss
// Example
.test {
  @include word-wrap;
}

// Result
.test {
  -ms-word-break: break-all;
  word-break: break-all;
  word-break: break-word;
  -webkit-hyphens: auto;
  -moz-hyphens: auto;
  -ms-hyphens: auto;
  hyphens: auto;
}
```

##### text-truncate <small>(m)</small>
Bricht ebenfalls lange Wortketten um, dieses mal aber mit einer Ellipsis.

```scss
// Example
.test {
  @include text-truncate;
}

// Result
.test {
  max-width: 100%;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  word-wrap: normal;
}
```

##### vertical-center <small>(m)</small>
Positioniert Elemente mittig - das Parent Element muss dafür aber auf `display: table` gestellt werden.

```scss
// Example
.test {
  @include vertical-center;
}

// Result
.test {
  display: table-cell;
  vertical-align: middle;
}
```

##### cleartext <small>(m)</small>
Versteckt Textelemente.

```scss
// Example
.test {
  @include cleartext;
}

// Result
.test {
  background-color: transparent;
  border: 0;
  color: transparent;
  font: 0/0 a;
  text-shadow: none;
}
```

##### cleartext-complex <small>(m)</small>
Versteckt Textelemente.

```scss
// Example
.test {
  @include cleartext-complex;
}

// Result
.test {
  background-color: transparent;
  border: 0;
  overflow: hidden;
}
.test:before {
  content: '';
  display: block;
  width: 0;
  height: 150%;
}
```

##### cleartext-simpler <small>(m)</small>
Versteckt Textelemente.

```scss
// Example
.test {
  @include cleartext-simpler;
}

// Result
.test {
  text-indent: 100%;
  white-space: nowrap;
  overflow: hidden;
}
```

##### decollapse <small>(m)</small>
Verhindert das Margins kollabieren.

```scss
// Example
.test {
  @include decollapse;
}

// Result
.test {
  padding-top: 1px;
  margin-top: 1px;
}
```

##### performance <small>(m)</small>
Aktiviert die GL Beschleunigung.

```scss
// Example
.test {
  @include performance;
}

// Result
.test {
  transform: translate3d(0, 0, 0);
}
```

##### antialias <small>(m)</small>
Aktiviert Antialias - wirksam nur auf Chrome und Firefox.

```scss
// Example
.test {
  @include antialias;
}

// Result
.test {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
```

#### Spacer
`file: scr/sass/framework/modules/_spacer.scss`

##### margin-padding <small>(m)</small>
Berechnet Margin/Padding für die Margin und Padding Mixins.

- @access private

##### padding <small>(m)</small>
Mit dem Mixin kann man Padding in gewohnter Kurzform schreiben, die dann aber in einzelnen Deklarationen ins CSS geschrieben werden.

- @param {Bool|List} `$value` (false) - It generate all four sides, with different length of values.
- @param {Bool} `$important` (false) - When the Values need hard overwritten. Otherwise set it to 'false', the parent Classname will be used as base name

```scss
// Example
.padding-1 {
  @include padding(20);
}
.padding-2 {
  @include padding(20 10);
}
.padding-3 {
  @include padding(20 1rem 0 10);
}

// Result
.padding-1 {
  padding-top: 20px;
  padding-right: 20px;
  padding-bottom: 20px;
  padding-left: 20px;
}
.padding-2 {
  padding-top: 20px;
  padding-right: 10px;
  padding-bottom: 20px;
  padding-left: 10px;
}
.padding-3 {
  padding-top: 20px;
  padding-right: 1rem;
  padding-bottom: 0px;
  padding-left: 10px;
}
```

##### margin <small>(m)</small>
Mit dem Mixin kann man Margin in gewohnter Kurzform schreiben, die dann aber in einzelnen Deklarationen ins CSS geschrieben werden.

- @param {Bool|List} `$value` (false) - It generate all four sides, with different length of values.
- @param {Bool} `$important` (false) - When the Values need hard overwritten. Otherwise set it to 'false', the parent Classname will be used as base name

```scss
// Example
.margin-1 {
  @include margin(0 10);
}
.margin-2 {
  @include margin(.24rem 10);
}
.margin-3 {
  @include margin(20 10 0 10);
}

// Result
.margin-1 {
  margin-top: 0px;
  margin-right: 10px;
  margin-bottom: 0px;
  margin-left: 10px;
}
.margin-2 {
  margin-top: 0.24rem;
  margin-right: 10px;
  margin-bottom: 0.24rem;
  margin-left: 10px;
}
.margin-3 {
  margin-top: 20px;
  margin-right: 10px;
  margin-bottom: 0px;
  margin-left: 10px;
}
```

##### spacer <small>(m)</small>
Berechnet anhand der Global Spacing Unit Abstände.

- @requires `$kittn-global-spacing`
- @param {List} `$options` - Spacing Type. `w`: width, `h`: height, `lh`: line-height, `pt`: padding-top, `pb`: padding-bottom, `pl`: padding-left, `pr`: padding-right, `mt`: margin-top, `mb`: margin-bottom, `ml`: margin-left, `mr`: margin-right, `mv`: margin-vertical, `mh`: margin-horizontal, `pv`: padding-vertical, `ph`: padding-horizontal
- @param {Number} `$lines` (1)         - Spacing Multiplicator
- @param {Bool} `$important` (false) - Overwrite Values with !important
- @param {Number} `$size` ($kittn-global-spacing)   - Global Size Value

```scss
// Example
.spacer-1 {
  @include spacer(h);
}
.spacer-2 {
  @include spacer(w,4);
}
.spacer-3 {
  @include spacer(mt,4,true);
}
.spacer-4 {
  @include spacer(h lh,2);
}
.spacer-5 {
  @include spacer(mv h, .5 3);
}

// Result
.spacer-1 {
  height: 20px;
}
.spacer-2 {
  width: 80px;
}
.spacer-3 {
  margin-top: 80px !important;
}
.spacer-4 {
  height: 40px;
  line-height: 40px;
}
.spacer-5 {
  margin-left: 10px;
  margin-right: 10px;
  height: 60px;
}
```

##### Spacer-Reset <small>(m)</small>
Resetet die vom Spacer Mixin eingestellten Abstände.

- @param {List} `$options` - Spacing Type. `w`: width, `h`: height, `lh`: line-height, `pt`: padding-top, `pb`: padding-bottom, `pl`: padding-left, `pr`: padding-right, `mt`: margin-top, `mb`: margin-bottom, `ml`: margin-left, `mr`: margin-right, `mv`: margin-vertical, `mh`: margin-horizontal, `pv`: padding-vertical, `ph`: padding-horizontal
- @param {Bool} `$important` (false) - Overwrite Values with !important

```scss
// Example
.spacer-1 {
  @include spacer-reset(h);
}
.spacer-2 {
  @include spacer-reset(w);
}
.spacer-3 {
  @include spacer-reset(mt,true);
}
.spacer-4 {
  @include spacer-reset(h lh);
}
.spacer-5 {
  @include spacer-reset(mv h);
}

// Result
.spacer-1 {
  height: inherit;
}
.spacer-2 {
  width: inherit;
}
.spacer-3 {
  margin-top: inherit !important;
}
.spacer-4 {
  height: inherit;
  line-height: inherit;
}
.spacer-5 {
  margin-left: inherit;
  margin-right: inherit;
  height: inherit;
}
```

#### Triangle
`file: scr/sass/framework/modules/_triangle.scss`

##### Triangle <small>(m)</small>
Generiert Dreiecke aus Borders

- @param {Map} `$values`
- {color} `color` (#fff) - Farbe des Dreicks
- {number} `width` (15px) - Breite
- {number} `height` (15px) - Höhe
- {*|number} `angle` - Values: `top`, `top left`, `right`, `bottom right`, `bottom`, `bottom left`, `left`, `top left`

```scss
// Example
.triangle-1 {
  &:before {
    @include triangle(());
  }
}
.triangle-2 {
  &:before {
    @include triangle((
      color: red,
      angle: 'right'
    ));
  }
}
.triangle-3 {
  &:before {
    @include triangle((
      color: #1ec4ff,
      height: 20px,
      width: 20px,
      angle: 45
    ));
  }
}

// Result
.triangle-1:before {
  display: block;
  width: 0;
  height: 0;
  border: 0 solid transparent;
  border-right-color: #fff;
  border-width: 7.5px 15px 7.5px 0; }

.triangle-2:before {
  display: block;
  width: 0;
  height: 0;
  border: 0 solid transparent;
  border-left-color: red;
  border-width: 7.5px 0 7.5px 15px; }

.triangle-3:before {
  display: block;
  width: 0;
  height: 0;
  border: 0 solid transparent;
  border-bottom-color: #1ec4ff;
  border-width: 0 0px 20px 20px; }
```

#### Typography
`file: scr/sass/framework/modules/_typography.scss`

##### tw <small>(f)</small>
Wird anhand des Style Keywords Werte aus der Typostyle Map übertragen.

- @requires `$kittn-typostyles-map`

```scss
// Example
$kittn-typostyles-map: (
  mega: (
    font-size: 36,
    line-height: d,
    margin-bottom: 20,
    font-weight: n,
    tag: false,
    extend: '%heading'
  )
);

.test {
  font-size: tw(mega, font-size) + 0px;
}

// Result
.test {
  font-size: 36px;
}
```

##### typogenerator <small>(m)</small>
Generiert die Typostyles.

- @requires `$kittn-generate-typostyles`, `$kittn-typostyles-map`

```scss
// Map
// file: src/sass/setup.scss
$kittn-typostyles-map: (
  h1: (
    font-size: 36,
    line-height: d,
    margin-bottom: false,
    font-weight: false,
    tag: true,
    extend: '%heading'
  ),
  h2: (
    font-size: 32,
    line-height: d,
    margin-bottom: 14,
    font-weight: false,
    tag: true,
    extend: '%heading'
  ),
  small: (
    font-size: 11,
    line-height: d,
    margin-bottom: false,
    font-weight: false,
    tag: false,
    extend: '%extra'
  ),
  supersmall: (
    font-size: 10,
    line-height: c,
    margin-bottom: 10,
    font-weight: false,
    tag: false,
    extend: '%extra'
  )
);
```

```scss
// Example
@include typogenerator;

// Result
.h1, h1, .h2, h2 {
  text-rendering: optimizeLegibility;
  margin-bottom: 0rem;
  color: #636363; }

.small, .supersmall {
  color: red;
  margin-bottom: 20px; }

.h1, h1 {
  font-size: 2.647059rem;
  line-height: 1; }

.h2, h2 {
  font-size: 2.352941rem;
  line-height: 1;
  margin-bottom: 1.029412rem; }

.small {
  font-size: 0.808824rem;
  line-height: 1; }

.supersmall {
  font-size: 0.735294rem;
  line-height: 0.911765rem;
  margin-bottom: 0.735294rem; }

```

##### responsive-fontsizes <small>(m)</small>
Wird die Fontsize in `rem` definiert, kann man über das Mixin die Fontsize responsive gestalten. Die Globale Größe wird in der `$kittn-breakpoint-map` notiert.

Aktiviert wird das ganze über die `$kittn-active-responsive-fonts` Variable, es muss ein Wert von 0 - 100 eingestellt werden?

- @requires `$kittn-breakpoint-map`, `$kittn-activate`, `$kittn-active-responsive-fonts`

```scss
// Map and Vars
// file: src/sass/setup.scss

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
    fontsize: 90
  )
);

$kittn-active-responsive-fonts: 70;
```

```scss
// Example
@include responsive-fontsize($base);

// Result
html {
  font-size: 70%;
}
@media screen and (min-width: 480px) {
  html {
    font-size: 80%;
  }
}
@media screen and (min-width: 560px) {
  html {
    font-size: 90%;
  }
}
```

##### get-fontsize <small>(m)</small>
Übernimmt die Fontsize aus der Map.

- @param {*} `$entry` - TypoKey

```scss
// Example
.test {
  @include get-fontsize(small);
}

// Result
.test {
  font-size: 0.808824rem;
}
```

##### ext-typo <small>(m)</small>
Verbindet mit existierenden Typo Klassen

- @param {*} `$entry` - TypoKey

```scss
// Example
.test {
  @include ext-typo(h1);
}

// Result
.h1, .test, h1, .h2, h2, h3, .h3 {
  text-rendering: optimizeLegibility;
  margin-bottom: 0rem;
  color: #636363; }

.h1, .test, h1 {
  font-size: 2.647059rem;
  line-height: 0.073529rem; }
```

---

### Partials

#### Normalize
`scr/sass/framework/partials/_normalize.scss`

Damit wird die Basiseinstellung der Typo, Font und des Layouts vorgenommen.

#### Tables
`scr/sass/framework/partials/_tables.scss`

Für vordefinierte Tabellen.

#### Pre-Generators
`scr/sass/framework/partials/_pre-generators.scss`

Hier mit werden Generatoren geladen die noch vor der `normalize.scss` geladen sein muss.

#### Post-Generators
`scr/sass/framework/partials/_post-generators.scss`

Hier mit werden Generatoren geladen die nach der `normalize.scss` geladen sein muss.

---

## Special Thanks to

- Hugo Giraudel (@HugoGiraudel) - for his awesome Sass Scripts
- Daniel Guillan (@danielguillan) - Modernizr Mixins
- Team Sass - Jacket
- Sam Richard (@Snugug) - EQ.js

## License

MIT
