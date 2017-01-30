<?php
/**
  Camelize
  ========
  Rename ContentBuilder Modules from Underscore Naming to camelCase

*/

// Rename Object Name to Filename
function camelize($input, $separator = '_') {
  return str_replace($separator, '', lcfirst(ucwords($input, $separator)));
}
