<?php
/**
 * Accordion
 * =========
 * A classic Accordion. Any Accrodion contains a ContentBuilder.
 */

// Default Vars
$classname = 'o-accordion';
?>

<?php // Build Element Block ?>
<div class="<?= $classname; ?><?= get_sub_field('style') ? ' '.$classname.'--s-'.get_sub_field('style') : ''; ?>" role="tablist">
  <?php while( have_rows('accordion') ) : the_row(); ?>
    <div class="<?= $classname; ?>__box" role="tab">
      <div class="<?= $classname; ?>__trigger"><?= get_sub_field('header') ?></div>
      <div class="<?= $classname; ?>__body" role="tabpanel">
        <div class="<?= $classname; ?>__inner">
          <?php include ( get_template_directory() . '/_contentbuilder/contentModules.php' ); ?>
        </div>
      </div>
    </div>
  <?php endwhile; ?>
</div>
