class AddReferencesTotasks < ActiveRecord::Migration[6.0]
  def change
    change_table :tasks do |t|
      t.references :user, foreign_key: true, presence: true
    end
  end
end