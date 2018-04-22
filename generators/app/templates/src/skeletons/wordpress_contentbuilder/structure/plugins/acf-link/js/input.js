(function($) {
    acf.fields.link = acf.field.extend({
        type: 'link',
        $el:  null,

        actions: {
            'ready':  'init',
            'append': 'init',
        },

        events: {
            'click a[data-name="add"]':    'add',
            'click a[data-name="edit"]':   'edit',
            'click a[data-name="remove"]': 'remove'
        },

        config: {
            selectors: {
                // Modal
                linkSubmit:     '#wp-link-submit',
                linkCancel:     '#wp-link-cancel a',
                linkClose:      '#wp-link-close',
                linkTitle:      '#wp-link-text',
                linkTitleWrap:  '.wp-link-text-field',
                linkUrl:        '#wp-link-url',
                linkTarget:     '#wp-link-target',
                linkTargetWrap: '.link-target',
                queryResults:   '#wp-link .query-results',

                // Hidden fields
                title:  '[data-name="title"]',
                url:    '[data-name="url"]',
                target: '[data-name="target"]',

                // Display elements
                displayTitle:  '[data-name="display-title"]',
                displayUrl:    '[data-name="display-url"]',
                displayTarget: '[data-name="display-target"]'
            },

            attrs: {
                showFields: 'data-show-fields'
            },

            classes: {
                hidden: 'acf-link-hidden',
                value:  'has-value'
            }
        },

        dom: {},

        state: {
            active:     false,
            showFields: []
        },

        focus: function() {
            this.$el = this.$field.find('.acf-link')
            this.o   = acf.get_data(this.$el)

            this.dom.body = $('body')

            // Modal
            this.dom.linkSubmit     = $(this.config.selectors.linkSubmit)
            this.dom.linkCancel     = $(this.config.selectors.linkCancel)
            this.dom.linkClose      = $(this.config.selectors.linkClose)
            this.dom.linkTitle      = $(this.config.selectors.linkTitle)
            this.dom.linkTitleWrap  = $(this.config.selectors.linkTitleWrap)
            this.dom.linkUrl        = $(this.config.selectors.linkUrl)
            this.dom.linkTarget     = $(this.config.selectors.linkTarget)
            this.dom.linkTargetWrap = $(this.config.selectors.linkTargetWrap)
            this.dom.queryResults   = $(this.config.selectors.queryResults)

            // Hidden fields
            this.dom.title  = this.$el.find(this.config.selectors.title)
            this.dom.url    = this.$el.find(this.config.selectors.url)
            this.dom.target = this.$el.find(this.config.selectors.target)

            // Display elements
            this.dom.displayTitle  = this.$el.find(this.config.selectors.displayTitle)
            this.dom.displayUrl    = this.$el.find(this.config.selectors.displayUrl)
            this.dom.displayTarget = this.$el.find(this.config.selectors.displayTarget)

            // Show fields
            this.state.showFields = JSON.parse(this.$el.attr(this.config.attrs.showFields))
        },

        init: function() {
            this.dom.linkSubmit.on('click', this.submit.bind(this))
            this.dom.linkCancel.on('click', this.onClose.bind(this))
            this.dom.linkClose.on('click', this.onClose.bind(this))
            this.dom.queryResults.on('river-select', this.riverSelect.bind(this))
        },

        add: function() {
            this.openModal()
            this.dom.linkTarget.prop('checked', false)
        },

        edit: function() {
            this.openModal()
            this.dom.linkTitle.val(this.dom.title.val())
            this.dom.linkUrl.val(this.dom.url.val())
            this.dom.linkTarget.prop('checked', !!parseInt(this.dom.target.val()))
        },

        riverSelect: function(e, li) {
            if ( ! this.dom.linkTitle.val()) {
                var title = li.find('.item-title').text()
                this.dom.linkTitle.val(title)
            }
        },

        remove: function() {
            this.render({
                title:  null,
                url:    null,
                target: false
            })

            this.$el.removeClass(this.config.classes.value)
        },

        submit: function(e) {
            if (this.state.active) {
                var title, attrs, link

                title = this.dom.linkTitle.val()
                attrs = wpLink.getAttrs()

                link = {
                    title:  title,
                    url:    attrs.href,
                    target: !!attrs.target
                }

                this.render(link)
                this.onClose()
            }
        },

        onClose: function(e) {
            this.state.active = false
            this.dom.linkTitleWrap.removeClass(this.config.classes.hidden)
            this.dom.linkTargetWrap.removeClass(this.config.classes.hidden)
        },

        render: function(link) {
            this.dom.title.val(link.title)
            this.dom.url.val(link.url)
            this.dom.target.val(link.target ? 1 : 0).change()

            this.dom.displayTitle.text(link.title)
            this.dom.displayUrl.attr('href', link.url).text(link.url)
            this.dom.displayTarget.text(acf._e('link', link.target ? 'newTab' : 'sameTab'))

            this.$el.addClass(this.config.classes.value)
        },

        openModal: function() {
            // WordPress makes things so easy and reusable, yay!
            wpActiveEditor = true
            wpLink.open('wpwrap')
            wpLink.textarea = this.dom.body

            if (this.state.showFields.indexOf('title') === -1) {
                this.dom.linkTitleWrap.addClass(this.config.classes.hidden)
            }

            if (this.state.showFields.indexOf('target') === -1) {
                this.dom.linkTargetWrap.addClass(this.config.classes.hidden)
            }

            this.state.active = true
        }
    })
})(jQuery)
