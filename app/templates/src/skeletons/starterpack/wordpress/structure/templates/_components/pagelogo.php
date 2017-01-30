<?php
/**
  PageLogo
  ========
  Add a Logomodule with a Linkwrapper for Subpages. On the Startpage is this your H1, on Subpages a Div. Better for SEO
*/

// Component Classname
$classname = 'c-pagelogo';

// Setup Type and adding Linkvars
if  (is_home()) {
  $type = 'h1';
  $linkstart = '';
  $linkend = '';
} else {
  $type = 'div';
  $linkstart = '<a href="'.home_url().'">';
  $linkend = '</a>';
}
?>

<?php // Build Element Block ?>
<<?= $type; ?> class="<?= $classname; ?>">
  <?= $linkstart; ?>
  <?php bloginfo( 'name' ); ?>
  <?= $linkend; ?>
</<?= $type; ?>>
