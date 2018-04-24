class AddColumnsToPublication < ActiveRecord::Migration[5.2]
  def change
    add_column :publications, :kind, :string
    add_column :publications, :publication_year, :string
    add_column :publications, :primary_title, :string
    add_column :publications, :secondary_title, :string
    add_column :publications, :start_page, :string
    add_column :publications, :end_page, :string
    add_column :publications, :volume_number, :string
    add_column :publications, :first_author, :string
    add_column :publications, :journal_name, :string
    add_column :publications, :issue_number, :string
    add_column :publications, :primary_date, :string
  end
end
