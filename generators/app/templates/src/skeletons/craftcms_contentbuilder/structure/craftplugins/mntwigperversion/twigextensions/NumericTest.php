<?php

/*
 * This file is part of the GeckoPackages.
 *
 * (c) GeckoPackages https://github.com/GeckoPackages
 *
 * This source file is subject to the MIT license that is bundled
 * with this source code in the file LICENSE.
 */

namespace GeckoPackages\Twig\Tests;

/**
 * Test if a given value is "numeric".
 *
 * The test will return false for hexadecimal strings as this will be
 * the default behaviour in PHP 7.
 *
 * @see http://php.net/manual/en/function.is-numeric.php
 *
 * @api
 *
 * @author SpacePossum
 */
class NumericTest extends \Twig_SimpleTest
{
    public function __construct()
    {
        parent::__construct(
            'numeric',
            null,
            array('node_class' => 'GeckoPackages\Twig\Tests\NumericTestNode')
        );
    }
}

final class NumericTestNode extends \Twig_Node_Expression_Test
{
    public function compile(\Twig_Compiler $compiler)
    {
        if (PHP_VERSION_ID >= 70000) {
            $compiler->raw('is_numeric(')->subcompile($this->getNode('node'))->raw(')');

            return;
        }

        // Forward support towards PHP 7.
        // Strings in hexadecimal notation are no longer regarded as `numeric`,
        // for example: `is_numeric('0xf4c3b00c')` returns `false`.
        // @see http://php.net/manual/en/function.is-numeric.php
        $var = $compiler->getVarName();
        $compiler
            ->raw(sprintf('(is_numeric($%s = ', $var))
            ->subcompile($this->getNode('node'))
            ->raw(sprintf(') && (!is_string($%s) || (strlen($%s) < 2 || (\'x\' !== $%s[1] && \'X\' !== $%s[1]))))', $var, $var, $var, $var))
        ;
    }
}
