## Unified Mapbox-gl styles

The master style file is **tools/style_tpl.json** which uses @var@ placeholders for dynamic parts. Values for the variables for every style are in particular style subfolders.

Script **tools/styler.py** is provided to create working final Mapbox-GL style JSON files from the template.

The template itself has to be created manually, taking a working style (Voyager) from Maputnik project and replacing dynamic values by @var@ placeholders.

The generated result files can then be used in mapbox-gl maps. Usage sample:

`python styler.py -t style_tpl.json -v dark-matter_vars.json -o dark-matter.json`

Final generated style files like dark-matter/dark-matter.json are kept GIT just for reference.
