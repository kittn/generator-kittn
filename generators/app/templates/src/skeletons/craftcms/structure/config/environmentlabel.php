<?php
/**
 * Environment Configuration
 */

return array(
  '*' => array(),
  // Productive Environment
  'productive'  => array(
    'showLabel' => false,
  ),
  // Stage or Test Environment
  'staging'  => array(
    'showLabel' => true,
    'labelColor' => '#0e8aab',
    'suffix' => ' :: ENVIRONMENT'
  ),
  // Local Development
  'local'  => array(
    'showLabel' => true,
    'suffix' => ' :: ENVIRONMENT'
  )
);
