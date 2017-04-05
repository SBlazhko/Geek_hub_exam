ActiveAdmin.register User do
  permit_params :email

  actions :index, :show, :destroy

  filter :email
  filter :user_id
  filter :created_at, as: :date_range

  action_item do
    link_to 'To site', root_path
  end

  index do
    selectable_column
    column :user_id
    column :email
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :user_id
      row :email
      row :created_at
    end
  end
end
