module CommonMethods

  def click_on_text(txt)
    puts "view text:'#{txt}'"
    touch "view text:'#{txt}'"
  end

  def scroll_table(text)
    section=0
    scroll_to_cell(:row => 0, :section => 0)  #scroll to top of table
    sleep 1
#Below code loops through each cell to check if the appropriate text was found
    each_cell(:animate => false, :post_scroll => 0.2) do |row, sec|
      if query("tableViewCell indexPath:#{row},#{sec} label", :text).first==text
        break # if text found break from loop
      end
      section=section+1
    end
  end

  ## Assert if text to check is not shown before timeout
  def assert_wait_for_text(text, time_out=15)
    fail "Text is empty" if text==nil
    puts "assert_wait_for_text (#{text})"
    res=query("view",:text)
    wait_for_element_exists("#{$g_query_str} text:'#{text}'",{:timeout=>time_out.to_i,:timeout_message=>"#{res}"})
  end

  def wait_for_text(text, time_out=10)
    begin
      wait_for_element_exists("#{$g_query_str} text:'#{text}'",{:timeout=>time_out.to_i})
    rescue
      return false
    end
    puts text
    flash($g_query_str+" text:'#{text}'") if $g_flash
    return true
  end
end