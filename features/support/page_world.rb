# encoding: utf-8
module TestModule
  def initialize_all
    @page||=BasePage.new
    @loginPage||=LogInPage.new
    @welcomePage||=WelcomePage.new
    @setupPage||=SetupPage.new
  end
end