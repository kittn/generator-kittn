    <footer class="appFooter">
      PAGE FOOTER
    </footer>
  </div>

  <?php wp_footer(); ?>

  <% if ( projectiecompatible == true ) { %>
  <!--[if lte IE 9]>
  <script src="<?php bloginfo('template_url'); ?>/assets/js/selectivizr.js"></script>
  <![endif]--><% } %>
  <script src="<?php bloginfo('template_url'); ?>/assets/js/modernizr.js"></script>
  <script src="<?php bloginfo('template_url'); ?>/assets/js/conditionizr.js"></script>
  <script src="<?php bloginfo('template_url'); ?>/assets/js/main.js"></script>
</body>
</html>
