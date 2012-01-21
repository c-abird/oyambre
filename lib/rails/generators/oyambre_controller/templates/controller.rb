class Admin::<%= controller_class_name %>Controller < AdminController
  #oyambre_icon "images"
  #hide_in_overview

  active_scaffold :<%= class_name.demodulize.underscore %> do |config|
    # set list columns
    #config.list.columns = []
    #config.list.sorting = {:title => :desc}

    # set editable columns
    #editable_columns = []
    #config.create.columns = editable_columns
    #config.update.columns = editable_columns

    # disable links in list view
    #config.create.link = false 
    #config.delete.link = false 
    #config.update.link = false 

    # set form uis
    #config.columns[].form_ui = :text_editor
    #config.columns[].form_ui = :select
    #config.columns[].options = {
    #  :include_blank => true,
    #  :options       => [['Text', 'Value]]
    #}

    # add nested controllers
    #config.nested.add_link(:children)
  end
end 
