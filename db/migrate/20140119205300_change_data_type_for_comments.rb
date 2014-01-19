class ChangeDataTypeForComments < ActiveRecord::Migration
  def self.up
    change_table :comments do |t|
      t.change :content, :text
    end
  end
  def self.down
    change_table :comments do |t|
      t.change :content, :string
    end
  end
end
