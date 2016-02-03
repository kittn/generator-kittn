/**
 * Template Files
 * Pick the right filetype for the Watch Tasks
 */
import kc from '../../config.json'

const templateFiles = () => {
  if(kc.template.compiler) {<% if ( projectstructure == 'Twig Template' ) { %>
    return kc.src.template + '**/*.twig'<% } else if ( projectstructure == 'Jade Template' ) { %>
    return kc.src.template + '**/*.jade'<% } %>
  } else {
    return kc.src.structure + '**/**'
  }
}

module.exports = templateFiles
