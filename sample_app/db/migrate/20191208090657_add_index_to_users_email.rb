class AddIndexToUsersEmail < ActiveRecord::Migration[5.1]
  def change
    # usersテーブルemailカラムにindex追加 unique:true
    add_index :users, :email, unique:true
  end
end
