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

class MnTwigPerversion_Continue_Node extends \Twig_Node
{
	/**
	 * Compiles a Continue_Node into PHP.
	 */
	public function compile(\Twig_Compiler $compiler)
	{
		$compiler
			->addDebugInfo($this)
			->write("if (array_key_exists('loop', \$context)) {\n")
			->indent()
			  ->write("++\$context['loop']['index0'];\n")
			  ->write("++\$context['loop']['index'];\n")
			  ->write("\$context['loop']['first'] = false;\n")
			  ->write("if (isset(\$context['loop']['length'])) {\n")
			  ->indent()
			    ->write("--\$context['loop']['revindex0'];\n")
			    ->write("--\$context['loop']['revindex'];\n")
			    ->write("\$context['loop']['last'] = 0 === \$context['loop']['revindex0'];\n")
			  ->outdent()
			  ->write("}\n")
			->outdent()
			->write("}\n")
			->write("continue;\n");
	}
}
