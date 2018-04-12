<?php
namespace Craft;

/**
 * MN Twig Perversion
 *
 * @package   MnTwigPerversion
 * @author    Marion Newlevant
 * @copyright Copyright (c) 2014, Marion Newlevant
 * @license   MIT
 * @link      https://github.com/marionnewlevant/craft-twig_perversion
 */

class MnTwigPerversion_Break_TokenParser extends \Twig_TokenParser
{

	public function parse(\Twig_Token $token)
	{
		$this->parser->getStream()->expect(\Twig_Token::BLOCK_END_TYPE);

		return new MnTwigPerversion_Break_Node(array(), array(), $token->getLine(), $this->getTag());
	}

	public function getTag()
	{
		return 'break';
	}

}

