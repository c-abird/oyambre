class Admin::<%= controller_class_name %>Controller < AdminController
  #oyambre_icon "images"
  #hide_in_overview

  active_scaffold :<%= class_name.demodulize.underscore %> do |config|
    # set list columns
    #config.list.columns = []

    # set editable columns
    #editable_columns = []
    #config.create.columns = editable_columns
    #config.update.columns = editable_columns

    # set form uis
    #config.columns[].form_ui = :text_editor

    # add nested controllers
    #config.nested.add_link()
  end
end 
