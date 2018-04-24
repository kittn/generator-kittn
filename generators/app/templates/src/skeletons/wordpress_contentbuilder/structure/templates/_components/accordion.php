<?php
/**
 * Accordion
 * =========
 * A classic Accordion. Any Accrodion contains a ContentBuilder.
 */

// Default Vars
$classnameAccordion = 'c-accordion';
?>

<?php // Build Element Block ?>
<div class="<?= $classnameAccordion; ?><?= get_sub_field('style') ? ' '.$classnameAccordion.'--s-'.get_sub_field('style') : ''; ?>" role="tablist">
  <?php while( have_rows('accordion') ) : the_row(); ?>
    <div class="<?= $classnameAccordion.'__box'; ?>" role="tab">
      <div class="<?= $classnameAccordion.'__trigger'; ?>"><?= get_sub_field('header') ?></div>
      <div class="<?= $classnameAccordion.'__body'; ?>" role="tabpanel">
        <div class="<?= $classnameAccordion.'__inner'; ?>">
          <?php include ( get_template_directory() . '/_contentbuilder/contentModules.php' ); ?>
        </div>
      </div>
    </div>
  <?php endwhile; ?>
</div>
