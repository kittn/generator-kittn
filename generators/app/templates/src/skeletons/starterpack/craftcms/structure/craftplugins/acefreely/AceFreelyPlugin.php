<?php

/**
 * Ace Freely by Brandon Haslip
 *
 * @package   Ace Freely (Named by Chad J. Clark)
 * @author    Brandon Haslip
 * @copyright Copyright (c) 2014, Brandon Haslip
 * @link      http://brandonhaslip.com
 * @license   GNU Public License (http://opensource.org/licenses/gpl-license.php)
 */

namespace Craft;

class AceFreelyPlugin extends BasePlugin
{
    public function getName()
    {
        return Craft::t('Ace Freely');
    }

    public function getVersion()
    {
        return '1.0';
    }

    public function getDeveloper()
    {
        return 'Brandon Haslip';
    }

    public function getDeveloperUrl()
    {
        return 'http://brandonhaslip.com';
    }

    /**
     * Register twig extension
     */
    public function addTwigExtension()
    {
        Craft::import('plugins.acefreely.twigextensions.AceFreelyTwigExtension');

        return new AceFreelyTwigExtension();
    }
}
