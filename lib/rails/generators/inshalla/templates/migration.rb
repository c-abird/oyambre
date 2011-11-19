class CreateOyambreTables < ActiveRecord::Migration
  def self.up
    SCHEMA_AUTO_INSERTED_HERE
  end

  def self.down
    drop_table :admins
    drop_table :pages
    Page.drop_translation_table!
    drop_table :page_attachments
  end
end
