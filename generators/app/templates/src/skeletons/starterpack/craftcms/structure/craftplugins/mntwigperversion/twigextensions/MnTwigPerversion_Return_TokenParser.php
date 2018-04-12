<?php
namespace Craft;

/**
 * MN Twig Perversion
 *
 * @package   MnTwigPerversion
 * @author    Marion Newlevant
 * @copyright Copyright (c) 2016, Marion Newlevant
 * @license   MIT
 * @link      https://github.com/marionnewlevant/craft-twig_perversion
 */

class MnTwigPerversion_Return_TokenParser extends \Twig_TokenParser
{

	public function parse(\Twig_Token $token)
	{
		$stream = $this->parser->getStream(); // entire stream of tokens
		$nodes = array();

		if (!$stream->test(\Twig_Token::BLOCK_END_TYPE))
		{
			$nodes['expr'] = $this->parser->getExpressionParser()->parseExpression();
		}

		$stream->expect(\Twig_Token::BLOCK_END_TYPE);

		return new MnTwigPerversion_Return_Node($nodes, array(), $token->getLine(), $this->getTag());
	}

	public function getTag()
	{
		return 'return';
	}

}

