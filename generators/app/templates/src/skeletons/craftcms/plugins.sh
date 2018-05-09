#!/bin/sh

cd dist

echo ''
echo '>>> Installing: Craft 3 Pathtools'
composer require nystudio107/craft-pathtools
echo '--------------------------------------------------'

echo ''
echo '>>> Installing: Redactor'
composer require craftcms/redactor
echo '--------------------------------------------------'

echo ''
echo '>>> Installing: Craft3 Minify'
composer require nystudio107/craft-minify
echo '--------------------------------------------------'

echo ''
echo '>>> Installing: SVG Placeholder'
composer require mblode/svgplaceholder
echo '--------------------------------------------------'

echo ''
echo '>>> Installing: Sprout Active'
composer require barrelstrength/sprout-active
echo '--------------------------------------------------'

echo ''
echo '>>> Installing: Snitch'
composer require marionnewlevant/snitch
echo '--------------------------------------------------'

echo ''
echo '>>> Installing: Craft3 Fields'
composer require newism/craft3-fields
echo '--------------------------------------------------'

echo ''
echo '>>> Installing: Mailgun'
composer require craftcms/mailgun
echo '--------------------------------------------------'

echo ''
echo '>>> Installing: Child Me'
composer require mmikkel/child-me
echo '--------------------------------------------------'

echo ''
echo '>>> Installing: Logs'
composer require ether/logs
echo '--------------------------------------------------'

echo ''
echo '>>> Installing: Advanced URL Field'
composer require charliedev/advanced-url-field
echo '--------------------------------------------------'

echo ''
echo '>>> Installing: Supersort'
composer require topshelfcraft/supersort
echo '--------------------------------------------------'

echo ''
echo '>>> Installing: Architect'
composer require pennebaker/craft-architect
echo '--------------------------------------------------'

echo ''
echo '>>> Installing: Imager'
composer require aelvan/imager
echo '--------------------------------------------------'

echo ''
echo '>>> Installing: Seomatic'
composer require nystudio107/craft-seomatic
echo '--------------------------------------------------'

echo ''
echo '>>> Installing: Super Table'
composer require verbb/super-table
echo '--------------------------------------------------'

echo ''
echo '>>> Installing: Blockonomicon'
composer require charliedev/blockonomicon
echo '--------------------------------------------------'

echo ''
echo '>>> Installing: HTTP2 Server Push'
composer require superbig/craft3-http2serverpush
echo '--------------------------------------------------'

echo ''
echo '>>> Installing: Craft Linkfield'
composer require sebastianlenz/linkfield
echo '--------------------------------------------------'

echo ''
echo '>>> Installing: Craft Environment Label'
composer require topshelfcraft/environment-label
echo '--------------------------------------------------'

