# Primary Author: psaylor
module BlocksHelper

    # Returns the name of the template partial for the given template id
    def get_template_name template_id
        case template_id
        when 1
            return "template1_image_text"
        when 2
            return "template2_text_image"
        when 3
            return "template3_image_image"
        when 4
            return "template4_single_image"
        when 5
            return "template5_single_text"
        else
            return nil
        end
    end

    # Returns the blocks resources in a hash that can be passed into its template 
    def get_resources_for_template block
        resource_hash = {image1_src: nil, image2_src: nil, text1: nil}
        if block.firstres.is_a?(Image)
            # resource_hash[:image1_src] = 
        elsif block.firstres.is_a?(Code)
        elsif block.firstres.is_a?(Description)
        end
             
    end


end
