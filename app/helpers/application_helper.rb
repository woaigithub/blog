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
  
  def markdown(text)
    options = {                                                                    
        :autolink => true,                                                           
        :space_after_headers => true,                                                
        :fenced_code_blocks => true,                                                 
        :no_intra_emphasis => true,                                                  
        :hard_wrap => true,                                                          
        :strikethrough =>true                                                        
      }
    markdown = Redcarpet::Markdown.new(HTMLwithCodeRay, options)
    #markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    markdown.render(text)
  end

  class HTMLwithCodeRay < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div(:tab_width=>2)
    end
  end

end
