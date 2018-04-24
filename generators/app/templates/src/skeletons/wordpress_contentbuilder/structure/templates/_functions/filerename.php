<?php
/**
  Camelize
  ========
  Rename ContentBuilder Modules from Underscore Naming to camelCase

*/

// Rename Object Name to Filename
function camelize($input) {
  return lcfirst(str_replace(' ', '', ucwords(str_replace(array('-', '_'), ' ', $input))));
}
