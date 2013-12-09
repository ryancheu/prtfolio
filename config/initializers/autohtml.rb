# http://stackoverflow.com/questions/15558781/auto-html-breaking-rails-migrations
if File.basename($0) == 'rake' && ARGV.grep(/db:/)
  class ActiveRecord::Base
    def self.auto_html_for(field, &block)
        #nothing
    end
  end

else

  AutoHtml.add_filter(:strip_tags).with({}) do |text, options|
    view = ActionView::Base.new
    view.strip_tags text
  end
  AutoHtml.add_filter(:autolink).with({}) do |text, options|
    view = ActionView::Base.new
    view.auto_link(text, :html => { :target => '_blank', :rel => "nofollow" })
  end


  class ActiveRecord::Base
    class << self
      alias_method :auto_html_for!, :auto_html_for
    end

    def self.auto_html_for(field, &block)
      auto_html_for!(field, &block)
    end
  end

end