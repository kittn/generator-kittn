<?php
namespace Craft;

/**
 * EnvironmentLabelPlugin
 *
 * @author    Tom Davies <tom@madebykind.com>, Michael Rog <michael@michaelrog.com>
 * @copyright Copyright (c) 2016, Kind
 * @see       https://github.com/madebykind/craft.labelenvironment
 * @package   craft.plugins.environmentlabel
 * @since     1.0
 */
class EnvironmentLabelPlugin extends BasePlugin
{

    /**
     * @return string
     */
    public function getName()
    {
        return "Environment Label";
    }

    /**
     * Return the plugin description
     *
     * @return string
     */
    public function getDescription()
    {
        return "...so you won't forget where you are.";
    }

    /**
     * Return the plugin developer's name
     *
     * @return string
     */
    public function getDeveloper()
    {
        return "Kind";
    }

    /**
     * Return the plugin developer's URL
     *
     * @return string
     */
    public function getDeveloperUrl()
    {
        return 'http://madebykind.com';
    }

    /**
     * Return the plugin's Documentation URL
     *
     * @return string
     */
    public function getDocumentationUrl()
    {
        return 'https://github.com/madebykind/craft.labelenvironment';
    }

    /**
     * Return the plugin's current version
     *
     * @return string
     */
    public function getVersion()
    {
        return '2.0.0';
    }

    /**
     * Return the plugin's db schema version
     *
     * @return string|null
     */
    public function getSchemaVersion()
    {
        return '0.0.0.0';
    }

    /**
     * Return the plugin's db schema version
     *
     * @return string
     */
    public function getReleaseFeedUrl()
    {
        return '';
    }

    /**
     * Return whether the plugin has a CP section
     *
     * @return bool
     */
    public function hasCpSection()
    {
        return false;
    }

    /**
     * Renders the environment label, if this is an authenticated CP request
     */
    function init() {

        /*
         * We only want to add the environment label to CP requests, and only after a user is logged in.
         */
        if (craft()->request->isCpRequest() && craft()->userSession->isLoggedIn())
        {
            craft()->environmentLabel->addEnvironmentLabel();
        }

    }

    /**
     * Registers the Twig extension
     *
     * @return EnvironmentLabelTwigExtension
     */
    public function addTwigExtension()
    {
        Craft::import('plugins.environmentlabel.twigextensions.*');
        return new EnvironmentLabelTwigExtension();
    }

}