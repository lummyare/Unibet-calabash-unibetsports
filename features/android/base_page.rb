# encoding: utf-8
require 'calabash-android/abase'
require_relative 'support/common_methods'
require_relative '../support/page_world'
require_relative '../support/share_methods'
require_relative '../common/strings/application_strings'

class BasePage < Calabash::ABase
  include CommonMethods
  include TestModule
  include SharedMethods
  include AppStrings

  def initialize
  end

end
