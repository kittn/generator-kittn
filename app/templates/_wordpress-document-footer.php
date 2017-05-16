<?php
/**
  Document Footer
  ============
  For Loading Footer Scripts
*/
?>
<?php wp_footer(); ?>
<% if (projectjquery === 'slim') { %><script src="//code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha256-k2WSCIexGzOj3Euiig+TlR8gA0EmPjuc79OEeY5L45g=" crossorigin="anonymous"></script><% } %><% if (projectjquery === 'full') { %><script src="//code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script><% } %>
<script src="<?= get_template_directory_uri(); ?>/assets/js/modernizr.js"></script>
<script src="<?= get_template_directory_uri(); ?>/assets/js/conditionizr.js"></script>
<script src="<?= get_template_directory_uri(); ?>/assets/js/main.js"></script>
