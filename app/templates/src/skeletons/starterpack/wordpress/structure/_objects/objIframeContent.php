<?php
/**
  Iframe Content
  ==============
  For adding iFrame Content thats need to be responsive
*/

// Default Vars
$classname = 'o-iframecontent';
$framesize = '';

// Define Size
switch (get_sub_field('size')) :
  case 'viewportsize' :
    $framesize = ' '.$classname.'--s-viewport';
    break;
  case 'oversize' :
    $framesize = ' '.$classname.'--s-oversize';
    break;
  case 'undersize' :
    $framesize = ' '.$classname.'--s-undersize';
    break;
endswitch;

// Ratio
$ratio = get_sub_field('ratio') ?: '16:9';
$r = explode(':', $ratio);
?>

<?php // Build Element Block ?>
<div class="<?= $classname; ?><?= $framesize; ?>">
  <div class="<?= $classname; ?>__inner" style="padding-bottom:<?= ($r[1] / $r[0]) * 100; ?>%">
    <?= get_sub_field('embed'); ?>
  </div>
  <?php if (get_sub_field('caption')) : ?>
    <div class="<?= $classname; ?>__caption">{{ data.caption }}</div>
  <?php endif; ?>
</div>
