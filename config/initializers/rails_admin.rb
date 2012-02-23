# RailsAdmin config file. Generated on February 23, 2012 23:46
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
  # require 'i18n'
  # I18n.default_locale = :de

  config.current_user_method { current_user } # auto-generated
  
  # If you want to track changes on your models:
  # config.audit_with :history, User
  
  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, User
  
  # Set the admin name here (optional second array element will appear in a beautiful RailsAdmin red ©)
  config.main_app_name = ['Vpapp', 'Admin']
  # or for a dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }


  #  ==> Global show view settings
  # Display empty fields in show views
  # config.compact_show_view = false

  #  ==> Global list view settings
  # Number of default rows per-page:
  # config.default_items_per_page = 20

  #  ==> Included models
  # Add all excluded models here:
  # config.excluded_models = [Donation, DonationYearLink, Donor, Student, User, YearlyDetail]

  # Add models here if you want to go 'whitelist mode':
  # config.included_models = [Donation, DonationYearLink, Donor, Student, User, YearlyDetail]

  # Application wide tried label methods for models' instances
  # config.label_methods << :description # Default is [:name, :title]

  #  ==> Global models configuration
  # config.models do
  #   # Configuration here will affect all included models in all scopes, handle with care!
  #
  #   list do
  #     # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #
  #     fields_of_type :date do
  #       # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #     end
  #   end
  # end
  #
  #  ==> Model specific configuration
  # Keep in mind that *all* configuration blocks are optional.
  # RailsAdmin will try his best to provide the best defaults for each section, for each field.
  # Try to override as few things as possible, in the most generic way. Try to avoid setting labels for models and attributes, use ActiveRecord I18n API instead.
  # Less code is better code!
  # config.model MyModel do
  #   # Cross-section field configuration
  #   object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #   label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #   label_plural 'My models'      # Same, plural
  #   weight -1                     # Navigation priority. Bigger is higher.
  #   parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #   navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  #   # Section specific configuration:
  #   list do
  #     filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #     items_per_page 100    # Override default_items_per_page
  #     sort_by :id           # Sort column (default is primary key)
  #     sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     # Here goes the fields configuration for the list view
  #   end
  # end

  # Your model's configuration, to help you get started:

  # All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible. (visible(true))

  # config.model Donation do
  #   # Found associations:
  #     configure :donor, :belongs_to_association 
  #     configure :donation_year_links, :has_many_association 
  #     configure :yearly_details, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :donor_id, :integer         # Hidden 
  #     configure :amount, :decimal 
  #     configure :status, :string 
  #     configure :donation_type, :string 
  #     configure :comment, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :purpose, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model DonationYearLink do
  #   # Found associations:
  #     configure :donation, :belongs_to_association 
  #     configure :yearly_detail, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :donation_id, :integer         # Hidden 
  #     configure :yearly_detail_id, :integer         # Hidden 
  #     configure :linked_by, :string 
  #     configure :linked_amount, :decimal 
  #     configure :comments, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Donor do
  #   # Found associations:
  #     configure :donations, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :email, :string 
  #     configure :gender, :string 
  #     configure :date_of_birth, :date 
  #     configure :address_first_line, :string 
  #     configure :address_second_line, :string 
  #     configure :address_landmark, :string 
  #     configure :city, :string 
  #     configure :state, :string 
  #     configure :country, :string 
  #     configure :pincode, :string 
  #     configure :phone, :string 
  #     configure :mobile, :string 
  #     configure :comment, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :anonymous, :boolean 
  #     configure :first_name, :string 
  #     configure :last_name, :string 
  #     configure :donor_type, :string 
  #     configure :district, :string 
  #     configure :title, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Student do
  #   # Found associations:
  #     configure :yearly_details, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :district, :string 
  #     configure :taluka, :string 
  #     configure :vp_id, :string 
  #     configure :first_name, :string 
  #     configure :last_name, :string 
  #     configure :father_name, :string 
  #     configure :date_of_birth, :date 
  #     configure :email, :string 
  #     configure :pmt_address_line1, :string 
  #     configure :pmt_address_line2, :string 
  #     configure :pmt_landmark, :string 
  #     configure :pmt_city, :string 
  #     configure :pmt_state, :string 
  #     configure :pmt_country, :string 
  #     configure :pmt_pincode, :string 
  #     configure :pmt_full_address, :text 
  #     configure :cur_address_line1, :string 
  #     configure :cur_address_line2, :string 
  #     configure :cur_landmark, :string 
  #     configure :cur_city, :string 
  #     configure :cur_state, :string 
  #     configure :cur_country, :string 
  #     configure :cur_pincode, :string 
  #     configure :cur_full_address, :text 
  #     configure :primary_phone, :string 
  #     configure :additional_phone, :string 
  #     configure :father_occupation, :string 
  #     configure :mother_occupation, :string 
  #     configure :total_family_income, :string 
  #     configure :gender, :string 
  #     configure :area_type, :string 
  #     configure :caste, :string 
  #     configure :category, :string 
  #     configure :studied_medium, :string 
  #     configure :sslc_percentage, :string 
  #     configure :comments, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model User do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :email, :string 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :reset_password_token, :string         # Hidden 
  #     configure :reset_password_sent_at, :datetime 
  #     configure :remember_created_at, :datetime 
  #     configure :sign_in_count, :integer 
  #     configure :current_sign_in_at, :datetime 
  #     configure :last_sign_in_at, :datetime 
  #     configure :current_sign_in_ip, :string 
  #     configure :last_sign_in_ip, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :role, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model YearlyDetail do
  #   # Found associations:
  #     configure :student, :belongs_to_association 
  #     configure :donation_year_links, :has_many_association 
  #     configure :donations, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :student_id, :integer         # Hidden 
  #     configure :year, :string 
  #     configure :coll_name, :string 
  #     configure :coll_address_line1, :string 
  #     configure :coll_address_line2, :string 
  #     configure :coll_landmark, :string 
  #     configure :coll_city, :string 
  #     configure :coll_state, :string 
  #     configure :coll_country, :string 
  #     configure :coll_pincode, :string 
  #     configure :coll_full_address, :text 
  #     configure :coll_primary_phone, :string 
  #     configure :coll_additional_phone, :string 
  #     configure :result_odd, :string 
  #     configure :result_even, :string 
  #     configure :result_aggregate, :string 
  #     configure :result_year, :string 
  #     configure :course, :string 
  #     configure :stream, :string 
  #     configure :amount_fees, :decimal 
  #     configure :amount_donation, :decimal 
  #     configure :amount_bus_pass, :decimal 
  #     configure :amount_add_on, :decimal 
  #     configure :amount_total, :decimal 
  #     configure :chalan_number, :string 
  #     configure :vr_number, :string 
  #     configure :books_given, :boolean 
  #     configure :books_given_center, :string 
  #     configure :camp_invited, :boolean 
  #     configure :camp_attended, :boolean 
  #     configure :camp_date, :date 
  #     configure :camp_place, :string 
  #     configure :fac_name, :string 
  #     configure :fac_address_line1, :string 
  #     configure :fac_address_line2, :string 
  #     configure :fac_landmark, :string 
  #     configure :fac_city, :string 
  #     configure :fac_state, :string 
  #     configure :fac_country, :string 
  #     configure :fac_pincode, :string 
  #     configure :fac_full_address, :text 
  #     configure :fac_primary_phone, :string 
  #     configure :fac_additional_phone, :string 
  #     configure :letter1_sent, :boolean 
  #     configure :letter2_sent, :boolean 
  #     configure :comments, :text 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
end
