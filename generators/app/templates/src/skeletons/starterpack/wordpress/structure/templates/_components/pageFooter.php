<?php
/**
  Page Footer
  ===========
  Wrapper for Copy and Footernavi
*/
?>

<footer class="c-pageFooter" role="contentinfo">
  <div class="c-pageFooter__inner">
    <div class="c-pageFooter__copy c-pageFooter__block">
      <?php include ( get_template_directory() . '/_components/copyright.php' ); ?>
    </div>
    <div class="c-pageFooter__nav c-pageFooter__block">
      <?php include ( get_template_directory() . '/_components/footernav.php' ); ?>
    </div>
    <div class="c-pageFooter__social c-pageFooter__block">
      <?= macro_socialNetworks($options = [], $links = false) ?>
    </div>
  </div>
</footer>
