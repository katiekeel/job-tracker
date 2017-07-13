class CreateJoinTableCategoryJob < ActiveRecord::Migration[5.1]
  def change
    create_join_table :categories, :jobs do |t|
      t.index [:category_id, :job_id]
      t.index [:job_id, :category_id]
    end
  end
end
