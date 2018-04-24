<?php
namespace Craft;
/**
 * MN Twig Perversion plugin for Craft CMS
 *
 * MN Twig Perversion Twig Extension
 *
 *
 * @author    Marion Newlevant
 * @copyright Copyright (c) 2016 Marion Newlevant
 * @link      http://marion.newlevant.com
 * @package   MnTwigPerversion
 * @since     1.0.0
 */

/* NumericTest is lifted straight out of https://github.com/GeckoPackages/GeckoTwig
*/
require_once('NumericTest.php');

class MnTwigPerversionTwigExtension extends \Twig_Extension
{
	/**
	 * Returns the name of the extension.
	 *
	 * @return string The extension name
	 */
	public function getName()
	{
		return 'MnTwigPerversion';
	}

	public function getTokenParsers()
	{
		return array(
			new MnTwigPerversion_Break_TokenParser(),
			new MnTwigPerversion_Continue_TokenParser(),
			new MnTwigPerversion_Return_TokenParser(),
		);
	}

	public function getTests()
	{
		return array(
			new \GeckoPackages\Twig\Tests\NumericTest(),
		);
	}

	public function getFilters()
	{
		return array(
			'json_decode' => new \Twig_Filter_Method($this, 'jsonDecode'),
			'date_from_string' => new \Twig_Filter_Method($this, 'dateFromString'),
			'array_splice' => new \Twig_Filter_Method($this, 'arraySplice'),
		);
	}


	/* ============== The filters =============== */
	public function jsonDecode($str)
	{
		return json_decode($str, true); // return assoc arrays (more twig-like)
	}

	public function dateFromString($str)
	{
		$timezone = new \DateTimeZone(craft()->timezone);
		$date = new \Craft\DateTime();
		$date->setTimezone($timezone);
		$date->setTimestamp(strtotime($str));
		return $date;
	}

	public function arraySplice(array $input, int $offset, int $length = null, $replacement = null)
	{
		if (is_null($length))
		{
			$length = count($input);
		}
		if (is_null($replacement))
		{
			$replacement = array();
		}
		$extracted = array_splice($input, $offset, $length, $replacement);
		return $input;
	}

}
