# frozen_string_literal: true

require 'test_helper'
class ToastTest < ActionView::TestCase
  include UiBibz::Helpers::Ui::CoreHelper

  test 'toast' do
    actual = ui_toast(auto_hide: true, class: 'my-toast') do |t|
      t.header 'My header toast', glyph: 'eye', time: 'Now', class: 'my-header-toast'
      t.body 'My body toast', class: 'my-body-toast'
    end
    expected = "<div data-bs-autohide=\"true\" class=\"my-toast toast\" role=\"alert\" aria-live=\"assertive\" aria-atomic=\"true\"><div class=\"my-header-toast toast-header\"><i class=\"me-2 glyph fas fa-eye\"></i><strong class=\"me-auto\">My header toast</strong><small class=\"text-muted\">Now</small><button class=\"ml-2 mb-1 btn-close\" data-bs-dismiss=\"toast\" aria-label=\"Close\"></button></div><div class=\"my-body-toast toast-body\">My body toast</div></div>"

    assert_equal expected, actual
  end

  test 'toast without header and body' do
    actual = ui_toast do
      'My body toast'
    end
    expected = "<div class=\"toast\" role=\"alert\" aria-live=\"assertive\" aria-atomic=\"true\"><div class=\"toast-body\">My body toast</div></div>"

    assert_equal expected, actual
  end
end
