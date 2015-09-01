require_relative '../base_page'

class SetupPage < BasePage

  def verify_setup_page(text)
    assert_text_present(text)
  end

  def wait_for_connection_code
    assert_wait_for_text "Enter Connection Code"
  end

  def enter_connection_code code
    count=0
    sleep 2
    # touch("textField index:'0'")
    # code.split("").each { |i|
    code.each { |i|
      wait_for_keyboard()
      keyboard_enter_text i # repeat this step for each code
      sleep(STEP_PAUSE)
      count+=1
    }
  end

  def select_enter_code
    click_on_text "Enter Connection Code"
  end

  def wait_for_enter_connection_code_screen
    assert_wait_for_text "Enter the YouView box connection code."
  end

  def select_next
    click_on_text "Next"
    sleep (4)
  end
end
