module AlertHelper

  def add_alert_message(key)
    case key.to_sym
      when :alert
        "alert-danger"
      when :warning
        "alert-warning"
      when :notice
        "alert-success"
      else
        "alert-info"
    end  
  end  
end
