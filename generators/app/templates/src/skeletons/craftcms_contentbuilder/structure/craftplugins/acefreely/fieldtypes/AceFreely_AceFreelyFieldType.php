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

class AceFreely_AceFreelyFieldType extends BaseFieldType
{
    /**
     * Get the name of this fieldtype
     */
    public function getName()
    {
        return Craft::t('Ace Freely');
    }

    /**
     * Get this fieldtype's column type.
     *
     * @return string
     */
    public function defineContentAttribute()
    {
        return array(AttributeType::String, 'column' => ColumnType::Text);
    }

    protected function defineSettings()
    {
        return array(
            'mode'      => array(AttributeType::Enum,   'values'  => array(
                'css',
                'html',
                'javascript',
                'markdown',
                'twig'
                ), 'default' => 'html'),
            'theme'      => array(AttributeType::Enum,   'values'  => array(
                'ambiance',
                'chaos',
                'chrome',
                'clouds_midnight',
                'clouds',
                'cobalt',
                'crimson_editor',
                'dawn',
                'dreamweaver',
                'eclipse',
                'github',
                'idle_fingers',
                'katzenmilch',
                'kr_theme',
                'kuroir',
                'merbivore_soft',
                'merbivore',
                'mono_industrial',
                'monokai',
                'pastel_on_dark',
                'solarized_dark',
                'solarized_light',
                'terminal',
                'textmate',
                'tomorrow_night_blue',
                'tomorrow_night_bright',
                'tomorrow_night_eighties',
                'tomorrow_night',
                'tomorrow',
                'twilight',
                'vibrant_ink',
                'xcode'
                ), 'default' => 'chrome'),
            'minLines'     => array(AttributeType::Number, 'default' => 4),
            'maxLines'    => array(AttributeType::Bool,   'default' => 1),
            'useTabs'    => array(AttributeType::Bool,   'default' => 1),
            'tabSize'    => array(AttributeType::Number, 'default' => 4)
        );
    }

    /**
     * Get this fieldtype's form HTML
     *
     * @param  string $name
     * @param  mixed  $value
     * @return string
     */
    public function getInputHtml($name, $value)
    {
        // Reformat the input name into something that looks more like an ID
        $id = craft()->templates->formatInputId($name);

        // Figure out what that ID is going to look like once it has been namespaced
        $namespacedId = craft()->templates->namespaceInputId($id);

        // Get settings
        $settings = $this->getSettings();
        $useTabs = $settings->useTabs ? 1 : 0;
        $maxLines = $settings->maxLines ? 'Infinity' : $settings->minLines;

        // Include JavaScript
        craft()->templates->includeJsResource('acefreely/ace/ace.js');
        craft()->templates->includeJsResource('acefreely/ace/ext-language_tools.js');
        craft()->templates->includeJsResource('acefreely/ace.freely.min.js');
        craft()->templates->includeCssResource('acefreely/ace.freely.min.css');
        craft()->templates->includeJs('AceFreely.init("' . $namespacedId . '","' . $settings->mode . '","' . $settings->theme . '",' . $useTabs . ',' . $settings->tabSize . ',' . $settings->minLines . ',' . $maxLines . ');');

        return craft()->templates->render('acefreely/input', array(
            'name'     => $name,
            'value'    => $value,
            'settings' => $settings
        ));
    }

    public function getSettingsHtml()
    {
        return craft()->templates->render('acefreely/settings', array(
            'settings' => $this->getSettings()
        ));
    }
}
