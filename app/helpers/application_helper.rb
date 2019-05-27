module ApplicationHelper

  def flash_class(level)
    case level
        when 'notice' then "alert alert-dismissible alert-info"
        when 'success' then "alert alert-dismissible alert-success"
        when 'error' then "alert alert-dismissible alert-danger"
        when 'alert' then "alert alert-dismissible alert-warning"
    end
  end

  def gravatar_url(email, size)
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    default_url = "http://mysite.com/myavatar.png" # Acá puedo poner una ruta para una imagen propia.
    default_url = "retro"
    url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{CGI::escape(default_url)}"
  end

end
