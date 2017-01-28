<?php
namespace Craft;

class KintTwigExtension extends \Twig_Extension
{
    protected $env;

    public function getName()
    {
        return 'Kint Twig Extension';
    }

    public function getFunctions()
    {
        return array(
            'd'    => new \Twig_Function_Method($this, 'd'),
            'dd'   => new \Twig_Function_Method($this, 'dd'),
            's'    => new \Twig_Function_Method($this, 's'),
            'sd'   => new \Twig_Function_Method($this, 'sd'),
            'time' => new \Twig_Function_Method($this, 'time')
            );
    }

    public function initRuntime(\Twig_Environment $env)
    {
        $this->env = $env;
    }

    public function d($debug)
    {
        return craft()->kint->d($debug);
    }

    public function dd($debug)
    {
        return craft()->kint->dd($debug);
    }

    public function s($debug)
    {
        return craft()->kint->s($debug);
    }

    public function sd($debug)
    {
        return craft()->kint->sd($debug);
    }

    public function time()
    {
        return craft()->kint->time();
    }

}