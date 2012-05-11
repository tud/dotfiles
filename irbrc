require 'rubygems' unless defined? Gem

begin
    require 'wirb'
    require 'wirb/wp'
    Wirb.start
rescue LoadError => err
    warn "Couldn't load Wirb: #{err}"
end

#begin
#    require 'bond'
#    Bond.start
#rescue LoadError => err
#    warn "Couldn't load Bond: #{err}"
#end

begin
    require 'hirb'
    Hirb.enable
    #Hirb::View.enable
rescue LoadError => err
    warn "Couldn't load hirb: #{err}"
end

if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  # loggers
  ActiveRecord::Base.logger = Logger.new STDOUT
  ActiveRecord::Base.clear_reloadable_connections!
  ActionController::Base.logger = Logger.new STDOUT

  # named routes and helpers
  include Rails.application.routes.url_helpers
  default_url_options[:host] = Rails.application.class.parent_name.downcase
  #include ActionView::Helpers           # All Rails helpers
  include ApplicationController._helpers # Your own helpers
  # unfortunately that breaks some functionality (e.g. the named route helpers above)
  #  so, look at actionpack/lib/action_view/helpers.rb and choose the helpers you need
  #  (and which don't break anything), e.g.
  include ActionView::Helpers::DebugHelper
  include ActionView::Helpers::NumberHelper
  #include ActionView::Helpers::RawOutputHelper
  include ActionView::Helpers::SanitizeHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::TranslationHelper
end

# setting prompt
app_name = Rails.application.class.parent_name.downcase
app_env  = Rails.env[0...3]
#rvm_ruby_string = ENV["rvm_ruby_string"] || `rvm tools identifier`.strip.split("@", 2)[0]
rvm_ruby_string = ENV["rvm_ruby_string"] || `rvm tools identifier`.strip.split("-")[1]
IRB.conf[:PROMPT] ||= {}
IRB.conf[:PROMPT][:RAILS] = {
  :PROMPT_I => "#{rvm_ruby_string}:#{ app_name }(#{ app_env })> ",
  :PROMPT_N => "#{rvm_ruby_string}:#{ app_name }(#{ app_env })| ",
  :PROMPT_C => "#{rvm_ruby_string}:#{ app_name }(#{ app_env })| ",
  :PROMPT_S => "#{rvm_ruby_string}:#{ app_name }(#{ app_env })%l ",
  :RETURN => "=> %s\n",
  :AUTO_INDENT => true,
}
IRB.conf[:PROMPT_MODE] = :RAILS

class Object
  # get all the methods for an object that aren't basic methods from Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end 
