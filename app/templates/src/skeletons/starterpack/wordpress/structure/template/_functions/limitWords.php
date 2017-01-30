<?php
/**
  Limit Words
  ===========
  Limit Words from the_content()

  Example:
  <?= limit_words(get_the_excerpt(), '41'); ?>
*/

function limit_words($string, $word_limit) {
	$words = explode(' ', $string);

	return implode(' ', array_slice($words, 0, $word_limit));
}
