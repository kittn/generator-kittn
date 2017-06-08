<?php
/**
 * Richtext
 * ========
 * Simple Richttext Module
 */

namespace Craft;

$contentbuilder[] = ['objRichtext' =>
  $content->copy->getParsedContent()
];
