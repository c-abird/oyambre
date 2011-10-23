ActiveRecord::Schema.define(:version => 0) do
    # ADMINS
    create_table "admins", :force => true do |t|
      t.string   :login,                     :limit => 40
      t.string   :name,                      :limit => 100, :default => '', :null => true
      t.string   :email,                     :limit => 100
      t.string   :crypted_password,          :limit => 40
      t.string   :salt,                      :limit => 40
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :remember_token,            :limit => 40
      t.datetime :remember_token_expires_at
    end
    add_index :admins, :login, :unique => true

    # create first admin
    Admin.create({
      :name                  => "Administrator",
      :login                 => "admin",
      :email                 => "admin@example.com",
      :password              => "inshalla",
      :password_confirmation => "inshalla"
    })

    # PAGES
    create_table "pages", :force => true do |t|
      t.column :ident,           :string
      t.column :dynamic_columns, :text
      t.column :values,          :text
    end
    add_index :pages, :ident, :unique => true
    Page.create_translation_table! :translated_values => :text

    # PAGE ATTACHMENTS
    create_table :page_attachments do |t|
      t.column :styles,            :string
      t.column :file_file_name,    :string 
      t.column :file_content_type, :string
      t.column :file_file_size,    :integer

      t.timestamps
    end
end
