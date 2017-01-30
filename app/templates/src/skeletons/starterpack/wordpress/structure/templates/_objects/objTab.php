<?php
/**
  Tab Wrapper
  ===========
  Container that overlaps the page border - buggy on windows systems
*/

// Default Vars
$classname = 'o-tab';
$tabgroup = rand(1, 5000);
$count = 0;
?>

<div class="<?= $classname; ?><?= get_sub_field('style') ? ' '.$classname.'--s-'.get_sub_field('style') : ''; ?>">
  <?php while( have_rows('tab') ) : the_row(); ?>
    <input type="radio" name="tabs" id="tg<?= $tabgroup; ?>-e<?= $count; ?>" class="<?= $classname; ?>__input" <?= $count == 0 ? 'checked="checked"' : ''?>>
    <label class="<?= $classname; ?>__header" for="tg<?= $tabgroup; ?>-e<?= $count; ?>"><?= get_sub_field('header'); ?></label>
    <div class="<?= $classname; ?>__body">
      <div class="<?= $classname; ?>__inner">
        <?php include ( get_template_directory() . '/_contentbuilder/contentModules.php' ); ?>
      </div>
    </div>
  <?php $count++; ?>
  <?php endwhile; ?>
</div>
