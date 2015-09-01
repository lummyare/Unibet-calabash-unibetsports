# encoding: utf-8
require 'calabash-cucumber/ibase'
require_relative '../ios/support/common_methods'
require_relative '../support/page_world'
require_relative '../support/share_methods'
require_relative '../common/strings/application_strings'

class BasePage < Calabash::IBase
  include CommonMethods
  include TestModule
  include SharedMethods
  include AppStrings

  def initialize
  end

end
