module UiBibz::Helpers::MetaHelper

  # Returns html script tags to include boostrap 3.3.1 [js,css], jquery 2.1.1 [js],
  # font-awesome 4.2.0 [css]
  #
  #   ui_bibz_meta_links
  #   # => <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" media="screen" rel="stylesheet" />
  #   #    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" media="screen" rel="stylesheet" />
  #   #    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css" media="screen" rel="stylesheet" />
  #   #    <script src=="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  #   #    <script src=="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
  def ui_bibz_meta_links
    capture do
      # Latest compiled and minified CSS
      concat stylesheet_link_tag "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css", title: 'Default'
      # font awesome icons
      concat stylesheet_link_tag "https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
      # Jquery is required for boostrap
      concat javascript_include_tag 'https://code.jquery.com/jquery-2.1.1.min.js'
      # Latest compiled and minified JavaScript
      concat javascript_include_tag "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"
    end
  end

  def ui_bibz_local_meta_links
    capture do
      # Latest compiled and minified CSS
      concat stylesheet_link_tag "bootstrap.min"
      # font awesome icons
      concat stylesheet_link_tag "font-awesome.min"
      # Jquery is required for boostrap
      concat javascript_include_tag 'jquery-2.1.4.min'
      # Latest compiled and minified JavaScript
      concat javascript_include_tag "bootstrap.min"
    end
  end


  #def ui_bibz_meta_links_ext
    #capture do
      ##concat javascript_include_tag '/vendor/assets/javascripts/moment.js'
      ##concat javascript_include_tag 'boostrap-datetimepicker.js'
    #end
  #end

end
