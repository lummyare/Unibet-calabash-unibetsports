class HomePage < BasePage

  def verify_home_page(text)
    assert_text_present(text)
  end

end