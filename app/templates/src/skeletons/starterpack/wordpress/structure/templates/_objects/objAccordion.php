<?php
/**
  Accordion Wrapper
  =================
  Container that overlaps the page border - buggy on windows systems
*/

// Default Vars
$classname = 'o-accordion';
?>

<div class="<?= $classname; ?><?= get_sub_field('style') ? ' '.$classname.'--s-'.get_sub_field('style') : ''; ?>">
  <?php while( have_rows('accordion') ) : the_row(); ?>
    <div class="<?= $classname; ?>__box">
      <div class="<?= $classname; ?>__trigger"><?= get_sub_field('header') ?></div>
      <div class="<?= $classname; ?>__body">
        <div class="<?= $classname; ?>__inner">
          <?php include ( get_template_directory() . '/_contentbuilder/contentModules.php' ); ?>
        </div>
      </div>
    </div>
  <?php endwhile; ?>
</div>
