module UiBibz::Ui::Core::Forms::Surrounds
  class SurroundSwitchField < UiBibz::Ui::Core::Forms::Choices::SwitchField

    # See UiBibz::Ui::Core::Dropdown.initialize
    def initialize content, options = nil, html_options = nil, &block
      super
    end

    private

    def component_wrapper_html_classes
      super << 'input-group'
    end

  end
end
