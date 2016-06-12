json.array!(@cases) do |case|
  json.extract! case, :id, :case_number, :type_id, :sub_type_id, :sub_type_detail, :case_ids, :serial_numbers
  json.url case_url(case, format: :json)
end
