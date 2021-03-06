# frozen_string_literal: true

module UiBibz::Ui::Core::Navigations
  # Create a NavbarText
  #
  # ==== Attributes
  #
  # * +content+ - Content of element
  # * +options+ - Options of element
  # * +html_options+ - Html Options of element
  #
  # ==== Options
  #
  # You can add HTML attributes using the +html_options+.
  # You can pass arguments in options attribute:
  # * +position+ - Symbol
  #   (+:right+, +:left+)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Navigations::NavbarText.new(content, options = nil, html_options = nil)
  #
  #   UiBibz::Ui::Core::Navigations::NavbarText.new(options = nil, html_options = nil) do
  #     content
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Navigations::NavbarText.new('Exemple).render
  #
  #   UiBibz::Ui::Core::Navigations::NavbarText.new(position: :right) do
  #     'Exemple'
  #   end.render
  #
  class NavbarText < UiBibz::Ui::Core::Component
    # See UiBibz::Ui::Core::Component.initialize

    # Render html tag
    def pre_render
      content_tag :span, content, html_options
    end

    private

    def component_html_classes
      ['navbar-text', position]
    end

    def position
      "navbar-#{options[:position]}" unless options[:position].nil?
    end
  end
end
