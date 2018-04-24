<?php
/**
  Document Footer
  ============
  For Loading Footer Scripts
*/
?>
<?php wp_footer(); ?>

<%% for (var chunk in htmlWebpackPlugin.files.chunks) { if (!chunk.match(/font/)) { %>
<script src="<?= home_url(); ?><%%= htmlWebpackPlugin.files.chunks[chunk].entry %>" defer></script>
<%% }} %>
