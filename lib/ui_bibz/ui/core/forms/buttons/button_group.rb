module UiBibz::Ui::Core::Forms::Buttons

  # Create a button group
  #
  # This element is an extend of UiBibz::Ui::Core::Component.
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
  # * +status+ - status of element with +symbol+ value:
  #   (+:primary+, +:secondary+, +:info+, +:warning+, +:danger+)
  # * +size+ - Size of element with +symbol+ value:
  #   (+:xs+, +:sm+, +:lg+)
  # * +position+ - Position vertical or horizontal with +symbol+ value:
  #   (+:vertical+, +:horizontal+)
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Forms::Buttons::ButtonGroup.new(options = nil, html_options = nil) do
  #     ...
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Forms::Buttons::ButtonGroup.new(position: :vertical, size: :xs) do
  #     UiBibz::Ui::Core::Forms::Buttons.Button.new('test').render
  #     UiBibz::Ui::Core::Forms::Buttons.Button.new('test2').render
  #   end.render
  #
  # ==== Helper
  #
  #   button_group(content, options = {}, html_options = {})
  #
  #   button_group(options = {}, html_options = {}) do
  #     content
  #   end
  #
  class ButtonGroup < UiBibz::Ui::Core::Component

    # See UiBibz::Ui::Core::Component.initialize
    def initialize content = nil, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      button_group_html_tag
    end

  private

    def button_group_html_tag
      content_tag :div, content, html_options
    end

    def component_html_classes
      ["btn-#{ type }", size, position]
    end

    def component_html_options
      { role: type }
    end

    def type
      options[:type] || :group
    end

    def component_html_data
      super
      add_html_data "toggle", "buttons"
    end

    def size
      "btn-group-#{ options[:size] }" if options[:size]
    end

    def position
      "btn-group-#{ options[:position] }" if options[:position]
    end

  end
end
