<?php
namespace Craft;

/**
 * EnvironmentLabelTwigExtension
 *
 * @author    Tom Davies <tom@madebykind.com>, Michael Rog <michael@michaelrog.com>
 * @copyright Copyright (c) 2016, Kind
 * @see       https://github.com/madebykind/craft.labelenvironment
 * @package   craft.plugins.environmentlabel
 * @since     1.0
 */
class EnvironmentLabelTwigExtension extends \Twig_Extension
{

    /**
     * Returns an array to be merged into Twig's global variables.
     *
     * @return array The globals defined by this extension
     */
    public function getGlobals()
    {

        $globals['environmentLabel'] = array(
            'showLabel' => craft()->environmentLabel->getShowLabel(),
            'label' => craft()->environmentLabel->getLabel(),
            'prefix' => craft()->environmentLabel->getPrefix(),
            'suffix' => craft()->environmentLabel->getSuffix(),
            'fullText' => craft()->environmentLabel->getFullText(),
            'labelColor' => craft()->environmentLabel->getLabelColor(),
            'textColor' => craft()->environmentLabel->getTextColor(),
        );

        return $globals;

    }

    /**
     * Returns the Twig extension name.
     *
     * @return string
     */
    public function getName()
    {
        return 'EnvironmentLabel';
    }

}
