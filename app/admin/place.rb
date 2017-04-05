ActiveAdmin.register Place do
  permit_params :name

  actions :edit, :index, :show, :update, :destroy

  filter :name
  filter :user_id
  filter :created_at, as: :date_range

  action_item do
    link_to 'To site', root_path
  end

  index do
    selectable_column
    column :user_id
    column :name
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :user_id
      row :name
      row :created_at
    end
  end

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end
end
