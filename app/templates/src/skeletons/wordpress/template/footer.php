    <footer class="appFooter">
      PAGE FOOTER
    </footer>
  </div>

  <?php wp_footer(); ?>
  <!-- Javascripts -->
  <% if ( projectiecompatible == true ) { %>
  <!--[if lte IE 9]>
  <script src="<?php bloginfo('template_url'); ?>/assets/js/selectivizr.js"></script>
  <![endif]--><% } %>
  <script src="<?php bloginfo('template_url'); ?>/assets/js/modernizr.js"></script>
  <script src="<?php bloginfo('template_url'); ?>/assets/js/conditionizr.js"></script>
  <script src="<?php bloginfo('template_url'); ?>/assets/js/main.js"></script>

  <?php
  $host = $_SERVER['HTTP_HOST'];
  if( $host == <% if (projectcredential) { %>"<%= credentialdomain %>"<% } else { %>"localhost"<% } %>) {
    ?>
    <script type='text/javascript' id="__bs_script__">//<![CDATA[
      document.write("<script async src='//HOST:3000/browser-sync/browser-sync-client.js'><\/script>".replace("HOST", location.hostname));
      //]]></script>
  <?php } ?>

</body>
</html>
