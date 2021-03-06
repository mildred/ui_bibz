# frozen_string_literal: true

require 'test_helper'
class NavbarTest < ActionView::TestCase
  test 'Navbar' do
    actual = UiBibz::Ui::Core::Navigations::Navbar.new
    expected = "<nav class=\"navbar navbar-light navbar-expand-lg\"><div class=\"container\"><button class=\"navbar-toggler hidden-sm-up\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"##{actual.id}\">☰</button><div class=\"navbar-collapse collapse\" id=\"#{actual.id}\"></div></div></nav>"

    assert_equal expected, actual.render
  end

  test 'Navbar with options' do
    actual = UiBibz::Ui::Core::Navigations::Navbar.new(title: 'Brand', expand_size: :xs, status: :primary, position: :top, brand_position: :right)
    expected = "<nav class=\"bg-primary navbar navbar-light fixed-top navbar-expand-xs\"><div class=\"container\"><button class=\"navbar-toggler hidden-sm-up\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"##{actual.id}\">☰</button><span class=\"navbar-brand\">Brand</span><div class=\"navbar-collapse collapse\" id=\"#{actual.id}\"></div></div></nav>"

    assert_equal expected, actual.render
  end

  test 'Navbar with brand, nav, form and text' do
    actual = UiBibz::Ui::Core::Navigations::Navbar.new.tap do |nb|
      nb.brand 'Brand'
      nb.nav do |n|
        n.link 'Home', state: :active, url: '#Home', selector: 'home'
        n.link 'Profile', url: '#profile', selector: 'profile'
        n.link 'Messages', url: '#messages', selector: 'messages'
      end
      nb.form '#', { type: :form_tag, position: :right } do
        UiBibz::Ui::Core::Forms::Texts::TextField.new('search').render
        UiBibz::Ui::Core::Forms::Buttons::Button.new('Search').render
      end
      nb.text 'test'
    end
    expected = "<nav class=\"navbar navbar-light navbar-expand-lg\"><div class=\"container\"><span class=\"navbar-brand\">Brand</span><button class=\"navbar-toggler hidden-sm-up\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"##{actual.id}\">☰</button><div class=\"navbar-collapse collapse\" id=\"#{actual.id}\"><ul class=\"navbar-nav\"><li class=\"nav-item\"><a href=\"#Home\" class=\"active nav-link\">Home</a></li><li class=\"nav-item\"><a href=\"#profile\" class=\"nav-link\">Profile</a></li><li class=\"nav-item\"><a href=\"#messages\" class=\"nav-link\">Messages</a></li></ul><form type=\"form_tag\" position=\"right\" class=\"d-flex\" action=\"#\" accept-charset=\"UTF-8\" method=\"post\"><button class=\"btn-secondary btn\">Search</button></form><span class=\"navbar-text\">test</span></div></div></nav>"

    assert_equal expected, actual.render
  end

  test 'status' do
    actual = UiBibz::Ui::Core::Navigations::Navbar.new(type: :dark, status: :dark).tap do |nb|
      nb.brand image_tag 'ruby-white'
      nb.nav do |n|
        n.link 'Link', url: '#link'
      end
    end
    expected =
      "<nav class=\"bg-dark navbar navbar-dark navbar-expand-lg\"><div class=\"container\"><span class=\"navbar-brand\"><img src=\"/images/ruby-white\" /></span><button class=\"navbar-toggler hidden-sm-up\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"##{actual.id}\">☰</button><div class=\"navbar-collapse collapse\" id=\"#{actual.id}\"><ul class=\"navbar-nav\"><li class=\"nav-item\"><a href=\"#link\" class=\"nav-link\">Link</a></li></ul></div></div></nav>"

    assert_equal expected, actual.render
  end
end
