require 'net/telnet'

module SharedMethods
  def embed a, b, c
  end

  def assert_text_present(text)
    if element_exists("#{$g_query_str} text:'#{text}'") == false
      fail("Not as expected ")
    end
  end

  ## Specify text to check and time to wait for
  def wait_for_text(text, time_out=10)
    begin
      wait_poll({:until_exists => $g_query_str+" text:'#{text}'", :timeout => time_out.to_i}) do
        sleep 1
        puts "waiting  #{time_out} seconds for text :#{text}:"
      end
    rescue
      return false
    end
    return true
  end


  def get_code
    host = Net::Telnet::new("Host" => "10.0.1.199", "Port" => 23, "Telnetmode" => true, "Timeout" => 15)
    sleep(2)
    host.cmd("dsend.py Zinc.DeviceManager /Zinc/DeviceManager/PairingRepository Zinc.DeviceManager.PairingRepository.clear booking-service") { |c| print c }
    sleep(2)
    response = host.cmd("pair_code=`dsend.py Zinc.DeviceManager /Zinc/DeviceManager/Pairer Zinc.DeviceManager.Pairer.pair booking-service`")
    response = host.cmd("echo $pair_code")
    puts response
    sleep (2)

    code_temp = response[16..-18]
    sleep (2)

    code = code_temp.split(//).last(8)
    puts "Final code is"
    puts code
    puts "End of code"
    sleep (4)
    host.close()

    return code
  end
end