<?php
/**
 * Tab Wrapper
 * ===========
 * Tab Container works with CSS Only, only one Tabwrapper per Page.
 * Otherwise you have to add JS functionality
 */

// Default Vars
$classname = 'o-tab';

// Random Number for identify tabgroup
$tabgroup = rand(1, 5000);
$count = 0;
?>

<div class="<?= $classname; ?><?= get_sub_field('style') ? ' '.$classname.'--s-'.get_sub_field('style') : ''; ?>" role="tablist">
  <?php while( have_rows('tab') ) : the_row(); ?>
    <input type="radio" name="tabs" id="tg<?= $tabgroup; ?>-e<?= $count; ?>" class="<?= $classname; ?>__input" <?= $count == 0 ? 'checked="checked"' : ''?> role="tab">
    <label class="<?= $classname; ?>__header" for="tg<?= $tabgroup; ?>-e<?= $count; ?>"><?= get_sub_field('header'); ?></label>
    <div class="<?= $classname; ?>__body" role="tabpanel">
      <div class="<?= $classname; ?>__inner">
        <?php include ( get_template_directory() . '/_contentbuilder/contentModules.php' ); ?>
      </div>
    </div>
    <?php $count++; ?>
  <?php endwhile; ?>
</div>

