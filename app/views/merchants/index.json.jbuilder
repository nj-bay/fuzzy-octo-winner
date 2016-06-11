json.array!(@merchants) do |merchant|
  json.extract! merchant, :id, :id, :merchant_plan_name, :is_qsr, :is_demo, :mcc_code, :merchant_type_id, :clover_category
  json.url merchant_url(merchant, format: :json)
end
