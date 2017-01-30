<div
  class="acf-input-wrap acf-link<?php echo array_filter($values) ? ' has-value': '' ?>"
  data-show-fields='<?php echo json_encode($field['show_fields']) ?>'>
    <div class="acf-hidden">
        <?php
        acf_hidden_input([
            'name'      => $field['name'].'[url]',
            'value'     => $values['url'],
            'data-name' => 'url',
        ])
        ?>

        <?php
        acf_hidden_input([
            'name'      => $field['name'].'[title]',
            'value'     => $values['title'],
            'data-name' => 'title',
        ])
        ?>

        <?php
        acf_hidden_input([
            'name'      => $field['name'].'[target]',
            'value'     => $values['target'] ? 1 : 0,
            'data-name' => 'target',
        ])
        ?>
    </div>

    <div class="view show-if-value acf-soh">
        <div class="link-info">
            <p style="margin: 0;">
                <span<?php if ( ! in_array('title', $field['show_fields'])) echo ' hidden' ?>>
                    <strong><?php echo __('Title', 'acf') ?>:</strong>
                    <span data-name="display-title"><?php echo esc_html($values['title']) ?></span><br>
                </span>

                <strong><?php echo __('URL', 'acf'); ?>:</strong>
                <a data-name="display-url"
                  href="<?php echo esc_attr($values['url']) ?>"
                  target="_blank">
                   <?php echo esc_html($values['url']) ?>
                </a><br>

                <span<?php if ( ! in_array('target', $field['show_fields'])) echo ' hidden' ?>>
                    <strong><?php echo __('Target', 'acf'); ?>:</strong>
                    <span>
                        Link opens in
                        <span data-name="display-target">
                            <?php echo $this->l10n[$values['target'] ? 'newTab' : 'sameTab'] ?>
                        </span>
                    </span>
                </span>
            </p>

            <ul class="acf-hl acf-soh-target">
                <li><a class="acf-icon -pencil dark" data-name="edit" href="#"></a></li>
                <li><a class="acf-icon -cancel dark" data-name="remove" href="#"></a></li>
            </ul>
        </div>
    </div>

    <div class="view hide-if-value">
        <p style="margin: 0;">
            <?php echo __('No Link selected','acf'); ?>
            <a data-name="add" class="button" href="#">
                <?php echo __('Select Link','acf'); ?>
            </a>
        </p>
    </div>
</div>
