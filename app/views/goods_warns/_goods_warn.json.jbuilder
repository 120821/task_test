json.extract! goods_warn, :id, :goods_category, :goods_name, :Adequate_warning_value, :Insufficient_warning_value, :Below_warning_value, :remark, :created_at, :updated_at
json.url goods_warn_url(goods_warn, format: :json)
