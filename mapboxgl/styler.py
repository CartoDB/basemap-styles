'''

This script generates a Mapbox-GL style JSON (i.e. dark-matter.json) from the common master style template (style_tpl.json), using the variables, set in 
each style-specfic json file (dark-matter_vars.json).

Usage sample:

python styler.py -t style_tpl.json -v dark-matter_vars.json -o dark-matter.json

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