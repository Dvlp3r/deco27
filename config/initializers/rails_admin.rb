RailsAdmin.config do |config|

  ### Popular gems integration
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)
  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  # config.model 'Category' do
  #   list do
  #     field :name
  #     field :created_at
  #   end
  # end

  config.model Category do
    edit do
      field :name
      field :picture
      field :slug
      field :parent_id, :enum do
        enum do
          Category.all.map { |c| [ "#{c.ancestors.pluck(:name).join('/')}/#{c.name}", c.id ] }.compact
        end
      end
      field :products
    end
  end

  config.model Product do
    edit do
      field :name
      field :description
      field :slug
      field :is_feature
      field :brand
      field :gallery_id
      field :gallery_image
      field :color
      field :product_images
      field :category_id, :enum do
        enum do
          Category.all.map { |c| [ "#{c.ancestors.pluck(:name).join('/')}/#{c.name}", c.id ] unless c.has_children? }.compact
        end
      end
    end
  end
end
