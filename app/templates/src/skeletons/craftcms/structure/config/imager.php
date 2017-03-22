<?php
/**
 * Configuration file for Imager
 *
 * Override this by placing a file named 'imager.php' inside your config folder and override variables as needed.
 * Multi-environment settings work in this file the same way as in general.php or db.php
 */

return array(
//  'hashPath' => false,
//  'hashRemoteUrl' => 'host',
//  'awsEnabled' => false,
//  'awsAccessKey' => 'YOURID',
//  'awsSecretAccessKey' => 'YOURKEY',
//  'awsBucket' => 'YOURBUCKET',
//  'awsFolder' => 'YOURBUCKETFOLDER',
  'interlace' => true, // false, true ('line'), 'none', 'line', 'plane', 'partition'x
  'instanceReuseEnabled' => false,
  'allowUpscale' => false
);
