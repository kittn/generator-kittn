<?php

namespace Emrl\AcfLink\Support\AdminColumns;

use ACA_ACF_Field;

class FieldLink extends ACA_ACF_Field
{
    public function __construct($column)
    {
        parent::__construct($column);
        $column->set_serialized(true);
    }

    public function get_value($id)
    {
        $value = $this->get_raw_value($id);

        if (empty($value)) {
            $value = '';
        } else {
            $url = $value['url'];
            $title = $value['title'] ?: $url;
            $target = $value['target'] ? ' <span title="Link opens in new tab/window">&#x1F5D7;</span>' : '';
            $value = sprintf('<a href="%s" target="_blank" rel="noopener noreferrer">%s</a>%s', $url, $title, $target);
        }

        return $value;
    }
}
