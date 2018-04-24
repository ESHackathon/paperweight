class AddJsonToPublication < ActiveRecord::Migration[5.2]
  def change
    add_column :publications, :ris_hash, :jsonb
  end
end
