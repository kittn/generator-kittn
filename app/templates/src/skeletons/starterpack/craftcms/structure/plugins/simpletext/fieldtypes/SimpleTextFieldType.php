<?php
namespace Craft;

/**
 * Simple Text field type
 */
class SimpleTextFieldType extends BaseFieldType
{
	/**
	 * Returns the type of field this is.
	 *
	 * @return string
	 */
	public function getName()
	{
		return Craft::t('Simple Text');
	}

	/**
	 * Returns the content attribute config.
	 *
	 * @return mixed
	 */
	public function defineContentAttribute()
	{
		return array(AttributeType::String, 'column' => ColumnType::Text);
	}

	/**
	 * Defines the settings.
	 *
	 * @access protected
	 * @return array
	 */
	protected function defineSettings()
	{
		return array(
			'initialRows' => array(AttributeType::Number, 'min' => 1, 'default' => 4),
		);
	}

	/**
	 * Returns the field's settings HTML.
	 *
	 * @return string|null
	 */
	public function getSettingsHtml()
	{
		return craft()->templates->renderMacro('_includes/forms', 'textField', array(
			array(
				'label'  => Craft::t('Initial Rows'),
				'id'     => 'initialRows',
				'name'   => 'initialRows',
				'value'  => $this->getSettings()->initialRows,
				'size'   => 3,
				'errors' => $this->getSettings()->getErrors('initialRows'),
			)
		));
	}

	/**
	 * Returns the field's input HTML.
	 *
	 * @param string $name
	 * @param mixed  $value
	 * @return string
	 */
	public function getInputHtml($name, $value)
	{
		$id = craft()->templates->formatInputId($name);
		$namespacedId = craft()->templates->namespaceInputId($id);

		craft()->templates->includeJsResource('simpletext/lib/behave.js');
		craft()->templates->includeJs("new Behave({ textarea: document.getElementById('{$namespacedId}') });");

		return craft()->templates->renderMacro('_includes/forms', 'textarea', array(
			array(
				'id'    => $id,
				'name'  => $name,
				'value' => $value,
				'class' => 'nicetext fullwidth code',
				'rows'  => $this->getSettings()->initialRows
			)
		));
	}
}
