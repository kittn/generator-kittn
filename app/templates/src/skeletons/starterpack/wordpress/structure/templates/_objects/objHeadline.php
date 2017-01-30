<?php
/**
  Headline Module
  ===============
  Build a semantic Headline with an optional visual overwrite
*/

// Getting Vars
$size = get_sub_field('size');
$visSize = get_sub_field('overwrite');
?>
<<?= $size; ?><?= $visSize != 'default' ? ' class="'.$visSize.'"' : ''; ?>><?php the_sub_field('headline'); ?></<?= $size; ?>>
