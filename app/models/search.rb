class Search < ApplicationRecord
  has_many :publications, dependent: :destroy
  after_create :parse_ris

  def parse_ris
    ris = split_ris_records(self.ris)
    ris.each do |publication|
      hash = parse_ris_to_hash(publication)

      Publication.create(
        kind:             hash[:type],
        publication_year: hash[:publication_year],
        primary_title:    hash[:primary_title],
        secondary_title:  hash[:secondary_title],
        start_page:       hash[:start_page],
        end_page:         hash[:end_page],
        volume_number:    hash[:volume_number],
        first_author:     hash[:first_author],
        journal_name:     hash[:journal_name],
        issue_number:     hash[:issue_number],
        primary_date:     hash[:primary_date],
        ris_hash:         hash.to_json,
        search: self
      ) unless hash.values.all?(&:blank?)
    end
  end

  def split_ris_records(ris)
    ris.split("\nER  -")
  end

  def parse_ris_to_hash(ris)
    hash  = {}
    lines = ris.split("\n").each {|line| line.strip }

    hash[:type]             = remove_ris_key(parse_ris_line(lines, "TY"))
    hash[:publication_year] = remove_ris_key(parse_ris_line(lines, "PY"))
    hash[:authors]          = parse_ris_multiple_lines(lines, "AU")
    hash[:primary_title]    = remove_ris_key(parse_ris_line(lines, "T1"))
    hash[:secondary_title]  = remove_ris_key(parse_ris_line(lines, "T2"))
    hash[:start_page]       = remove_ris_key(parse_ris_line(lines, "SP"))
    hash[:end_page]         = remove_ris_key(parse_ris_line(lines, "EP"))
    hash[:volume_number]    = remove_ris_key(parse_ris_line(lines, "VL"))
    hash[:first_author]     = remove_ris_key(parse_ris_line(lines, "A1"))
    hash[:journal_name]     = remove_ris_key(parse_ris_line(lines, "JO"))
    hash[:issue_number]     = remove_ris_key(parse_ris_line(lines, "IS"))
    hash[:primary_date]     = remove_ris_key(parse_ris_line(lines, "Y1"))

    hash
  end

  def parse_ris_line(lines, key, sep="  - ")
    lines.find {|line| line.start_with?(key + sep)}
  end

  def parse_ris_multiple_lines(lines, key, sep="  - ")
    results = lines.select {|line| line.start_with?(key + sep)}
    results.map {|result| remove_ris_key(result)}
  end

  def remove_ris_key(str)
    return if str.blank?
    str.split('  - ').last.gsub!("\r", "")
  end
end
