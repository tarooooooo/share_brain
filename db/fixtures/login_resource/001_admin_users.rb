# frozen_string_literal: true

## admin_userの作成
record_size = 2

record_size.times.each.with_index(1) do |_item, index|
  AdminUser.seed do |a|
    a.id = index
    a.name = "admin user #{index}"
    a.email = "admin#{index}@example.com"
    a.password = 'password'
    a.password_confirmation = 'password'
  end
end
