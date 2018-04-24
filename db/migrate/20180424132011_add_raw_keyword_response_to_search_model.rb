class AddRawKeywordResponseToSearchModel < ActiveRecord::Migration[5.2]
  def change
    add_column :searches, :raw_keyword_response, :jsonb
  end
end
