# frozen_string_literal: true

devise_for :admin_users, path: :admin, controllers: {
  sessions: 'admin/admin_users/sessions',
  passwords: 'admin/admin_users/passwords'
}
