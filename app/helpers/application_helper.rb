module ApplicationHelper


  def full_title(title)
    base = "Blog"
    unless title.blank?
      base = "#{title} | #{base}"
    
    
    end
    base
  end

  def admin_full_title(title)
    base = "Blog Admin"
    unless title.blank?
      base = "#{title} | #{base}"
    end

    base
  end
  
  
end
