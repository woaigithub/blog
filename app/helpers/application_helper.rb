module ApplicationHelper


  def full_title(title)
    base = "Blog"
    unless title.blank?
      base = "#{title} | #{base}"
    
    
    end
    base
  end
end
