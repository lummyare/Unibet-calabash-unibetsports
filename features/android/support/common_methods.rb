module CommonMethods

  def click_on_text(txt)
    touch "* text:'#{txt}'"
  end

  ## Assert if text to check is not shown before timeout
  def assert_wait_for_text(text, time_out=15)
    wait_for_text(text, timeout: time_out.to_i)
  end

  def wait_for_text(text, time_out=10)
    begin
      wait_for_text(text, timeout: time_out.to_i)
    rescue
      return false
    end
    puts text
    flash($g_query_str+" text:'#{text}'") if $g_flash
    return true
  end
end