'''
This script generates Mapbox-GL style JSON files from common 'master style'
template, and set of variables, set in separate style-specfic json file.

The template has to be created manually, taking a working style (Voyager)
from Maputnik project and replacing dynamic values by @var@ placeholders.

The generated result files can then be used in mapbox-gl maps. Usage sample:

python styler.py -t style_tpl.json -v dark-matter_vars.json -o dark-matter.json

'''

import os
import sys
import re
import json
import argparse


def check_file(filename):
    if not os.path.isfile(filename):
        print('Could not found a regular file: {}'.format(filename))
        sys.exit(1)


def generate_style(tpl_file, vars_json_file, style_file):
    # Check that files exist
    check_file(tpl_file)
    check_file(vars_json_file)

    # Load style variables
    with open(vars_json_file) as f:
        d = json.load(f)

    # Load style template
    with open(tpl_file, 'r') as f:
        style_json = f.read()

    # Replace variables in the template
    for var_name, value in d.items():
        style_json = style_json.replace('@{}@'.format(var_name), value)

    # Check there are not unreplaced
    for match in re.finditer(r'@.*@', style_json, re.MULTILINE):
        print('WARNING: Unreplaced variable: {}'.format(match.group()))

    # Write the new style
    with open(style_file, 'w') as f:
        f.write(style_json)

    print('Wrote `{}`.'.format(style_file))


if __name__ == '__main__':
    parser = argparse.ArgumentParser()

    parser.add_argument('-t', '--template', type=str,
                        help='style template file', required=True)

    parser.add_argument('-v', '--variables', type=str,
                        help='style variables json file', required=True)

    parser.add_argument('-o', '--output', type=str,
                        help='style output file', required=True)

    args = parser.parse_args()

    generate_style(args.template, args.variables, args.output)
