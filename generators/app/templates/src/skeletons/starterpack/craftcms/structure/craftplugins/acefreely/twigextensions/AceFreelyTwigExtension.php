<?php

namespace Craft;

use Twig_Extension;
use Twig_Filter_Method;

class AceFreelyTwigExtension extends Twig_Extension
{
    public function getName()
    {
        return 'acefreely';
    }

    public function getFilters()
    {
        return array(
            'ace_parse' => new Twig_Filter_Method($this, 'aceParseFilter'),
        );
    }

    /**
     * The "ace_parse" filter parses Twig code so you don't have to pass the content
     * through the {% include template_from_string() %} function in your templates.
     *
     * Usage: {{ entry.aceFreelyFieldHandle | ace_parse }}
     */
    public function aceParseFilter($content)
    {
        return craft()->templates->renderString($content);
    }
}
