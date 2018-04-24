<% if (projectstylelint === 'strict') { %>const font = {
  properties: ['font', 'font-family', 'font-size', 'line-height', 'font-weight', 'font-style']
}

const text = {
  properties: [
    'break',
    'column',
    'columns',
    'hyphens',
    'letter-spacing',
    'tab-size',
    'text',
    'white-space',
    'word-spacing',
    'word-wrap'
  ]
}

const color = {
  properties: [
    'opacity',
    'background',
    'box-decoration-break',
    'box-shadow',
    'color',
    'filter',
    'layer',
    'mask',
    'mix-blend-mode'
  ]
}

const scrollbar = {
  properties: ['scrollbar']
}

const outline = {
  properties: ['outline']
}

const list = {
  properties: ['list-style', 'marker-offset']
}

const tables = {
  properties: [
    'border-collapse',
    'border-spacing',
    'caption-side',
    'empty-cells',
    'speak-header',
    'table-layout'
  ]
}

const classification = {
  properties: ['content', 'clear', 'display', 'float', 'isolation', 'visibility']
}

const dimensions = {
  properties: [
    'block-size',
    'box-sizing',
    'size',
    'width',
    'min-width',
    'max-width',
    'height',
    'min-height',
    'max-height',
    'inline-size',
    'object'
  ]
}

const positioning = {
  properties: [
    'position',
    'top',
    'right',
    'bottom',
    'left',
    'z-index',
    'flex',
    'flex-wrap',
    'flex-direction',
    'justify-content',
    'align-content',
    'align-items',
    'align-self',
    'grid',
    'offset',
    'order',
    'overflow',
    'text-overflow',
    'clip',
    'vertical-align'
  ]
}

const margins = {
  properties: ['margin', 'margin-top', 'margin-right', 'margin-bottom', 'margin-left']
}

const padding = {
  properties: ['padding', 'padding-top', 'padding-right', 'padding-bottom', 'padding-left']
}

const border = {
  properties: ['border', 'border-color', 'border-style', 'border-width']
}

const dynamic = {
  properties: [
    'accelerator',
    'behavior',
    'caret-color',
    'cursor',
    'filter',
    'pointer-events',
    'resize',
    'touch-action',
    'zoom'
  ]
}

const generated = {
  properties: ['counter', 'fallback', 'include', 'quotes']
}

const international = {
  properties: [
    'direction',
    'ime-mode',
    'layout',
    'line-break',
    'ruby',
    'spacing',
    'text-autospace',
    'text-justify',
    'text-kashida-space',
    'unicode-bidi',
    'word-break',
    'writing-mode'
  ]
}

const print = {
  properties: ['marks', 'orphans', 'page-break', 'page', 'size', 'widows']
}

const aural = {
  properties: [
    'azimut',
    'cue',
    'elevation',
    'pause',
    'pitch-range',
    'play-during',
    'richness',
    'speak',
    'speech',
    'stress',
    'voice-family',
    'volume'
  ]
}

const animation = {
  properties: ['animation', 'transition', 'will-change']
}

const transform = {
  properties: ['transform', 'backface-visibility', 'perspective']
}

<% } %>module.exports = {
  'plugins': [
    'stylelint-order',
    'stylelint-scss',
    'stylelint-selector-bem-pattern'
  ],
  'extends': 'stylelint-config-sass-guidelines',
  'rules': {
    'at-rule-empty-line-before': [
      'never',
      {
        'except': [
          'inside-block'
        ],
        'ignore': [
          'after-comment',
          'inside-block'
        ]
      }
    ],
    'at-rule-name-case': 'lower',
    'at-rule-name-newline-after': 'always-multi-line',
    'at-rule-name-space-after': 'always',
    'at-rule-no-unknown': null,
    'at-rule-no-vendor-prefix': true,
    'block-closing-brace-empty-line-before': 'never',
    'block-closing-brace-newline-after': [
      'always',
      {
        'ignoreAtRules': [
          'if',
          'else'
        ]
      }
    ],
    'block-closing-brace-newline-before': 'always-multi-line',
    'block-closing-brace-space-after': 'always-single-line',
    'block-closing-brace-space-before': 'always-single-line',
    'block-no-empty': true,
    'block-opening-brace-newline-after': 'always',
    'block-opening-brace-newline-before': 'never-single-line',
    'block-opening-brace-space-after': 'always-single-line',
    'block-opening-brace-space-before': 'always-single-line',
    'color-hex-case': 'lower',
    'color-hex-length': 'short',
    'color-named': 'never',
    'color-no-invalid-hex': true,
    'comment-empty-line-before': [
      'always',
      {
        'except': [
          'first-nested'
        ],
        'ignore': [
          'after-comment',
          'stylelint-commands'
        ]
      }
    ],
    'comment-no-empty': true,
    'comment-whitespace-inside': 'always',
    'custom-property-empty-line-before': 'never',
    'declaration-bang-space-after': 'never',
    'declaration-bang-space-before': 'always',
    'declaration-block-no-duplicate-properties': [
      true,
      {
        'ignore': [
          'consecutive-duplicates-with-different-values'
        ]
      }
    ],
    'declaration-block-no-shorthand-property-overrides': true,
    'declaration-block-semicolon-newline-after': 'always',
    'declaration-block-semicolon-newline-before': 'never-multi-line',
    'declaration-block-semicolon-space-after': 'always-single-line',
    'declaration-block-semicolon-space-before': 'never',
    'declaration-block-single-line-max-declarations': 1,
    'declaration-block-trailing-semicolon': 'always',
    'declaration-colon-newline-after': 'always-multi-line',
    'declaration-colon-space-after': 'always-single-line',
    'declaration-colon-space-before': 'never',
    'declaration-empty-line-before': 'never',
    'font-family-name-quotes': 'always-where-recommended',
    'font-family-no-duplicate-names': true,
    'font-weight-notation': 'numeric',
    'function-blacklist': [
      'rgb'
    ],
    'function-calc-no-unspaced-operator': true,
    'function-comma-newline-after': 'never-multi-line',
    'function-comma-newline-before': 'never-multi-line',
    'function-comma-space-after': 'always',
    'function-comma-space-before': 'never',
    'function-linear-gradient-no-nonstandard-direction': true,
    'function-max-empty-lines': 0,
    'function-parentheses-newline-inside': 'never-multi-line',
    'function-parentheses-space-inside': 'never',
    'function-url-quotes': 'always',
    'function-whitespace-after': 'always',
    'indentation': 2,
    'keyframe-declaration-no-important': true,
    'length-zero-no-unit': true,
    'max-empty-lines': 2,
    'max-nesting-depth': 5,
    'media-feature-colon-space-after': 'always',
    'media-feature-colon-space-before': 'never',
    'media-feature-name-case': 'lower',
    'media-feature-name-no-unknown': true,
    'media-feature-name-no-vendor-prefix': true,
    'media-feature-parentheses-space-inside': 'never',
    'media-feature-range-operator-space-after': 'always',
    'media-feature-range-operator-space-before': 'always',
    'media-query-list-comma-newline-after': 'always',
    'media-query-list-comma-newline-before': 'never-multi-line',
    'media-query-list-comma-space-after': 'always-single-line',
    'media-query-list-comma-space-before': 'never',
    'no-duplicate-selectors': true,
    'no-empty-source': true,
    'no-eol-whitespace': true,
    'no-extra-semicolons': true,
    'no-invalid-double-slash-comments': true,
    'no-missing-end-of-source-newline': true,
    'no-unknown-animations': true,
    'number-leading-zero': <% if ( projectprettier === true ) { %>'always'<% } else { %>'never'<% } %>,
    'number-max-precision': 6,
    'number-no-trailing-zeros': true,<% if (projectstylelint === 'strict') { %>

    'order/order': [
      'custom-properties',
      'dollar-variables',
      'at-variables',
      {
        type: 'at-rule',
        name: 'include',
        hasBlock: false
      },
      'declarations',
      {
        type: 'at-rule',
        name: 'include',
        hasBlock: true
      },
      {
        type: 'at-rule',
        name: 'media',
        hasBlock: true
      },
      'rules',
      'at-rules'
    ],
    'order/properties-order': [
      classification,
      positioning,
      dimensions,
      padding,
      border,
      margins,
      list,
      tables,
      color,
      font,
      text,
      outline,
      transform,
      animation,
      dynamic,
      generated,
      international,
      print,
      aural,
      scrollbar
    ],<% } %>
    'order/properties-alphabetical-order': null,

    'property-case': 'lower',
    'property-no-unknown': true,
    'property-no-vendor-prefix': true,
    'rule-empty-line-before': [
      'always',
      {
        'except': [
          'after-single-line-comment',
          'first-nested'
        ],
        'ignore': [
          'after-comment'
        ]
      }
    ],
    'selector-attribute-brackets-space-inside': 'never',
    'selector-attribute-operator-space-after': 'never',
    'selector-attribute-operator-space-before': 'never',
    'selector-attribute-quotes': 'always',
    'selector-combinator-space-after': 'always',
    'selector-combinator-space-before': 'always',
    'selector-descendant-combinator-no-non-space': true,
    'selector-id-pattern': '^[a-zA-Z]+$',
    'selector-max-compound-selectors': 5,
    'selector-max-specificity': '0,4,0',
    'selector-max-id': 0,
    'selector-no-qualifying-type': [
      true,
      {
        'ignore': [
          'attribute'
        ]
      }
    ],
    'selector-pseudo-class-case': 'lower',
    'selector-pseudo-class-no-unknown': true,
    'selector-pseudo-class-parentheses-space-inside': 'never',
    'selector-pseudo-element-case': 'lower',
    'selector-pseudo-element-colon-notation': 'double',
    'selector-pseudo-element-no-unknown': true,
    'selector-type-case': 'lower',
    'selector-type-no-unknown': [true, {
      ignore: ['custom-elements', 'default-namespace']
    }],
    'selector-max-empty-lines': 0,
    'selector-list-comma-newline-after': 'always-multi-line',
    'selector-list-comma-newline-before': 'never-multi-line',
    'selector-list-comma-space-after': 'always-single-line',
    'selector-list-comma-space-before': 'never',
    'shorthand-property-no-redundant-values': true,
    'string-quotes': 'single',
    'unit-blacklist': [],
    'unit-case': 'lower',
    'unit-no-unknown': true,
    'value-no-vendor-prefix': true,
    'value-list-comma-newline-after': 'always-multi-line',
    'value-list-comma-newline-before': 'always-multi-line',
    'value-list-comma-space-after': 'always',
    'value-list-comma-space-before': 'never',
    'value-list-max-empty-lines': 0
  }
}
