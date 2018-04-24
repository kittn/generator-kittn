(function (window) {

	if (!window.$ || !window.Craft || !window.Garnish) {
		return false;
	}

	Craft.CpSortableCustomColumnsPlugin = {

		ELEMENT_INDEX_SELECTOR : '.elementindex:first',
		SORT_BUTTON_SELECTOR : '.sortmenubtn:first',
		SORT_ATTRIBUTES_SELECTOR : '.menu ul.sort-attributes:first',
		TABLE_HEADER_SELECTOR : '.elementindex .tableview .data th[data-attribute]',

		mappedAttributes : {},

		init : function (sortableAttributes)
		{

			if (!this.sortableAttributes) {
				if (!sortableAttributes || Object.keys(sortableAttributes).length === 0) {
					return false;
				}
				this.sortableAttributes = sortableAttributes;
			}

			if (!this.timestamp) {
				this.timestamp = new Date().getTime();
			}

			if (!this.elementIndex) {
				this.elementIndex = Craft.elementIndex||null;
			}

			// Poll for the element index
			var self = this,
				now = new Date().getTime();

			if (!this.elementIndex) {
				if (now < this.timestamp + 1000) { // Give it time, baby
					Garnish.requestAnimationFrame(function () {
						self.init();
					});
				}
				return false;
			}

			this.$sortMenuBtn = this.elementIndex.$sortMenuBtn||false;

			if (!this.$sortMenuBtn || this.$sortMenuBtn.length === 0) {
				return false;
			}

			this.$sortMenuBtn.on('click touchstart mouseenter', $.proxy(this.onSortMenuBtnClick, this));
			Garnish.$doc.ajaxComplete($.proxy(this.onAjax, this));

		},

		getSortableAttribute : function (key)
		{
			return this.sortableAttributes.hasOwnProperty(key) ? this.sortableAttributes[key] : null;
		},

		requestUpdate : function ()
		{
			this.timestamp = new Date().getTime();
			this.update();
		},

		update : function ()
		{

			var self = this,
				now = new Date().getTime(),
				$indexTableHeaders = $(this.TABLE_HEADER_SELECTOR),
				$sortAttributes = $(this.SORT_ATTRIBUTES_SELECTOR),
				attributes = [];

			if (this.elementIndex.viewMode === 'thumbs') {

				// For thumbs view, only display default Assets' sortable attributes
				attributes = [
					'title',
					'filename',
					'size',
					'dateModified',
					'dateCreated',
					'dateUpdated'
				];

			} else {

				// Assuming table view – Update headers and set attributes
				var $header,
					attribute,
					attributeData;

				$indexTableHeaders.each(function () {

					$header = $(this);

					attribute = $header.data('attribute');

					// Hack to fix bug w/ Commerce active/inactive carts – thanks @engram-design
					if ($('body').hasClass('commerceordersindex') && attribute == 'dateUpdated') {
					    attribute = 'orders.dateUpdated';
					    $header.attr('data-attribute', attribute).data('attribute', attribute);
					}

					// Hack to enable sorting by author
					if (attribute === 'author') {
						attribute = 'authorId';
						$header
							.attr('data-attribute', attribute)
							.data('attribute', attribute);
					}

					// Hack to enable sorting by entry type
					if (attribute === 'type') {
						attribute = 'typeId';
						$header
							.attr('data-attribute', attribute)
							.data('attribute', attribute)
							.on('click', $.proxy(self.onCustomSortableTableHeaderClick, self));
					}

					attributeData = self.getSortableAttribute(attribute);

					if (attributeData || $header.hasClass('ordered') || $header.hasClass('orderable')) {
						if (attributeData && (attribute.split(':')[0] === 'field' || attribute === 'authorId') && attributeData.handle) {
							// This is a custom, sortable header
							self.mappedAttributes[attributeData.handle] = $.extend(attributeData, {
								attribute : attribute
							});
							attribute = attributeData.handle;
							if (!$header.data('_cpSortColsInitialized')) {
								$header
									.on('click', $.proxy(self.onCustomSortableTableHeaderClick, self))
									.data('_cpSortColsInitialized', true);
							}
						}
						attributes.push(attribute);
						if (!$header.hasClass('ordered') || !$header.hasClass('orderable')) {
							$header.addClass('orderable');
						}
					}
				});

			}

			// Attempt to update dropdown sort menu
			if ($sortAttributes.length === 0) {

				Garnish.requestAnimationFrame(function () {
					if (now < self.timestamp + 2000) {
						self.update();
					}
				});

			} else {

				var $sortAttributesItems = $sortAttributes.find('li'),
					$sortAttributeItem,
					attribute,
					attributeValue,
					attributeName,
					attributesInDropdown = [];

				$sortAttributesItems.show().each(function () {
					$sortAttributeItem = $(this);
					attributeValue = $sortAttributeItem.find('a:first').data('attr');
					if (attributeValue !== 'structure' && $.inArray(attributeValue, attributes) === -1) {
						$sortAttributeItem.hide();
						if ($sortAttributeItem.children('a').hasClass('sel')) {
							self.resetSelectedSortAttribute();
						}
					}
					attributesInDropdown.push(attributeValue);
				});

				// Add missing attributes
				for (var i = 0; i < attributes.length; ++i) {
					attribute = attributes[i];
					if ($.inArray(attribute, attributesInDropdown) === -1) {
						attribute = self.mappedAttributes[attribute] || null;
						if (attribute && attribute.name && attribute.handle) {
							$sortAttributes.append('<li><a data-attr="'+attribute.handle+'">'+attribute.name+'</a></li>');
						}
					}
				}

			}

			// Set currently sorted column
			var activeSortAttributeName = this.$sortMenuBtn.text(),
				sortOrder = this.elementIndex.getSelectedSortDirection(),
				$activeTableHeader = $(this.TABLE_HEADER_SELECTOR).filter(function () {
					return $(this).text() === activeSortAttributeName;
				});

			if ($activeTableHeader && !$activeTableHeader.hasClass('ordered')) {
				$(this.TABLE_HEADER_SELECTOR+'.ordered').removeClass('ordered');
				$activeTableHeader.attr('class', 'ordered');
			}

			// Set correct sort order icon for the currently ordered column
			$(this.TABLE_HEADER_SELECTOR+'.ordered').removeClass('asc desc').addClass(sortOrder);

		},

		resetSelectedSortAttribute : function ()
		{

			var $header = $(this.TABLE_HEADER_SELECTOR+':first'),
				attribute = $header.attr('data-attribute');

			this.elementIndex.setSortAttribute(attribute);
			this.elementIndex.storeSortAttributeAndDirection();
			this.elementIndex.updateElements();
			this.elementIndex.setIndexAvailable();

		},

		onAjax : function ()
		{
			var self = this;
			Garnish.requestAnimationFrame(function () {
				self.requestUpdate();
			});
		},

		onSortMenuBtnClick : function (e)
		{
			this.requestUpdate();
		},

		onCustomSortableTableHeaderClick : function (e)
		{

			var $header = $(e.target),
				isOrdered = $header.hasClass('ordered');

			$header.addClass('ordered loading');

			if (isOrdered) {

				var selectedSortDir = this.elementIndex.getSelectedSortDirection(),
					newSortDir = newSortDir = (selectedSortDir == 'asc' ? 'desc' : 'asc');
				$header.removeClass(selectedSortDir).addClass(newSortDir);

				this.elementIndex.setSortDirection(newSortDir);


			} else {

				var attribute = $header.attr('data-attribute'),
					attributeData = this.getSortableAttribute(attribute),
					attributeHandle = attributeData.handle;

				this.elementIndex.setSortAttribute(attributeHandle);

			}

			this.elementIndex.storeSortAttributeAndDirection();
			this.elementIndex.updateElements();
			this.elementIndex.setIndexAvailable();

		}

	};

}(window));