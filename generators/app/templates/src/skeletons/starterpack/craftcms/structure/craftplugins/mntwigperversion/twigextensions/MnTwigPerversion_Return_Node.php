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

class MnTwigPerversion_Return_Node extends \Twig_Node
{

	/**
	* Compiles a Return_Node into PHP.
	*/
	public function compile(\Twig_Compiler $compiler)
	{
		$compiler
			->addDebugInfo($this)
			->write("ob_end_clean();\n")
			->write('return ');
		if ($this->hasNode('expr')) {
			$compiler->subcompile($this->getNode('expr'));
		}
		else
		{
			$compiler->raw('""');
		}

		$compiler->raw(";\n");
	}
}
