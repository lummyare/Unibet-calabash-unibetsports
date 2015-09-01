
#based on App, Application strings are loaded from
# en_thomson_strings.rb or
# en_first_choice_strings.rb or
# en_thomson_strings.rb
module AppStrings
  def get_val(txt)
    eval("@@#{txt}")
  end

  def set_strings
    if $g_strings_set==true
      return
    else
      $g_strings_set=true
    end

    #Include the methods defined below here
    welcome_strings
    terms_conditions_strings
    conn_code_strings
  end

  ## --- write methods for strings present in each page

  def welcome_strings
    @@welcome_txt="Welcome to YouView"
    @@welcome_msg="The YouView app lets you plan your TV viewing and set recordings wherever you are."
  end

  def terms_conditions_strings
    @@accept='Accept' if $g_android
    @@accept='Agree'  if $g_ios
  end


  def conn_code_strings
    @@continue_txt="Continue"
  end
end
