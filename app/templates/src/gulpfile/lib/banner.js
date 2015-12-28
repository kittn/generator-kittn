/**
 * Banner
 * @description Define the Header that be integrated in the published
 * CSS and JS Files
 */

import pkg from '../../package.json'

const bannerHeader = () => {
  return `**
   * <%%= pkg.name %> - <%%= pkg.description %>
   * @version <%%= pkg.version %>
   * @link <%%= pkg.homepage %>
   * @license <%%= pkg.license %>
   * ----------------------------
   * Based on <%= pkg.name %> v<%= pkg.version %>
   * Link <%= pkg.homepage %>
   * ----------------------------
   **/`
}

module.exports = bannerHeader
