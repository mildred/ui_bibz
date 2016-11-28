module UiBibz::Ui::Core::Inputs::Buttons

  # Create a button dropdown
  #
  # This element is an extend of UiBibz::Ui::Core::Dropdown
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
  # * +status+ - status of élement with symbol value:
  #   (+:primary+, +:secondary+, +:info+, +:warning+, +:danger+)
  # * +size+
  #   (+:xs+, +:sm+, +:lg+)
  # * +outline+ - Boolean
  # * +state+ - Symbol (+:active+, +:disabled)
  # * +type+ - Symbol (+:block)
  # * +glyph+ - Add glyph with name or hash options
  #   * +name+ - String
  #   * +size+ - Integer
  #   * +type+ - Symbol
  #
  # ==== Signatures
  #
  #   UiBibz::Ui::Core::Inputs::Buttons::ButtonDropdown.new(options = nil, html_options = nil).tap do |d|
  #     ...
  #     d.list content = nil, options = nil, html_options = nil, &block
  #     d.link content = nil, options = nil, html_options = nil, &block
  #     ...
  #   end
  #
  # ==== Examples
  #
  #   UiBibz::Ui::Core::Inputs::Buttons::ButtonDropdown.new(name, status: :success).tap do |d|
  #     d.link 'test', { url: '#Test1' }
  #     d.list('---')
  #     d.list('Header 1', { type: :header })
  #     d.link 'test2', { url: '#Test2' }
  #   end.render
  #
  # ==== Helper
  #
  #   button_dropdown(name, options = { tap: true }, html_options = {}) do |d|
  #     d.list(content, options = {}, html_options = {})
  #     d.list(options = {}, html_options = {}) do
  #       content
  #     end
  #   end
  #
  class ButtonDropdown < UiBibz::Ui::Core::Dropdown

    # See UiBibz::Ui::Core::Dropdown.initialize
    def initialize name, options = nil, html_options = nil, &block
      super
    end

    # Render html tag
    def render
      content_tag :div, html_options do
        concat button_html
        concat ul_html
      end
    end

    private

    def component_html_classes
      ['btn-group', type]
    end

    def component_html_options
      { role: 'group' }
    end

  end
end