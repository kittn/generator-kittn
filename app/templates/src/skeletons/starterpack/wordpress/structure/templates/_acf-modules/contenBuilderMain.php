<?php
if( function_exists('acf_add_local_field_group') ):

acf_add_local_field_group(array (
	'key' => 'group_588cd6904a136',
	'title' => 'Content Builder (Main)',
	'fields' => array (
		array (
			'key' => 'field_588cd6aaffea4',
			'label' => 'Content Builder',
			'name' => 'content_builder',
			'type' => 'flexible_content',
			'instructions' => 'Der Haupt ContentBuilder mit dem Inhalte erstellt werden können.',
			'required' => 0,
			'conditional_logic' => 0,
			'wrapper' => array (
				'width' => '',
				'class' => '',
				'id' => '',
			),
			'button_label' => 'Content Feld zufügen',
			'min' => '',
			'max' => '',
			'layouts' => array (
				array (
					'key' => '588cd6bcb3d69',
					'name' => '',
					'label' => '',
					'display' => 'block',
					'sub_fields' => array (
					),
					'min' => '',
					'max' => '',
				),
			),
		),
	),
	'location' => array (
		array (
			array (
				'param' => 'post_type',
				'operator' => '==',
				'value' => 'post',
			),
		),
	),
	'menu_order' => 0,
	'position' => 'normal',
	'style' => 'default',
	'label_placement' => 'top',
	'instruction_placement' => 'label',
	'hide_on_screen' => '',
	'active' => 1,
	'description' => '',
));

endif;
