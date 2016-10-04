class AddUserReferenceToPets < ActiveRecord::Migration[5.0]
  def change
    add_reference :pets, :owner, index: true, foreign_key: true
  end
end
