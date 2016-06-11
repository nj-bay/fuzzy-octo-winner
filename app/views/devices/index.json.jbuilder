json.array!(@devices) do |device|
  json.extract! device, :id, :device_id, :device_event, :serial_number, :device_type_id, :merchant_id
  json.url device_url(device, format: :json)
end
