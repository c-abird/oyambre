# now the form helper can be overidden
module ActiveScaffold
  module Helpers
    module FormColumnHelpers
      def active_scaffold_input_paperclip(column, options)
        options = active_scaffold_input_text_options(options)
        paperclip = @record.send("#{column.name}")

        # Left column (thumbnail)
        if paperclip.file?     
          img = if paperclip.styles.include?(:thumbnail_big)
                image_tag(paperclip.url(:thumbnail_big), :border => 0)
              else
                image_tag('oyambre/thumb_file.png')
              end
          content = link_to(img, paperclip.url)
        else
          content = image_tag('oyambre/thumb_none.png')
        end

        # Right column (controls)
        input  = file_field(:record, column.name, options)
        hidden = hidden_field(:record, "delete_#{column.name}", :value => "false")

        if ActiveScaffold.js_framework == :jquery
          js_remove_file_code =  "$(this).prev().val('true');";
          js_remove_file_code << "$(this).parent().prev().find('img').attr('src', '/assets/oyambre/thumb_none.png');"
          # TODO deactivate link
          js_remove_file_code << "return false;"

        else
          js_remove_file_code = "alert('This feature does only work with JQuery.');"
        end
        remove_link = content_tag(:a, I18n.t('oyambre.remove_file'), {:href => '#', :onclick => js_remove_file_code})

        controls = hidden + remove_link + input

        content_tag(:div, content,  :class => 'file_left') +
        content_tag(:div, controls, :class => 'file_right')
      end
    end
  end
end
