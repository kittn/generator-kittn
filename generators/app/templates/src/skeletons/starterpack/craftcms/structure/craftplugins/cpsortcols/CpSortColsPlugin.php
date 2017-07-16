<?php namespace Craft;

/**
 * CP Custom Sortable Columns by Mats Mikkel Rummelhoff
 *
 * @author      Mats Mikkel Rummelhoff <http://mmikkel.no>
 * @package     CpSortCols
 * @since       Craft 2.5
 * @copyright   Copyright (c) 2016, Mats Mikkel Rummelhoff
 * @license     http://opensource.org/licenses/mit-license.php MIT License
 * @link        https://github.com/mmikkel/CpSortableCustomColumns-Craft
 */

class CpSortColsPlugin extends BasePlugin
{

    protected   $_version = '1.1.2',
                $_schemaVersion = '1.0',
                $_require = '2.5',
                $_pluginName = 'CP Sortable Custom Columns',
                $_pluginUrl = 'https://github.com/mmikkel/CpSortableCustomColumns-Craft',
                $_developer = 'Mats Mikkel Rummelhoff',
                $_developerUrl = 'http://mmikkel.no',
                $_description = 'Adds custom fields to sortable attributes in element indexes',
                $_releaseFeedUrl = 'https://raw.githubusercontent.com/mmikkel/CpSortableCustomColumns-Craft/master/releases.json',
                $_documentationUrl = 'https://github.com/mmikkel/CpSortableCustomColumns-Craft/blob/master/README.md',
                $_sortableAttributeTypes = array(
                    AttributeType::Number,
                    AttributeType::DateTime,
                    AttributeType::String,
                    AttributeType::Bool,
                ),
                $_sortableMetaFields = null,
                $_sortableCustomFields = null,
                $_sortableAttributes = null;

    public function getName()
    {
        return $this->_pluginName;
    }

    public function getVersion()
    {
        return $this->_version;
    }

    public function getSchemaVersion()
    {
        return $this->_schemaVersion;
    }

    public function getDeveloper()
    {
        return $this->_developer;
    }

    public function getDeveloperUrl()
    {
        return $this->_developerUrl;
    }

    public function getPluginUrl()
    {
        return $this->_pluginUrl;
    }

    public function getReleaseFeedUrl()
    {
        return $this->_releaseFeedUrl;
    }

    public function getDescription()
    {
        return $this->_description;
    }

    public function getDocumentationUrl()
    {
        return $this->_documentationUrl;
    }

    public function onBeforeInstall()
    {
        if (!$this->isCraftRequiredVersion()) {
            craft()->userSession->setError(Craft::t('CP Sortable Custom Columns requires Craft {requiredVersion} or newer, and was not installed.', array(
                'requiredVersion' => $this->_require,
            )));
            return false;
        }
    }

    /* one for each entry type */
    /* basic craft */
    public function modifyEntrySortableAttributes(&$attributes)
    {
        $this->modifyIndexSortableAttributes($attributes);
    }

    public function modifyCategorySortableAttributes(&$attributes)
    {
        $this->modifyIndexSortableAttributes($attributes);
    }

    public function modifyAssetSortableAttributes(&$attributes)
    {
        $this->modifyIndexSortableAttributes($attributes);
    }

    public function modifyUserSortableAttributes(&$attributes)
    {
        $this->modifyIndexSortableAttributes($attributes);
    }

    /* craft commerce */
    public function commerce_modifyOrderSortableAttributes(&$attributes)
    {
        $this->modifyIndexSortableAttributes($attributes);
    }

    public function commerce_modifyProductSortableAttributes(&$attributes)
    {
        $this->modifyIndexSortableAttributes($attributes);
    }

    // variants doesn't have one yet.

    public function init()
    {
        parent::init();

        $request = craft()->request;

        if (!$request->isCpRequest() || $request->isAjaxRequest() || !craft()->userSession->getUser() || craft()->isConsole() || !$this->isCraftRequiredVersion()) {
            return false;
        }

        $sortableAttributes = array();

        foreach ($this->getSortableMetaFields() as $handle => $name) {
            $sortableAttributes[$handle] = array(
                'handle' => $handle,
                'name' => $name,
            );
        }

        foreach ($this->getSortableCustomFields() as $field) {
            $sortableAttributes['field:'.$field->id] = array(
                'handle' => $field->handle,
                'name' => Craft::t($field->name),
            );
        }

        craft()->templates->includeJsResource('cpsortcols/cpsortcols.js');
        craft()->templates->includeJs('(function (window) {
            if (window.Craft && window.Craft.CpSortableCustomColumnsPlugin) {
                Craft.CpSortableCustomColumnsPlugin.init('.json_encode($sortableAttributes).');
            }
        } (window));');

    }

    protected function isCraftRequiredVersion()
    {
        return version_compare(craft()->getVersion(), $this->_require, '>=');
    }

    protected function modifyIndexSortableAttributes(&$attributes)
    {
        if($this->isCraftRequiredVersion()) {
            $attributes = array_merge($attributes, $this->getSortableAttributes());
        }
    }

    protected function getSortableCustomFields ()
    {

        if ($this->_sortableCustomFields === null) {

            $this->_sortableCustomFields = array();

            $allCustomFields = craft()->fields->getAllFields();

            foreach ($allCustomFields as $field) {

                if (!isset($field->fieldType) || !$field->fieldType || !method_exists($field->fieldType, 'defineContentAttribute')) {
                    continue;
                }

                $fieldTypeContentAttribute = $field->fieldType->defineContentAttribute() ?: null;

                if ($fieldTypeContentAttribute && is_array($fieldTypeContentAttribute)) {
                    $fieldTypeContentAttribute = array_shift($fieldTypeContentAttribute);
                }

                if (in_array($fieldTypeContentAttribute, $this->_sortableAttributeTypes)) {
                    $this->_sortableCustomFields[] = $field;
                }

            }

        }

        return $this->_sortableCustomFields;

    }

    protected function getSortableMetaFields ()
    {
        return array(
            'id' => Craft::t('ID'),
            'dateUpdated' => Craft::t('Updated Date'),
            'authorId' => Craft::t('Author'),
            'typeId' => Craft::t('Entry Type'),
            'kind' => Craft::t('Kind'),
            'width' => Craft::t('Width'),
            'height' => Craft::t('Height'),
            'dateCreated' => Craft::t('Created Date'),
            'dateUpdated' => Craft::t('Updated Date'),
            'preferredLocale' => Craft::t('Preferred Locale'),
            'weekStartDay' => Craft::t('Week Start Day'),
        );
    }

    protected function getSortableAttributes ()
    {
        if ($this->_sortableAttributes === null) {
            $this->_sortableAttributes = $this->getSortableMetaFields();
            $customSortableFields = $this->getSortableCustomFields();
            foreach ($customSortableFields as $field) {
                $this->_sortableAttributes[$field->handle] = Craft::t($field->name);
            }
        }
        return $this->_sortableAttributes;
    }

}
