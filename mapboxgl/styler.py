'''

The script generates Mapbox-GL style JSON files from common 'master style' template, and set of variables, set in 
separate style-specfic json file.

The template has to be created manually, taking a working style (Voyager) from Maputnik project and replacing 
dynamic values by @var@ placeholders.

The generated result files can then be used in mapbox-gl maps. Usage sample:

python styler.py -t style_tpl.json -v ../dark-matter/dark-matter_vars.json -o ../dark-matter/dark-matter.json

'''

import json, os, sys, argparse

def replace_var(source, string, value):
  return source.replace(string, value)
  
def check_file(filename):
  if not os.path.isfile(filename):
    print ("Could not found a regular file: "+filename)
    sys.exit(1)

def main():
  parser = argparse.ArgumentParser()
  parser.add_argument('-t', dest='templateFile', type=str, help='style template file', required=True)
  parser.add_argument('-v', dest='templateValuesFile', type=str, help='style template values file', required=True)
  parser.add_argument('-o', dest='outputFile', type=str, help='style output file', required=True)
  args = parser.parse_args()
  
  vars_json_file = args.templateValuesFile
  tpl_json_file = args.templateFile
  style_json_filename = args.outputFile
  
  check_file(vars_json_file)
  check_file(tpl_json_file)
  
  style_tpl = open(tpl_json_file, 'r').read()
  style_json_file = open(style_json_filename, 'w')
  
  with open(vars_json_file) as values:
    d = json.load(values)
  
  style_json = style_tpl
  
  for k, v in d.items():
    style_json = replace_var(style_json, '@'+k+'@', v)
     
  style_json_file.write(style_json)    
  style_json_file.close()
  
  print "Done!"
if __name__ == '__main__':
  main()