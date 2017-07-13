<?php
/**
 * Tab Wrapper
 * ===========
 * Tabs only with CSS, therefore only one tab container per page.
 * If this is not enough, the functionality must be expanded with JS.
 * The Container tab contains a ContentBuilder.
 */

// Default Vars
$classnameTab = 'c-tab';

// Random Number for identify tabgroup
$tabgroup = rand(1, 5000);
$count = 0;
?>

<?php // Build Element Block ?>
<div class="<?= $classnameTab; ?><?= get_sub_field('style') ? ' '.$classnameTab.'--s-'.get_sub_field('style') : ''; ?>" role="tablist">
  <?php while( have_rows('tab') ) : the_row(); ?>
    <input type="radio" name="tabs" id="<?= 'tg'.$tabgroup.'-e'.$count; ?>" class="<?= $classnameTab.'__input'; ?>" <?= $count == 0 ? 'checked="checked"' : ''?> role="tab">
    <label class="<?= $classnameTab.'__header'; ?>" for="<?= 'tg'.$tabgroup.'-e'.$count; ?>"><?= get_sub_field('header'); ?></label>
    <div class="<?= $classnameTab.'__body'; ?>" role="tabpanel">
      <div class="<?= $classnameTab.'__inner'; ?>">
        <?php include ( get_template_directory() . '/_contentbuilder/contentModules.php' ); ?>
      </div>
    </div>
    <?php $count++; ?>
  <?php endwhile; ?>
</div>

