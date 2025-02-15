class CascadeWorkVoteDelete < ActiveRecord::Migration[5.2]
  def change
    # remove the old foreign_key
    remove_foreign_key :votes, :works
    
    # add the new foreign_key
    add_foreign_key :votes, :works, on_delete: :cascade
  end
end
