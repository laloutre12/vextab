This directory provides a build process where you only need Node.js and npm. The default build (in the root of this project) is done with ruby / rake via the Rakefile.

## build with npm
`$ npm install`  
`$ make`

files are generated into the `out` directory

## run a server and watch & reload automatically
`$ make run`  
open `http://localhost:9778/demo-player.html`

## usage
### simple ([demo-simple.html](https://github.com/timaschew/vextab/blob/master/contrib/docpad/src/documents/demo-simple.html))
1. include jQuery and the output file in your page
`<script src="scripts/tabdiv.js"></script>`
2. create a div with the class **vex-tabdiv**
`<div class="vex-tabdiv">tabstave notation=true</div>`
3. wait until **tabdiv.js** is loaded, then init vextab 
`Vex.Flow.TabDiv.start()`

### enable textarea for interactive mode
- add this attrbite `editor="true"` to the **div**

### enable player
- pass an object to the **start** function:
`{soundfont_url: <SOUND_FONT_URL>}`  
- prepend this vextab input (content of the div): `options player=true\n`

see [demo-player.html](https://github.com/timaschew/vextab/blob/master/contrib/docpad/src/documents/demo-player.html)

## build process

### build output / content differs from the ruby-based version

- dependencies are managed with bower
- player.coffee is included
- tabdiv.js was modified 
    - auto initialization was removed
    - pass options from `Vex.Flow.TabDiv.start` to the `Vex.Flow.Player`
    - see the diff [tabdiv2.js-diff.log](https://github.com/timaschew/vextab/blob/master/contrib/docpad/tabdiv2.js-diff.log)

### Dependencies
- **jquery** (is not included in the build output, need to load manually) - DOM abstraction
- **undescore** - utility library
- **vexflow** - low level API for vextab
- **MIDI.js** - for playing the notes
- **paperjs** - marking the notes which are played

### How it works?
1. bower.json defines dependencies like MIDI.js, etc.
2. **bower** installs the dependencies into `bower_components`
2. **bower-installer** filters files which are needed for the build and copy them to `src/files/bower_components`
3. **docpad** converts *coffee* and *jison* files and concat the dependencies to the build file `out/vextab.js`

#### WTF? vextab is a dependency?
Yes, due to:

- the rejected pull request [build process without ruby](https://github.com/0xfe/vextab/pull/38)
- docpad needs its own directory scope and filename extension conventions for converting **coffee** files
- bower is already used for dependency management, so why use another tool or script - use bower-installer instead


### TODO

#### refactor file names to avoid name confusion
- project name is `vextab`
- there is a file `vextab.coffee` -> `vextab.js`
- there is a file `vextab.jison` -> `vextab_parser.js`
- there is a file `tabdiv2.js`
- the (final) build file name is `tabdiv.js`

#### documentation for vextab initialization
clarify the HTMl tags, classes, attributes and JS option argument. How they incluence vextab initialization

