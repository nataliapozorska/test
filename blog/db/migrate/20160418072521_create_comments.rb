class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :post #kolumna z kluczem laczacym oba modele

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
