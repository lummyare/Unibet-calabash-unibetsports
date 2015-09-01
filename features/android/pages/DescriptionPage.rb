require_relative '../base_page'

class DescriptionPage < BasePage

  def scroll_table(text)
    scroll_page_and_assert_text(text)
  end

  def scroll_view(dir)
    if (dir=="up")
      performAction('drag', 50, 50, 70, 90, 10)
    elsif (dir=="down")
      performAction('drag', 50, 50, 90, 70, 10)
    end
  end

  # scroll in specified direction till id is found
  def scroll_page_and_assert_text(id, dir="down",count=10)
    repeat_count=0
    sleep 1
    return if (element_exists("* text:'#{id}'"))

    while (repeat_count < count)
      repeat_count+=1
      scroll_view(dir)
      puts element_exists("* text:'#{id}'")
      puts "* text:'#{id}'"
      #if text we are searching is found break on success
      return if (element_exists("* text:'#{id}'"))
      sleep 0.5
    end
    fail "id/text #{id} not present on screen" if repeat_count==10
    sleep 2
  end

end
