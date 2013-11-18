# Primary Author: psaylor
module ApplicationHelper

    # helper method to render the given object as nicely formatted yaml on the page
    # must not call another render or redirct in the same controller method
    def render_as_yaml object
        render :text => object.to_yaml, :content_type => 'text/yaml'
    end
end
