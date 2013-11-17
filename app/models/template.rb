class Template < ActiveRecord::Base
	belongs_to :block

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