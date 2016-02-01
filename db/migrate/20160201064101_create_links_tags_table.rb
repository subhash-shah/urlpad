class CreateLinksTagsTable < ActiveRecord::Migration
  def change
    create_table :links_tags do |t|
    	t.references :link, index: true
    	t.references :tag, index: true
    end
  end
end
