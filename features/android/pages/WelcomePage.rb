class WelcomePage < BasePage

  def verify_welcome_page
    if element_exists("#{$g_query_str} text:'#{@@welcome_txt}'")
      assert_wait_for_text @@welcome_txt
      assert_wait_for_text @@welcome_msg
      return true
    else
      return false
    end

  end

  def navigate_to_setup_page

  end

  def accept_terms_conditions
    sleep 2
    #if Terms and conditions are present accept it
    if element_exists("#{$g_query_str} text:'#{@@accept}'")
      #TODO add more verifications
      click_on_text @@accept
    end
  end
end