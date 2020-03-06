# frozen_string_literal: true

# require 'will_paginate'
require 'will_paginate-bootstrap4'
require 'ui_bibz/ui/ux/tables/components/store'
module UiBibz::Ui::Ux::Tables
  # Create a pagination for table
  #
  # ==== Attributes
  #
  # * +options+ - Options of element
  # * +html_options+ - Html Options of element
  #
  # ==== Options
  #
  # You can add HTML attributes using the +html_options+.
  # You can pass arguments in options attribute:
  # * +store+ - Store generate by '+table_search_pagination+' method
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Ux::Tables::TablePagination.new(store: @store)
  #
  # ==== Helper
  #
  #    table_pagination(options = {})
  #
  class TablePagination < UiBibz::Ui::Base
    include WillPaginate::ActionView
    include ActionView
    # include WillPaginate::ActionView::BootstrapLinkRenderer

    # Initialize pagination with component item
    # pagination require WillPaginate gem
    def initialize(options = nil, html_options = nil)
      @pagination = UiBibz::Ui::Core::Component.new nil, options, html_options
    end

    # Render html tag with boostrap pagination theme
    def render
      paginate_parameters = { controller: store.controller }
      paginate_parameters = paginate_parameters.merge({ store_id: store.id }) unless store.id.nil?
      paginate_parameters = paginate_parameters.merge(store.parameters)
      paginate_parameters = paginate_parameters.merge({ link_type: 'pagination' })
      will_paginate(store.records, params: paginate_parameters.with_indifferent_access.reject { |k, v| default_parameters?(k) || v.blank? }, renderer: WillPaginate::ActionView::BootstrapLinkRenderer)
    end

    private

    def default_parameters?(key)
      %w[per_page page link_type].include?(key)
    end

    # Store must be generated by *table_search_pagination* method
    def store
      raise 'Store is nil!' if @pagination.options[:store].nil?
      raise 'Store can be created only with "table_search_pagination" method!' if @pagination.options[:store].try(:records).nil?

      @store ||= Store.new @pagination.options[:store]
    end
  end
end
