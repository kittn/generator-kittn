<?php
/**
 * Kint plugin for Craft CMS
 *
 * Kint Variable
 *
 * --snip--
 * Craft allows plugins to provide their own template variables, accessible from the {{ craft }} global variable
 * (e.g. {{ craft.pluginName }}).
 *
 * https://craftcms.com/docs/plugins/variables
 * --snip--
 *
 * @author    Mildly Geeky
 * @copyright Copyright (c) 2016 Mildly Geeky
 * @link      http://www.mildlygeeky.com
 * @package   Kint
 * @since     1.0.0
 */

namespace Craft;

class KintVariable
{
    public function d($debug = null)
    {
        return craft()->kint->d($debug);
    }

    public function dd($debug = null)
    {
        return craft()->kint->dd($debug);
    }

    public function s($debug = null)
    {
        return craft()->kint->s($debug);
    }

    public function sd($debug = null)
    {
        return craft()->kint->sd($debug);
    }

    public function time()
    {
        return craft()->kint->time();
    }
}
