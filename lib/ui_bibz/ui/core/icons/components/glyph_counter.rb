# frozen_string_literal: true

module UiBibz::Ui::Core::Icons::Components
  class GlyphCounter < UiBibz::Ui::Core::Icons::Components::GlyphText
    # See UiBibz::Ui::Core::Component.initialize

    private

    def component_html_classes
      ['fa-layers-counter', position]
    end

    def position
      "fa-layers-#{options[:position]}" if options[:position]
    end
  end
end
