require_relative '../base_page'

class LogInPage < BasePage


  def verify_logIn_page(text)
    assert_text_present(text)
  end



  # def self_hosted_site
  #   touch("* marked:'Add Self-Hosted Site'")
  #   wait_for_none_animating
  # end

  def login(user,pass)
    enter_text(user_field, user)
    enter_text(pass_field, pass)
    sleep 1
    # wait_for_login_done
  end

  def enter_text(query_string, text)
    touch(query_string)
    wait_for_keyboard
    keyboard_enter_text text
  end


  def user_field
    sleep 1
     "view marked:'Email/Username'"
  end

  def pass_field
    sleep 1
     "view marked:'Password'"
  end

  # def site_field
  #   "* marked:'Site Address (URL)'"
  # end

  # def wait_for_login_done
  #   result = nil
  #   site_page = page(SitePage)
  #
  #
  #
  #   wait_for(timeout: 60) do
  #     if element_exists("label text:'Need Help?'")
  #       result = :invalid
  #     elsif element_exists(site_page.trait)
  #       result = :valid
  #     end
  #   end
  #
  #
  #   case result
  #     when :invalid
  #       self
  #     else
  #       site_page.await(timeout:10)
  #   end
  # end


end
