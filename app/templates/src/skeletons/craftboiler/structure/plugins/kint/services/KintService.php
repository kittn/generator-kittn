<?php
/**
 * Kint plugin for Craft CMS
 *
 * Kint Service
 *
 * @author    Mildly Geeky
 * @copyright Copyright (c) 2016 Mildly Geeky
 * @link      http://www.mildlygeeky.com
 * @package   Kint
 * @since     1.0.0
 */

namespace Craft;

class KintService extends BaseApplicationComponent
{
    public function d($debug = null)
    {
        return d($debug);
    }

    public function dd($debug = null)
    {
        return ddd($debug);
    }

    public function s($debug = null)
    {
        return s($debug);
    }

    public function sd($debug = null)
    {
        return sd($debug);
    }

    public function time()
    {
        return d(microtime());
    }
}
