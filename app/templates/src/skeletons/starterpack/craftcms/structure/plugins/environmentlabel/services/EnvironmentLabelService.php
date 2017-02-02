<?php
namespace Craft;

/**
 * EnvironmentLabelService
 *
 * @author    Tom Davies <tom@madebykind.com>, Michael Rog <michael@michaelrog.com>
 * @copyright Copyright (c) 2016, Kind
 * @see       https://github.com/madebykind/craft.labelenvironment
 * @package   craft.plugins.environmentlabel
 * @since     2.0
 */
class EnvironmentLabelService extends BaseApplicationComponent
{


    /**
     * Returns the show label bool
     *
     * @return bool
     */
    public function getShowLabel()
    {
        $showLabel = craft()->config->get('showLabel', 'environmentlabel');
        return is_bool($showLabel) ? $showLabel : false;
    }


    /**
     * Returns the environment label
     *
     * @return string
     */
    public function getLabel()
    {
        $environmentLabel = craft()->config->get('label', 'environmentlabel');
        return !empty($environmentLabel) ? $environmentLabel : CRAFT_ENVIRONMENT;
    }

    /**
     * Returns the label prefix, or null if none is set
     *
     * @return string|null
     */
    public function getPrefix()
    {
        return craft()->config->get('prefix', 'environmentlabel');
    }

    /**
     * Returns the label suffix, or null if none is set
     *
     * @return string|null
     */
    public function getSuffix()
    {
        return craft()->config->get('suffix', 'environmentlabel');
    }

    /**
     * Returns the full text of the environment label with prefix/suffix
     *
     * @return string
     */
    public function getFullText()
    {
        $prefix = (string) $this->getPrefix();
        $suffix = (string) $this->getSuffix();
        $label = (string) $this->getLabel();
        // TODO: Escape/strip quotes, since this string is used in JS variables and CSS content attribute.
        return $prefix . $label . $suffix;
    }

    /**
     * Returns the environment label background color, or null if none is set
     *
     * @return string|null
     */
    public function getLabelColor()
    {
        return craft()->config->get('labelColor', 'environmentlabel');
    }

    /**
     * Returns the environment label text color, or null if none is set
     *
     * @return string|null
     */
    public function getTextColor()
    {
        return craft()->config->get('textColor', 'environmentlabel');
    }

    /**
     * Includes the environment data as a visual banner and as a global JS variable
     */
    public function addEnvironmentLabel()
    {

        $fullText = $this->getFullText();
        $labelColor = $this->getLabelColor();
        $textColor = $this->getTextColor();

        // Include the environment name and label as JS globals
        craft()->templates->includeJs("window.CRAFT_ENVIRONMENT = '" . CRAFT_ENVIRONMENT . "';");
        craft()->templates->includeJs("window.CRAFT_ENVIRONMENT_LABEL = '" . $fullText . "';");

        $showLabel = $this->getShowLabel();
        if ($showLabel && !empty($fullText))
        {

            // Include the default styles
            craft()->templates->includeCssResource('environmentlabel/environmentlabel.css');

            // Include the content
            craft()->templates->includeCss('body:before { content: "' . $fullText . '"; }');

            // Optionally override the label color
            if (!empty($labelColor))
            {
                craft()->templates->includeCss('body:before { background-image: none; background-color: '. $labelColor . '; }');
            }

            // Optionally override the label text color
            if (!empty($textColor))
            {
                craft()->templates->includeCss('body:before { color: '. $textColor . '; }');
            }

        }

    }

}
