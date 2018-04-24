const whitelist = []
const whitelistPatterns = [/flickity/, /plj/, /pswp/, /^strong$/, /^h1/, /^h2$/, /^h3$/, /^h4$/, /^h5$/, /^h6$/, /^dfn$/, /^em$/, /^abbr$/, /hightlight$/, /^dl$/, /^kbd$/,/^pre$/,/^samp$/, /^sub$/, /^sup$/, /^map_canvas/, /^object$/, /^video$/, /^fieldset$/, /^legend$/, /^button$/, /^input/, /^optgroup$/, /^select$/, /^textarea$/, /^table$/, /^xmp$/, /^plaintext$/, /^listing$/, /^link-hover$/, /^dd$/]
const whitelistPatternsChildren = [/^flickity/, /^plj/, /^pswp/, /^has-scrollbar$/, /edge$/, /^c-/, /^e-/, /^o-/]

module.exports = { whitelist, whitelistPatterns, whitelistPatternsChildren }
