# Primary Author: psaylor
module BlocksHelper

    # Returns the name of the template partial for the given template id
    def get_template_partial_name template_id
        template_id = template_id || 1
        return "templates/template#{template_id}"
    end

    # Returns the blocks resources in a hash that can be passed into its template 
    def get_resources_for_template block
        resource_hash = { resource1: block.firstres, resource2: block.secondres }
        return resource_hash  
    end

    def get_full_blocks_for_project project
      returns = []
      project.blocks.each do |block|
        if (!block.firstres.nil? and !block.secondres.nil?) or (block.template_id == 1 and !block.firstres.nil?)
          returns << block
        end
      end
      return returns
    end


end
