require_relative '../base_page'

class SetupPage < BasePage

  def verify_setup_page(text)
    assert_text_present(text)
  end

  def wait_for_connection_code
    wait_for_text("Enter Code", timeout: 10)
  end

  def enter_connection_code code
    count=0
    # code.split("").each { |i|
    code.each { |i|
      query("com.youview.widget.YVCodeEditText index:#{count}", setText: i)
      sleep(STEP_PAUSE)
      count+=1
    }

  end

  def select_enter_code
    click_on_text "Enter Code"
  end

  def wait_for_enter_connection_code_screen
    assert_wait_for_text "Enter the YouView box connection code."
  end


  def select_next
    click_on_text @@continue_txt
    sleep (4)
  end
end
